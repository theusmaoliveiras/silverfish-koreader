--[[--
O cartão da Traça na tela inicial do ZenOS, com o mesmo desenho do widget de Android: a Traça com o nome e
a fase embaixo, a fala num balão (o texto do tamanho do balão) e, ao lado ou abaixo, a barra até a próxima
fase, barriga, humor e páginas comidas. Quatro arranjos, pelo formato da linha: baixa e larga (três colunas),
larga (balão em cima, números embaixo, à direita), quadrada (Traça e balão em cima, números embaixo) e
alta e estreita (tudo empilhado).

As cores vêm do tema: o texto, as molduras e as linhas são widgets comuns do KOReader (TextWidget,
FrameContainer, LineWidget), que o KOReader e o Thematic pintam com as cores do tema (preto vira a cor do
texto, branco a do fundo, cinza escuro um texto mais suave). Só a Traça tem as cores dela.
]]

local Blitbuffer = require("ffi/blitbuffer")
local Device = require("device")
local Font = require("ui/font")
local Geom = require("ui/geometry")
local LineWidget = require("ui/widget/linewidget")
local TextBoxWidget = require("ui/widget/textboxwidget")
local TextWidget = require("ui/widget/textwidget")
local Widget = require("ui/widget/widget")
local Screen = Device.screen

local Desenho = require("traca_desenho")
local Estado = require("traca_estado")
local Simple = require("traca_simpleui")

local PRETO, BRANCO, CINZA = Blitbuffer.COLOR_BLACK, Blitbuffer.COLOR_WHITE, Blitbuffer.COLOR_DARK_GRAY

-- Texto ------------------------------------------------------------------------

local faces = {}
local function face(px, negrito)
    px = math.max(4, math.floor(px + 0.5))
    local chave = (negrito and "b" or "r") .. px
    if not faces[chave] then
        local fator = Screen:scaleBySize(1000) / 1000
        local arquivo = negrito and "Silkscreen-Bold.ttf" or "Silkscreen-Regular.ttf"
        local ok, f = pcall(Font.getFace, Font, Desenho.caminhoFonte(arquivo), px / fator)
        faces[chave] = (ok and f) or Font:getFace("cfont", px / fator)
    end
    return faces[chave]
end

--- Uma linha de texto: largura e altura, e como pintá-la (cor do tema; `suave` = texto secundário).
local function linha(texto, px, negrito, suave)
    local t = TextWidget:new{ text = texto, face = face(px, negrito), fgcolor = suave and CINZA or PRETO }
    local tam = t:getSize()
    return { w = tam.w, h = tam.h, t = t }
end

local function pintarLinha(bb, l, x, y) l.t:paintTo(bb, math.floor(x), math.floor(y)) end
local function soltar(l) if l and l.t then l.t:free() end end

-- O menor texto que vale a pena mostrar.
local function minimo() return Screen:scaleBySize(9) end

-- Formas, nas cores do tema ----------------------------------------------------

--- Retângulo cheio na cor do texto (ou do fundo, com `fundo`).
local function cheio(bb, x, y, w, h, fundo)
    if w <= 0 or h <= 0 then return end
    LineWidget:new{ dimen = Geom:new{ w = math.floor(w), h = math.floor(h) }, background = fundo and BRANCO or PRETO }
        :paintTo(bb, math.floor(x), math.floor(y))
end

--- Caixa com borda na cor do texto e miolo na cor do fundo. A borda é feita de linhas, não a de um
-- FrameContainer: o Thematic pinta a borda dele por outro caminho, e ela saía cinza em vez da cor do texto.
local function caixa(bb, x, y, w, h, borda)
    if w <= 0 or h <= 0 then return end
    x, y, w, h = math.floor(x), math.floor(y), math.floor(w), math.floor(h)
    local b = math.max(1, math.floor(borda))
    cheio(bb, x, y, w, h, true)
    cheio(bb, x, y, w, b); cheio(bb, x, y + h - b, w, b)
    cheio(bb, x, y, b, h); cheio(bb, x + w - b, y, b, h)
end

-- A Traça ----------------------------------------------------------------------

--- O desenho, recortado ao que está pintado, no maior tamanho inteiro que cabe em `lado`, centralizado.
-- Onde o último desenho da Traça caiu (para o toque de carinho, em traca_zenos.lua).
local area_bicho = nil

local function pintarBicho(bb, nome, x, y, lado)
    local c = Simple.caixaReal(nome)
    local bw, bh = c[3] - c[1] + 1, c[4] - c[2] + 1
    local escala = math.max(1, math.floor(math.min(lado / bw, lado / bh)))
    local ox = math.floor(x + (lado - bw * escala) / 2) - c[1] * escala
    local oy = math.floor(y + (lado - bh * escala) / 2) - c[2] * escala
    Desenho.pintarSprite(bb, nome, ox, oy, escala)
end

--- A Traça com o nome embaixo e, se couber legível deixando 40% para ela, "OVO · GEN 1".
local function colunaBicho(bb, d, x, y, cw, ch)
    local nome = linha(d.nome, ch * 0.15, true)
    if nome.w > cw then soltar(nome); nome = linha(d.nome, ch * 0.15 * cw / math.max(1, nome.w), true) end
    local gap = nome.h * 0.25
    local px = math.max(ch * 0.15 * 0.6, minimo())  -- 60% do nome, mas nunca menor que legível
    local fase = linha(d.fase, px, false, true)
    if fase.w > cw then soltar(fase); fase = linha(d.fase, px * cw / math.max(1, fase.w), false, true) end
    local com_fase = (ch - nome.h - gap - fase.h - gap * 0.5) >= ch * 0.4
    local texto_h = nome.h + gap + (com_fase and (fase.h + gap * 0.5) or 0)
    local lado = math.min(cw, ch - texto_h)
    local topo = y + (ch - (lado + texto_h)) / 2
    if lado > 0 then
        pintarBicho(bb, d.sprite, x + (cw - lado) / 2, topo, lado)
        -- o toque de carinho: o quadrado reservado para ela até o nome (não só os pixels do desenho, que
        -- no ovo são pequenos)
        area_bicho = { x = x + (cw - lado) / 2, y = topo, w = lado, h = lado + gap }
    end
    pintarLinha(bb, nome, x + (cw - nome.w) / 2, topo + lado + gap)
    if com_fase then pintarLinha(bb, fase, x + (cw - fase.w) / 2, topo + lado + gap + nome.h + gap * 0.5) end
    soltar(nome); soltar(fase)
end

-- O balão ----------------------------------------------------------------------

--- Balão com borda de "pixels" e o rabinho apontando para a Traça (à esquerda, ou para cima com
-- `para_cima`); a fala no maior tamanho em que cabe sem quebrar palavra.
local function balao(bb, x, y, w, h, texto, para_cima)
    if w <= 0 or h <= 0 then return end
    local b = math.max(2, math.floor(math.min(w, h) * 0.025))
    caixa(bb, x, y, w, h, b)
    if para_cima then
        local tx = math.floor(x + w / 2)
        cheio(bb, tx - b, y, 3 * b, b, true)            -- abre a borda onde o rabinho encosta
        cheio(bb, tx - 2 * b, y - b, b, b); cheio(bb, tx - b, y - 2 * b, b, b); cheio(bb, tx, y - 3 * b, b, b)
        cheio(bb, tx + b, y - 2 * b, b, b); cheio(bb, tx + 2 * b, y - b, b, b)
    else
        local ty = math.floor(y + h / 2)
        cheio(bb, x, ty - b, b, 3 * b, true)
        cheio(bb, x - b, ty - 2 * b, b, b); cheio(bb, x - 2 * b, ty - b, b, b); cheio(bb, x - 3 * b, ty, b, b)
        cheio(bb, x - 2 * b, ty + b, b, b); cheio(bb, x - b, ty + 2 * b, b, b)
    end
    if not texto or texto == "" then return end
    local dentro = math.max(4 * b, math.min(w, h) * 0.1)
    local tw, th = math.floor(w - 2 * dentro), h - 2 * dentro
    if tw <= 0 or th <= 0 then return end
    local palavras = {}
    for p in texto:gmatch("%S+") do palavras[#palavras + 1] = p end
    local function cabe(px)
        local f = face(px)
        for _, p in ipairs(palavras) do
            local t = TextWidget:new{ text = p, face = f }
            local pw = t:getSize().w
            t:free()
            if pw > tw then return false end
        end
        local caixa_t = TextBoxWidget:new{ text = texto, face = f, width = tw, alignment = "center" }
        local altura = caixa_t:getSize().h
        caixa_t:free()
        return altura <= th
    end
    local lo, hi = 4, th
    for _ = 1, 12 do
        local meio = (lo + hi) / 2
        if cabe(meio) then lo = meio else hi = meio end
    end
    local t = TextBoxWidget:new{ text = texto, face = face(lo), width = tw, alignment = "center", fgcolor = PRETO }
    local altura = t:getSize().h
    t:paintTo(bb, math.floor(x + dentro), math.floor(y + (h - altura) / 2))
    t:free()
end

-- Os números -------------------------------------------------------------------

--- O bloco no tamanho `s`: { altura, largura que pede, pintar(bb, x, y) }. Barra, "2 PÁGINAS PARA NINFA",
-- BARRIGA e HUMOR com as bolinhas, PÁGINAS COMIDAS com as de hoje.
local function bloco(d, s, cw)
    local gap = s * 0.5
    local barra_h = math.max(3, s * 0.55)
    local dot, dot_gap = s * 0.8, s * 0.3
    local dots_w = 4 * dot + 3 * dot_gap
    local prox = linha(d.proxima, s, false, true)
    local barriga = linha(d.barriga, s)
    local humor = linha(d.humor, s)
    local paginas = linha(d.paginas, s)
    local hoje = linha(d.hoje, s, false, true)
    local largura = math.max(prox.w, barriga.w + s + dots_w, humor.w + s + dots_w, paginas.w + s + hoje.w)
    local lh = barriga.h
    local altura = barra_h + gap + prox.h + gap * 1.2 + lh * 3 + gap * 0.7 * 2
    local function pintar(bb, x, y)
        local b = math.max(1, math.floor(barra_h * 0.18))
        caixa(bb, x, y, cw, barra_h, b)
        cheio(bb, x, y, math.max(barra_h, cw * d.fracao), barra_h)
        y = y + barra_h + gap
        pintarLinha(bb, prox, x, y); y = y + prox.h + gap * 1.2
        local function bolinhas(cheias, yy)
            for i = 0, 3 do
                local dx = x + cw - dots_w + i * (dot + dot_gap)
                local dy = yy + (lh - dot) / 2
                if i < cheias then cheio(bb, dx, dy, dot, dot) else caixa(bb, dx, dy, dot, dot, math.max(1, dot * 0.15)) end
            end
        end
        pintarLinha(bb, barriga, x, y); bolinhas(d.barriga_bolinhas, y); y = y + lh + gap * 0.7
        pintarLinha(bb, humor, x, y); bolinhas(d.humor_bolinhas, y); y = y + lh + gap * 0.7
        pintarLinha(bb, paginas, x, y)
        pintarLinha(bb, hoje, x + cw - hoje.w, y + (lh - hoje.h) / 2)
    end
    local function liberar() soltar(prox); soltar(barriga); soltar(humor); soltar(paginas); soltar(hoje) end
    return { altura = altura, largura = largura, pintar = pintar, liberar = liberar, s = s }
end

--- O bloco no maior tamanho que cabe em `cw` x `ch`.
local function blocoQueCabe(d, cw, ch)
    local lo, hi = 3, math.max(4, ch / 4)
    for _ = 1, 12 do
        local meio = (lo + hi) / 2
        local b = bloco(d, meio, cw)
        local ok = b.altura <= ch and b.largura <= cw
        b.liberar()
        if ok then lo = meio else hi = meio end
    end
    return bloco(d, lo, cw)
end

-- Os quatro arranjos -----------------------------------------------------------

local function curto(bb, d, x, y, w, h)       -- baixo e largo: Traça | balão | números
    local pad = h * 0.1
    local ah = h - 2 * pad
    local col = math.min(ah * 0.9, w * 0.17)
    colunaBicho(bb, d, x + pad, y + pad, col, ah)
    local cx = x + pad + col + pad
    local resto = x + w - pad - cx
    local cw = d.fala and resto * 0.5 or resto
    local b = blocoQueCabe(d, cw, ah)
    local sx = x + w - pad - cw
    b.pintar(bb, sx, y + (h - b.altura) / 2); b.liberar()
    if d.fala then
        local bx = cx + math.max(6, ah * 0.06)
        balao(bb, bx, y + pad, sx - pad - bx, ah, d.fala)
    end
end

local function largo(bb, d, x, y, w, h)       -- Traça à esquerda; balão em cima e números embaixo, à direita
    local pad = math.min(w, h) * 0.08
    local ah = h - 2 * pad
    local col = math.min(ah, w * 0.3)
    colunaBicho(bb, d, x + pad, y + pad, col, ah)
    local cx = x + pad + col + pad
    local cw = x + w - pad - cx
    local bh = d.fala and ah * 0.4 or 0
    local nh = ah - bh - (d.fala and pad or 0)
    local b = blocoQueCabe(d, cw, nh)
    b.pintar(bb, cx, y + h - pad - nh + (nh - b.altura) / 2); b.liberar()
    if d.fala then
        local bx = cx + math.max(6, bh * 0.06)
        balao(bb, bx, y + pad, x + w - pad - bx, bh, d.fala)
    end
end

local function quadrado(bb, d, x, y, w, h)    -- Traça e balão em cima; números embaixo
    local pad = math.min(w, h) * 0.07
    local cw = w - 2 * pad
    local b = blocoQueCabe(d, cw, (h - 2 * pad) * 0.5)
    local topo_h = h - 2 * pad - b.altura - pad
    b.pintar(bb, x + pad, y + h - pad - b.altura); b.liberar()
    if d.fala then
        local col = math.min(topo_h, cw * 0.4)
        colunaBicho(bb, d, x + pad, y + pad, col, topo_h)
        local bx = x + pad + col + pad + math.max(6, topo_h * 0.06)
        balao(bb, bx, y + pad, x + w - pad - bx, topo_h, d.fala)
    else
        colunaBicho(bb, d, x + pad, y + pad, cw, topo_h)
    end
end

local function alto(bb, d, x, y, w, h)        -- alto e estreito: Traça, balão (rabinho para cima), números
    local pad = w * 0.08
    local cw = w - 2 * pad
    local ah = h - 2 * pad
    local b = blocoQueCabe(d, cw, ah * 0.32)
    b.pintar(bb, x + pad, y + h - pad - b.altura); b.liberar()
    local resto = ah - b.altura - pad
    local bicho_h = d.fala and resto * 0.5 or resto
    colunaBicho(bb, d, x + pad, y + pad, cw, bicho_h)
    if d.fala then
        local rabo = math.max(6, cw * 0.06)
        balao(bb, x + pad, y + pad + bicho_h + rabo, cw, resto - bicho_h - rabo, d.fala, true)
    end
end

-- O cartão ---------------------------------------------------------------------

--- O que o cartão mostra, tirado da Traça agora (o tempo já passado).
local function dados(traca)
    local s, agora = traca.estado, os.time()
    Estado.passarTempo(s, agora)
    local fase = Estado.fase(s)
    local prog = Estado.progressoFase(s)
    local ok, fala = pcall(Simple.pensamento, traca, function() return 1 end)
    local function maius(t) return tostring(t or ""):upper() end
    return {
        nome = maius(s.nome or fase.titulo),
        fase = maius(fase.titulo) .. " · GEN " .. tostring(s.geracao or 1),
        sprite = Estado.sprite(s, agora),
        fracao = prog.fracao or 0,
        proxima = prog.proxima and (prog.paginas .. " PAGES TO " .. maius(prog.proxima.titulo))
            or ((s.paginas or 0) .. " PAGES EATEN"),
        barriga = "BELLY: " .. maius(Estado.rotuloBarriga(s)),
        humor = "MOOD: " .. maius(Estado.rotuloHumor(s)),
        barriga_bolinhas = Estado.bolinhas(s.barriga),
        humor_bolinhas = Estado.bolinhas(s.humor),
        paginas = "PAGES EATEN: " .. tostring(s.paginas or 0),
        hoje = tostring(Estado.paginasHoje(s, agora)) .. " TODAY",
        -- a resposta a um carinho dado aqui, por alguns minutos; senão o que ela está pensando
        fala = (traca._reacao_cartao and agora < traca._reacao_cartao.ate and traca._reacao_cartao.texto)
            or (ok and fala and fala ~= "" and fala) or nil,
    }
end

local Cartao = Widget:extend{ traca = nil, largura = 0, altura = 0 }

function Cartao:getSize() return Geom:new{ w = self.largura, h = self.altura } end

function Cartao:paintTo(bb, x, y)
    self.dimen = Geom:new{ x = x, y = y, w = self.largura, h = self.altura }
    area_bicho = nil
    local w, h = self.largura, self.altura
    local d = dados(self.traca)
    if w >= h * 2.2 then curto(bb, d, x, y, w, h)
    elseif w >= h * 1.3 then largo(bb, d, x, y, w, h)
    elseif w >= h * 0.75 then quadrado(bb, d, x, y, w, h)
    else alto(bb, d, x, y, w, h) end
    -- onde a Traça está, um pouco maior, para o dedo
    if area_bicho then
        local a, folga = area_bicho, math.max(area_bicho.w, area_bicho.h) * 0.1
        self.bicho = Geom:new{ x = a.x - folga, y = a.y - folga, w = a.w + 2 * folga, h = a.h + 2 * folga }
    else
        self.bicho = nil
    end
end

--- Carinho dado tocando a Traça no cartão: o mesmo da tela dela (TracaTela:carinho), um por hora e nada no
-- casulo, e a resposta dela fica no balão por alguns minutos.
local REACAO_SEGUNDOS = 5 * 60

function Cartao.carinho(traca)
    local T = require("traca_lingua").t
    local texto
    if traca:carinho() then
        texto = Estado.falaPropria(traca.estado, "carinho") or T"Hm. Tá. Pode continuar."
    elseif traca.estado.hibernando then
        texto = Estado.falaPropria(traca.estado, "casulo") or T"(escondida na lombada; leia uma página para ela sair)"
    else
        texto = T"Já chega de carinho por agora."
    end
    traca._reacao_cartao = { texto = texto, ate = os.time() + REACAO_SEGUNDOS }
end

-- Se algo falhar ao desenhar, a Home continua (o cartão fica em branco).
require("traca_guarda").padrao:envolver(Cartao, { "paintTo" })

return Cartao
