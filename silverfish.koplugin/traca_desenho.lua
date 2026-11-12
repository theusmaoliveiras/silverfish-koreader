--[[--
Desenho da Traça: pinta os sprites em pixel art e gera a imagem da tela de descanso.
]]

local Blitbuffer = require("ffi/blitbuffer")
local Device = require("device")
local Font = require("ui/font")
local Geom = require("ui/geometry")
local TextBoxWidget = require("ui/widget/textboxwidget")
local TextWidget = require("ui/widget/textwidget")
local Widget = require("ui/widget/widget")
local Screen = Device.screen

local Estado = require("traca_estado")
local Species = require("traca_species")
-- The drawings of the active species (the silverfish unless another one is awake); with `cor`, the colour ones.
local function Sprites(cor) return Species.sprites(cor) end

local Desenho = {}

-- Pasta do plugin, tirada do próprio arquivo ("plugins/traca.koplugin", ou outro nome, ou um caminho absoluto).
local PASTA = debug.getinfo(1, "S").source:match("^@(.*)/[^/]*$") or "plugins/traca.koplugin"

--- Caminho de uma fonte da pasta `fontes` para o Font:getFace do KOReader, que procura a partir da pasta de
-- fontes dele (./fonts). Funciona com qualquer nome de pasta do plugin.
function Desenho.caminhoFonte(arquivo)
    if PASTA:sub(1, 1) == "/" then
        return string.rep("../", 16) .. PASTA:sub(2) .. "/fontes/" .. arquivo  -- sobe até a raiz e desce
    end
    return "../" .. (PASTA:gsub("^%./", "")) .. "/fontes/" .. arquivo
end

-- Every drawing is 64x64 pixels.
Desenho.LARGURA, Desenho.ALTURA = 64, 64

local RGB = {}
for _, t in ipairs({ "TYPE_BBRGB16", "TYPE_BBRGB24", "TYPE_BBRGB32" }) do
    if Blitbuffer[t] then RGB[Blitbuffer[t]] = true end
end

local function telaEmCores()
    if not (Screen.isColorEnabled and Blitbuffer.ColorRGB32) then return false end  -- older KOReader
    local ok, sim = pcall(Screen.isColorEnabled, Screen)
    return ok and sim == true
end

--- Whether to paint in colour: KOReader shows colour (a colour screen, with KOReader's colour rendering on) and
-- `bb`, when given, holds colour. Otherwise the black and white drawings, as on a Kindle Paperwhite.
function Desenho.usarCor(bb)
    if not telaEmCores() then return false end
    if bb == nil then return true end
    local ok, tipo = pcall(bb.getType, bb)
    return ok and RGB[tipo] == true and bb.paintRectRGB32 ~= nil
end

--- A blank image for the screens painted off screen (the sleep screen): in colour when the screen shows colour.
-- Imagens feitas aqui (tela de descanso, demonstração) viram arquivos: guardam as cores de verdade, mesmo no
-- modo noturno (ver Desenho.pintarSprite).
local imagens = setmetatable({}, { __mode = "k" })

function Desenho.novoBuffer(w, h)
    local bb = Blitbuffer.new(w, h, Desenho.usarCor() and Blitbuffer.TYPE_BBRGB32 or Blitbuffer.TYPE_BB8)
    imagens[bb] = true
    return bb
end

-- The ink of each character of the drawings (`_cores` in the drawing files), per species and mode. A gray is
-- painted as a gray; a colour is painted as a colour only in colour mode.
local tintas = {}
local function tintasDe(cor)
    local chave = Species.current().id .. (cor and ":cor" or "")
    if not tintas[chave] then
        local t = {}
        for ch, v in pairs(Sprites(cor)._cores or {}) do
            local r, g, b = math.floor(v / 65536) % 256, math.floor(v / 256) % 256, v % 256
            local lum = math.floor(0.299 * r + 0.587 * g + 0.114 * b + 0.5)
            local cinza = r == g and g == b
            if cor and not cinza then
                t[ch] = { cor = Blitbuffer.ColorRGB32(r, g, b, 0xFF), rgb = true, cinza = false, lum = lum }
            else
                t[ch] = { cor = Blitbuffer.Color8(lum), rgb = false, cinza = cinza, lum = lum }
            end
        end
        tintas[chave] = t
    end
    return tintas[chave]
end

-- Cada tinta com a cor oposta, para o modo noturno.
local opostas = setmetatable({}, { __mode = "k" })
local function oposta(t)
    local o = opostas[t]
    if not o then
        o = { cor = t.cor:invert(), rgb = t.rgb, cinza = t.cinza, lum = 255 - (t.lum or 0) }
        opostas[t] = o
    end
    return o
end

local function pintarTinta(bb, x, y, w, h, tinta)
    if tinta.rgb then bb:paintRectRGB32(x, y, w, h, tinta.cor) else bb:paintRect(x, y, w, h, tinta.cor) end
end

--- Linhas de um desenho (para saber o tamanho).
function Desenho.sprite(nome)
    return Sprites()[Desenho.resolver(nome)]
end

local topos = {}  -- per species: "<species>:<drawing>"
--- Primeira linha com pixels do desenho (onde começa a cabeça/antena).
function Desenho.topoReal(nome)
    local real = Desenho.resolver(nome)
    local chave = Species.current().id .. ":" .. real
    if topos[chave] == nil then
        topos[chave] = 0
        for i, l in ipairs(Sprites()[real] or {}) do
            if l:find("[^ ]") then topos[chave] = i - 1; break end
        end
    end
    return topos[chave]
end

--- Nome de um desenho que existe: o próprio ou, se aquela variação
-- (ex.: "ninfa_feliz") ainda não foi desenhada, o desenho da fase ("ninfa").
function Desenho.resolver(nome)
    if nome and Sprites()[nome] then return nome end
    local fase = nome and nome:match("^([^_]+)")
    if fase and Sprites()[fase] then return fase end
    return "ovo"
end

--- Quadros de animação que existem de verdade, ou nil se não há o que animar.
function Desenho.quadros(lista)
    if not lista then return nil end
    local reais, diferentes, visto = {}, 0, {}
    for i, nome in ipairs(lista) do
        reais[i] = Desenho.resolver(nome)
        if not visto[reais[i]] then visto[reais[i]] = true; diferentes = diferentes + 1 end
    end
    if diferentes < 2 then return nil end
    return reais
end

--- Pinta o sprite `nome` com cada pixel virando um quadrado de `escala` px, em cores quando `bb` e a tela
-- mostram cor (Desenho.usarCor). `trocar(linha, tinta)`, opcional, devolve a tinta a usar naquela linha do
-- desenho (o Bookshelf escurece a sombrinha); cada tinta tem `cinza` e `lum` (0 a 255).
--
-- No modo noturno o KOReader inverte a tela inteira depois de pintar, e o desenho sairia com as cores trocadas
-- (a traça lilás ficava oliva). Na tela, então, cada cor é pintada já invertida, como o KOReader faz com as
-- capas dos livros, para aparecer como é. Nas imagens que viram arquivo (Desenho.novoBuffer), não.
function Desenho.pintarSprite(bb, nome, x, y, escala, trocar)
    local cor = Desenho.usarCor(bb)
    local linhas = Sprites(cor)[Desenho.resolver(nome)]
    if not linhas then return end
    local tinta = tintasDe(cor)
    local inverter = Screen.night_mode and not imagens[bb]
    for j, linha in ipairs(linhas) do
        -- junta pixels vizinhos da mesma cor num retângulo só
        local i, n = 1, #linha
        while i <= n do
            local c = linha:sub(i, i)
            local k = i
            while k < n and linha:sub(k + 1, k + 1) == c do k = k + 1 end
            local t = tinta[c]
            if t and trocar then t = trocar(j, t) end
            if t and inverter then t = oposta(t) end
            if t then
                pintarTinta(bb, x + (i - 1) * escala, y + (j - 1) * escala, (k - i + 1) * escala, escala, t)
            end
            i = k + 1
        end
    end
end

--- Widget que mostra um sprite.
Desenho.SpriteWidget = Widget:extend{
    nome = nil,
    escala = 8,
}

function Desenho.SpriteWidget:getSize()
    return Geom:new{ w = Desenho.LARGURA * self.escala, h = Desenho.ALTURA * self.escala }
end

function Desenho.SpriteWidget:paintTo(bb, x, y)
    self.dimen = Geom:new{ x = x, y = y, w = Desenho.LARGURA * self.escala, h = Desenho.ALTURA * self.escala }
    Desenho.pintarSprite(bb, self.nome, x, y, self.escala)
end

--- Escala inteira que faz o sprite caber em `largura` x `altura`.
function Desenho.escalaPara(largura, altura)
    return math.max(1, math.floor(math.min(largura / Desenho.LARGURA, altura / Desenho.ALTURA)))
end

local function pintarBarra(bb, x, y, w, h, fracao)
    local borda = math.max(2, math.floor(h / 8))
    bb:paintRect(x, y, w, h, Blitbuffer.COLOR_BLACK)
    bb:paintRect(x + borda, y + borda, w - 2 * borda, h - 2 * borda, Blitbuffer.COLOR_WHITE)
    local cheio = math.floor((w - 4 * borda) * math.max(0, math.min(1, fracao)))
    if cheio > 0 then
        bb:paintRect(x + 2 * borda, y + 2 * borda, cheio, h - 4 * borda, Blitbuffer.COLOR_DARK_GRAY)
    end
end

local function textoCentrado(bb, texto, face, largura_tela, y, largura_max)
    local w = TextBoxWidget:new{
        text = texto,
        face = face,
        width = largura_max,
        alignment = "center",
    }
    local tam = w:getSize()
    w:paintTo(bb, math.floor((largura_tela - tam.w) / 2), y)
    w:free()
    return tam.h
end

local function milhar(n)  -- 1.234 em português, 1,234 em inglês
    local sep = require("traca_lingua").ingles() and "," or "."
    local s = tostring(math.floor(n))
    local r = s:reverse():gsub("(%d%d%d)", "%1" .. sep):reverse()
    return (r:gsub("^%p", ""))
end
Desenho.milhar = milhar

--- Gera a imagem da tela de descanso (PNG em tons de cinza, ou em cores quando a tela mostra cor) em `caminho`.
function Desenho.gerarTelaDescanso(s, caminho, agora)
    local sw, sh = Screen:getWidth(), Screen:getHeight()
    local w, h = math.min(sw, sh), math.max(sw, sh) -- a tela de descanso é sempre em pé
    local bb = Desenho.novoBuffer(w, h)
    bb:fill(Blitbuffer.COLOR_WHITE)

    local margem = math.floor(w * 0.08)
    local escala = Desenho.escalaPara(w - 2 * margem, h * 0.45)
    local sprite_w, sprite_h = Desenho.LARGURA * escala, Desenho.ALTURA * escala
    local y = math.floor(h * 0.16)

    y = y + textoCentrado(bb, "Traça", Font:getFace("tfont", 34), w, math.floor(h * 0.06), w - 2 * margem)
    local pose = Estado.POSES[math.random(#Estado.POSES)]
    Desenho.pintarSprite(bb, Estado.sprite(s, agora, true, pose), math.floor((w - sprite_w) / 2), y, escala)
    y = y + sprite_h + math.floor(h * 0.04)

    y = y + textoCentrado(bb, Estado.fala(s, agora, nil, true), Font:getFace("cfont", 26), w, y, w - 2 * margem)
    y = y + math.floor(h * 0.04)

    local face_rotulo = Font:getFace("cfont", 20)
    local barra_w = math.floor((w - 2 * margem) * 0.62)
    local barra_h = math.floor(h * 0.022)
    for _, item in ipairs({ { "Barriga", s.barriga }, { "Humor", s.humor } }) do
        local rotulo = TextWidget:new{ text = item[1], face = face_rotulo }
        local rw = rotulo:getSize()
        local x0 = math.floor((w - (barra_w + rw.w + margem / 2)) / 2)
        rotulo:paintTo(bb, x0, y + math.floor((barra_h - rw.h) / 2))
        rotulo:free()
        pintarBarra(bb, x0 + rw.w + math.floor(margem / 2), y, barra_w, barra_h, item[2] / 100)
        y = y + barra_h + math.floor(h * 0.02)
    end

    local fase = Estado.fase(s)
    local rodape = string.format("%s · %s letras comidas", fase.titulo, milhar(s.letras))
    textoCentrado(bb, rodape, Font:getFace("cfont", 18), w, h - math.floor(h * 0.08), w - 2 * margem)

    local ok, err = pcall(bb.writePNG, bb, caminho)
    bb:free()
    return ok, err
end

return Desenho
