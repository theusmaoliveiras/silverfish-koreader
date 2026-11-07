--[[--
Tela da Traça, desenhada como no Figma ("Traça Agent Sprites", 618x824).

Tudo é pintado direto na tela em coordenadas do Figma multiplicadas por K
(no Paperwhite 1236x1648, K = 2). A fonte é a Silkscreen (OFL), em fontes/.

Toques: no bichinho = carinho; na engrenagem ou segurando no bichinho = ajustes
(tela de descanso, abrir ao iniciar, atalho por gesto, idioma); no X = fechar.
]]

local Blitbuffer = require("ffi/blitbuffer")
local ButtonDialog = require("ui/widget/buttondialog")
local Device = require("device")
local Font = require("ui/font")
local Geom = require("ui/geometry")
local GestureRange = require("ui/gesturerange")
local InputContainer = require("ui/widget/container/inputcontainer")
local TextBoxWidget = require("ui/widget/textboxwidget")
local TextWidget = require("ui/widget/textwidget")
local UIManager = require("ui/uimanager")
local Screen = Device.screen

local Desenho = require("traca_desenho")
local T = require("traca_lingua").t
local Estado = require("traca_estado")
local Memoria = require("traca_memoria")
local Species = require("traca_species")
local Brood = require("traca_brood")
local Tracos = require("traca_tracos")

local QUADRO_SEGUNDOS = 1.2      -- tempo entre quadros da animação
local ANIMACAO_MINUTOS = 5       -- animação normal para sozinha depois disso

local LARG, ALT = 618, 824       -- tamanho do frame no Figma

local PRETO = Blitbuffer.COLOR_BLACK
local BRANCO = Blitbuffer.COLOR_WHITE
local CINZA_55 = Blitbuffer.Color8(0x55)
local CINZA_BB = Blitbuffer.Color8(0xBB)

-- Ícones do cartão de status, em pontos do Figma (x, y, largura, altura), relativos ao cartão.
local ICONE_LIVRO = {
    { 17, 17, 12, 3 }, { 35, 17, 12, 3 }, { 14, 20, 3, 3 }, { 29, 20, 6, 3 }, { 47, 20, 3, 3 },
    { 14, 23, 3, 3 }, { 29, 23, 6, 3 }, { 47, 23, 3, 3 }, { 14, 26, 3, 3 }, { 29, 26, 6, 3 },
    { 47, 26, 3, 3 }, { 14, 29, 3, 3 }, { 29, 29, 6, 3 }, { 47, 29, 3, 3 }, { 14, 32, 12, 3 },
    { 29, 32, 6, 3 }, { 38, 32, 12, 3 }, { 26, 35, 12, 3 },
}
local ICONE_CARA = {
    { 25, 62, 15, 3 }, { 22, 65, 3, 3 }, { 40, 65, 3, 3 }, { 19, 68, 3, 3 }, { 43, 68, 3, 3 },
    { 19, 71, 3, 3 }, { 25, 71, 6, 3 }, { 34, 71, 6, 3 }, { 43, 71, 3, 3 }, { 19, 74, 3, 3 },
    { 43, 74, 3, 3 }, { 19, 77, 3, 3 }, { 28, 77, 9, 3 }, { 43, 77, 3, 3 }, { 19, 80, 3, 3 },
    { 25, 80, 3, 3 }, { 37, 80, 3, 3 }, { 43, 80, 3, 3 }, { 22, 83, 3, 3 }, { 40, 83, 3, 3 },
    { 25, 86, 15, 3 },
}
-- Nome das fases em maiúsculas no cartão de fase (string.upper não sabe o "ã" de anciã).
local TITULO_FASE = { ovo = T"OVO", ninfa = T"NINFA", jovem = T"JOVEM", adulta = T"ADULTA", ancia = T"ANCIÃ",
                      filhote = T"FILHOTE", adulto = T"ADULTO", velho = T"VELHO" }  -- the cat's (traca_species.lua)

-- Ampulheta do cartão de fase (relativa ao cartão).
local ICONE_AMPULHETA = {
    { 14, 79, 10, 2 }, { 14, 81, 2, 2 }, { 22, 81, 2, 2 }, { 16, 83, 2, 2 }, { 20, 83, 2, 2 },
    { 18, 85, 2, 2 }, { 16, 87, 2, 2 }, { 20, 87, 2, 2 }, { 14, 89, 2, 2 }, { 18, 89, 2, 2 },
    { 22, 89, 2, 2 }, { 14, 91, 10, 2 },
}
-- Engrenagem do botão de ajustes (24x24, relativa ao seu canto).
-- Menu (☰) do botão das seções, 24x24 como a engrenagem: três barras de 2 de altura (06/11/2026, no lugar do
-- botão ARQUIVO, para o nome do bicho ganhar espaço no topo).
local ICONE_MENU = { { 2, 5, 20, 2 }, { 2, 11, 20, 2 }, { 2, 17, 20, 2 } }
local ICONE_ENGRENAGEM = {
    { 10, 0, 4, 1 }, { 9, 1, 6, 1 }, { 3, 2, 4, 1 }, { 9, 2, 2, 1 }, { 13, 2, 2, 1 },
    { 17, 2, 4, 1 }, { 2, 3, 9, 1 }, { 13, 3, 9, 1 }, { 2, 4, 2, 2 }, { 6, 4, 4, 1 },
    { 14, 4, 4, 1 }, { 20, 4, 2, 2 }, { 2, 6, 3, 1 }, { 19, 6, 3, 1 }, { 3, 7, 2, 2 },
    { 19, 7, 2, 2 }, { 9, 8, 6, 1 }, { 1, 9, 4, 1 }, { 8, 9, 8, 1 }, { 19, 9, 4, 1 },
    { 0, 10, 4, 1 }, { 8, 10, 2, 4 }, { 14, 10, 2, 4 }, { 20, 10, 4, 1 }, { 0, 11, 2, 2 },
    { 22, 11, 2, 2 }, { 0, 13, 4, 1 }, { 20, 13, 4, 1 }, { 1, 14, 4, 1 }, { 8, 14, 8, 1 },
    { 19, 14, 4, 1 }, { 3, 15, 2, 2 }, { 9, 15, 6, 1 }, { 19, 15, 2, 2 }, { 2, 17, 3, 1 },
    { 19, 17, 3, 1 }, { 2, 18, 2, 2 }, { 20, 18, 2, 2 }, { 6, 19, 4, 1 }, { 14, 19, 4, 1 },
    { 2, 20, 9, 1 }, { 13, 20, 9, 1 }, { 3, 21, 4, 1 }, { 9, 21, 2, 1 }, { 13, 21, 2, 1 },
    { 17, 21, 4, 1 }, { 9, 22, 6, 1 }, { 10, 23, 4, 1 },
}

local TracaTela = InputContainer:extend{
    traca = nil,    -- instância do plugin
    mensagem = nil, -- fala especial (ex.: resposta ao carinho)
}

function TracaTela:init()
    if Device:hasKeys() then
        self.key_events.Close = { { Device.input.group.Back } }
    end
    if Device:isTouchDevice() then
        self.ges_events.Tap = { GestureRange:new{ ges = "tap", range = function() return self.dimen end } }
        self.ges_events.Hold = { GestureRange:new{ ges = "hold", range = function() return self.dimen end } }
    end
    self.covers_fullscreen = true
    local tam = Screen:getSize()
    self.dimen = Geom:new{ x = 0, y = 0, w = tam.w, h = tam.h }
    -- escala do Figma para a tela, e margem para centralizar se a proporção não bater
    self.k = math.min(tam.w / LARG, tam.h / ALT)
    self.ox = math.floor((tam.w - LARG * self.k) / 2)
    self.oy = math.floor((tam.h - ALT * self.k) / 2)
    -- fator que o KOReader aplica aos tamanhos de fonte; compensado em face()
    self.fator_fonte = Screen:scaleBySize(1000) / 1000
    self.faces = {}
    self.tick = function() self:proximoQuadro() end
    self:prepararSprite()
    self:iniciarAnimacao()
end

-- Utilidades de desenho ---------------------------------------------------------

function TracaTela:px(v)
    return math.floor(v * self.k + 0.5)
end

--- Face da Silkscreen com altura `tam` em pontos do Figma.
function TracaTela:face(negrito, tam)
    local chave = (negrito and "b" or "r") .. tam
    if not self.faces[chave] then
        local arquivo = negrito and "Silkscreen-Bold.ttf" or "Silkscreen-Regular.ttf"
        local caminho = Desenho.caminhoFonte(arquivo)
        local ok, f = pcall(Font.getFace, Font, caminho, tam * self.k / self.fator_fonte)
        if not ok or not f then f = Font:getFace("cfont", tam * self.k / self.fator_fonte) end
        self.faces[chave] = f
    end
    return self.faces[chave]
end

function TracaTela:ret(bb, x, y, w, h, cor)
    local x0, y0 = self.ox + self:px(x), self.oy + self:px(y)
    local x1, y1 = self.ox + self:px(x + w), self.oy + self:px(y + h)
    if x1 > x0 and y1 > y0 then bb:paintRect(x0, y0, x1 - x0, y1 - y0, cor) end
end

function TracaTela:retangulos(bb, lista, dx, dy, cor)
    for _, r in ipairs(lista) do self:ret(bb, dx + r[1], dy + r[2], r[3], r[4], cor) end
end

--- Texto com a fonte pixel. Devolve a largura em pontos do Figma.
function TracaTela:texto(bb, str, x, y, negrito, tam, cor, centro_x)
    local w = TextWidget:new{ text = str, face = self:face(negrito, tam), fgcolor = cor or PRETO, padding = 0 }
    local tw = w:getSize().w
    local px_x = centro_x and (self.ox + self:px(centro_x) - math.floor(tw / 2)) or (self.ox + self:px(x))
    w:paintTo(bb, px_x, self.oy + self:px(y))
    w:free()
    return tw / self.k
end

--- Largura de um texto em pontos do Figma, sem pintar.
function TracaTela:larguraTexto(str, negrito, tam)
    local w = TextWidget:new{ text = str, face = self:face(negrito, tam), padding = 0 }
    local tw = w:getSize().w
    w:free()
    return tw / self.k
end

--- Texto com as letras mais juntas (kerning reduzido em `aperto` pontos por letra).
-- Pares que pedem ajuste extra, em pixels da Silkscreen (1/8 do tamanho da fonte).
-- LV: o L é vazio à direita em cima e o V afina embaixo; sem ajuste, o vão fica dobrado.
local KERNING = { LV = 1 }

function TracaTela:textoApertado(bb, str, x, y, negrito, tam, aperto)
    local cx, anterior = x, nil
    for letra in str:gmatch("[%z\1-\127\194-\244][\128-\191]*") do
        if anterior then cx = cx - (KERNING[anterior .. letra] or 0) * tam / 8 end
        cx = cx + self:texto(bb, letra, cx, y, negrito, tam) - aperto
        anterior = letra
    end
end

--- Texto que diminui (até 7) quando passa de `largura`; o meio fica na mesma altura. Para os rótulos
-- compridos do gato: os da traça cabem no tamanho de sempre.
function TracaTela:textoQueCabe(bb, str, x, y, negrito, tam, cor, largura)
    local t = tam
    while t > 7 and self:larguraTexto(str, negrito, t) > largura do t = t - 1 end
    return self:texto(bb, str, x, y + (tam - t) / 2, negrito, t, cor)
end

--- Caixa com cantos recortados (borda de 3), fundo branco e sombra deslocada (como no Figma).
function TracaTela:cartao(bb, x, y, w, h, sombra)
    if sombra then
        self:ret(bb, x + 9, y + 6, w - 6, h, PRETO)
        self:ret(bb, x + 6, y + 9, w, h - 6, PRETO)
    end
    self:ret(bb, x + 3, y + 3, w - 6, h - 6, BRANCO)
    self:ret(bb, x + 3, y, w - 6, 3, PRETO)
    self:ret(bb, x + 3, y + h - 3, w - 6, 3, PRETO)
    self:ret(bb, x, y + 3, 3, h - 6, PRETO)
    self:ret(bb, x + w - 3, y + 3, 3, h - 6, PRETO)
end

function TracaTela:bolinhas(bb, x, y, cheias)
    for i = 0, 3 do
        local bx = x + 32 * i
        if i < cheias then
            self:ret(bb, bx + 3, y, 20, 26, PRETO)
            self:ret(bb, bx, y + 3, 26, 20, PRETO)
            self:ret(bb, bx + 6, y + 6, 3, 3, BRANCO)
        else
            self:ret(bb, bx + 3, y, 20, 3, CINZA_BB)
            self:ret(bb, bx + 3, y + 23, 20, 3, CINZA_BB)
            self:ret(bb, bx, y + 3, 3, 20, CINZA_BB)
            self:ret(bb, bx + 23, y + 3, 3, 20, CINZA_BB)
        end
    end
end

local function maiusculas(s)
    local ok, Utf8Proc = pcall(require, "ffi/utf8proc")
    if ok and Utf8Proc and Utf8Proc.uppercase then
        local ok2, r = pcall(Utf8Proc.uppercase, s)
        if ok2 and r then return r end
    end
    return s:upper()
end

TracaTela.maiusculas = maiusculas  -- for the welcome screen

--- O título do bicho acordado: o nome que o leitor deu (traca_nome.lua) ou, sem nome, o da espécie.
function TracaTela:nomeDoBicho()
    local nome = self.traca.estado.nome
    return nome and maiusculas(nome) or Species.texto("titulo")
end

--- A caixa do nome, com o teclado: "Sortear" troca por um nome da lista, "Pronto" guarda (vazio volta ao nome da
-- espécie). primeira_vez: a pergunta de quando ele nasce, com "Agora não" (que não pergunta mais). ao_fechar:
-- quem chama redesenha (as boas-vindas); sem ele, esta tela se atualiza.
function TracaTela:pedirNome(primeira_vez, ao_fechar)
    local Nome = require("traca_nome")
    local InputDialog = require("ui/widget/inputdialog")
    local InfoMessage = require("ui/widget/infomessage")
    local s = self.traca.estado
    local dialogo
    local function fechar(guardar)
        if guardar ~= nil or primeira_vez then s.nome_perguntado = true end
        UIManager:close(dialogo)
        self.traca:salvar()
        if ao_fechar then ao_fechar() else self:atualizar() end
    end
    local linha = {
        { text = primeira_vez and T"Agora não" or T"Cancelar", id = "close", callback = function() fechar() end },
    }
    if Nome.temSorteio() then
        linha[#linha + 1] = { text = T"Sortear", callback = function()
            dialogo:setInputText(Nome.sortear(dialogo:getInputText()) or "")
        end }
    end
    linha[#linha + 1] = { text = T"Pronto", is_enter_default = true, callback = function()
        local nome, erro = Nome.limpar(dialogo:getInputText())
        if not nome then
            UIManager:show(InfoMessage:new{ timeout = 3, text = erro == "longo"
                and string.format(T"Use até %d caracteres.", Nome.MAX)
                or T"Use só letras, números, espaços e hífen." })
            return
        end
        s.nome = nome ~= "" and nome or nil
        fechar(true)
    end }
    dialogo = InputDialog:new{
        title = primeira_vez and T"Como vai se chamar?" or T"Nome",
        input = s.nome or "",
        input_hint = string.format(T"Até %d caracteres", Nome.MAX),
        buttons = { linha },
    }
    UIManager:show(dialogo)
    dialogo:onShowKeyboard()
end

-- Partes da tela ----------------------------------------------------------------

--- Balão de fala (Figma 28:5911): borda de 3, sombra de pixels à direita e embaixo,
-- rabinho no meio. Texto em Silkscreen Regular com 16 de respiro em cima e embaixo;
-- a altura cresce com o número de linhas.
--- Mede o balão: largura W (454, ou 560 para frases de 3+ linhas), altura H e a caixa de texto.
function TracaTela:medirBalao(fala)
    local function caixaPara(W)
        return TextBoxWidget:new{
            text = maiusculas(fala), face = self:face(false, 20.88),
            width = self:px(W - 47), alignment = "center",
        }
    end
    local linha = TextWidget:new{ text = "A", face = self:face(false, 20.88) }
    local lh = linha:getSize().h / self.k
    linha:free()
    local W = 454
    local caixa = caixaPara(W)
    if caixa:getSize().h / self.k > lh * 2.5 then  -- 3 linhas ou mais: alarga
        caixa:free()
        W = 560
        caixa = caixaPara(W)
    end
    local th = caixa:getSize().h / self.k
    return { W = W, H = th + 35, caixa = caixa }
end

--- Balão principal (Figma 28:5911): borda de 3, sombra de pixels, rabinho no meio embaixo.
-- topo: y do balão; sem topo, a ponta do rabinho fica em y = 234. m: medida já feita (opcional).
function TracaTela:balao(bb, fala, bx, topo, m)
    m = m or self:medirBalao(fala)
    local W, H = m.W, m.H
    bx = bx or ((LARG - (W + 6)) / 2)        -- centralizado contando a sombra de 6
    local by = topo or (234 - (H + 15))
    local t = math.floor(W / 2) - 7          -- começo do rabinho
    local function r(x, y, w, h, cor) self:ret(bb, bx + x, by + y, w, h, cor) end
    r(3, 3, W - 6, H - 3, BRANCO)            -- fundo
    r(6, 0, W - 12, 3, PRETO)                -- topo
    r(3, 3, 3, 3, PRETO); r(W - 6, 3, 3, 3, PRETO)
    r(0, 6, 3, H - 9, PRETO)                 -- lado esquerdo
    r(3, H - 3, 3, 3, PRETO)
    r(W - 3, 6, 3, H - 3, PRETO)             -- lado direito
    r(W - 6, H - 3, 3, 6, PRETO)
    r(W, 9, 3, H - 3, PRETO)                 -- sombra à direita
    r(W + 3, 12, 3, H - 6, PRETO)
    r(6, H, W - 12, 3, PRETO)                -- base
    r(9, H + 3, W - 9, 3, PRETO)             -- sombra embaixo
    r(12, H + 6, W - 9, 3, PRETO)
    r(t, H + 6, 3, 3, PRETO)                 -- rabinho
    r(t + 4, H + 9, 9, 3, PRETO); r(t + 7, H + 12, 3, 3, PRETO)
    r(t + 1, H, 15, 3, BRANCO); r(t + 4, H + 3, 9, 3, BRANCO); r(t + 7, H + 6, 3, 3, BRANCO)
    m.caixa:paintTo(bb, self.ox + self:px(bx + 28), self.oy + self:px(by + 19))
    m.caixa:free()
end

function TracaTela:prepararSprite()
    -- O sprite (64x64) ocupa ~295 pontos no Figma, centrado em (309.5, 412.5);
    -- escala inteira para os pixels ficarem nítidos.
    local escala = math.max(1, math.floor(295 * self.k / Desenho.LARGURA))
    local lado = escala * Desenho.LARGURA
    self.sprite_escala = escala
    self.sprite_rect = Geom:new{
        x = self.ox + self:px(309.5) - math.floor(lado / 2),
        y = self.oy + self:px(412.5) - math.floor(lado / 2),
        w = lado, h = lado,
    }
    self.fechar_rect = Geom:new{
        x = self.ox + self:px(545), y = self.oy + self:px(6), w = self:px(70), h = self:px(64),
    }
end

function TracaTela:paintTo(bb, x, y)
    self.dimen.x, self.dimen.y = x, y
    local s, agora = self.traca.estado, os.time()
    bb:paintRect(x, y, self.dimen.w, self.dimen.h, BRANCO)
    self.alvos = {}
    self:cabecalho(bb)
    if self.modo == "caderno" then
        self:pintarCaderno(bb, s)
    elseif self.modo == "diario" then
        self:pintarDiario(bb, s)
    elseif self.modo == "conquistas" then
        self:pintarConquistas(bb, s)
    elseif self.modo == "linhagem" then
        self:pintarLinhagem(bb, s)
    elseif self.modo == "percepcao" then
        self:pintarPercepcao(bb, s)
    elseif self.modo == "ninhada" then
        self:pintarNinhada(bb, s, agora)
    else
        self:pintarCasa(bb, s, agora)
    end
    if self.menu_aberto then self:pintarMenu(bb) end
    if self.confirmacao then self:pintarConfirmacao(bb) end
end

--- Área tocável, em pontos do Figma.
function TracaTela:alvo(x, y, w, h, acao)
    table.insert(self.alvos, {
        rect = Geom:new{ x = self.ox + self:px(x), y = self.oy + self:px(y), w = self:px(w), h = self:px(h) },
        acao = acao,
        camada = self.camada,
    })
end

local TITULOS = { caderno = T"CADERNO", diario = T"DIÁRIO", conquistas = T"CONQUISTAS", linhagem = T"LINHAGEM",
                  percepcao = T"PERCEPÇÃO", ninhada = T"NINHADA" }

function TracaTela:cabecalho(bb)
    self.camada = "topo"
    local titulo = TITULOS[self.modo]
    if titulo then
        self:texto(bb, titulo, 20, 18, true, 30)
    else
        -- o nome do bicho acordado (o que o leitor deu, ou o da espécie), sempre do mesmo tamanho (mockup de
        -- 06/11/2026): 30, letras juntas, no meio da altura dos botões. Os 14 caracteres de um nome cabem com folga.
        self:textoApertado(bb, self:nomeDoBicho(), 24, 15, true, 30, 4)
    end
    if self.traca.estado.dev_simulacao and not self.exportando then self:texto(bb, T"SIMULAÇÃO", 20, 56, false, 10, CINZA_55) end
    -- menu das seções (☰ em pixels), do tamanho dos outros dois botões
    self:cartao(bb, 447, 16, 42, 39, true)
    self:retangulos(bb, ICONE_MENU, 456, 23.5, PRETO)
    self:alvo(442, 6, 54, 60, function() self.menu_aberto = not self.menu_aberto end)
    -- ajustes (engrenagem em pixels)
    self:cartao(bb, 501, 16, 42, 39, true)
    self:retangulos(bb, ICONE_ENGRENAGEM, 510, 23.5, PRETO)
    self:alvo(496, 6, 54, 60, function() self.menu_aberto = false; self:menuAjustes() end)
    -- fechar
    self:cartao(bb, 555, 16, 42, 39, true)
    self:texto(bb, "X", 0, 12, true, 32, PRETO, 576)
    self:alvo(550, 6, 64, 60, function() self:onClose(); return "fechou" end)
    self.camada = "conteudo"
end

-- Menu das seções (o botão ☰) ----------------------------------------------------

-- Um texto que depende do bicho acordado é uma função (do nome dele, ou de Species.texto).
local ITENS_MENU = {
    { "casa", function(tela) return tela:nomeDoBicho() end, T"A CRIATURA" },
    { "ninhada", T"NINHADA", T"O BANDO TODO" },
    { "caderno", T"CADERNO", T"SEUS SUBLINHADOS" },
    { "diario", T"DIÁRIO", function() return Species.texto("diario") end },
    { "conquistas", T"CONQUISTAS", T"MARCOS E LIVROS LIDOS" },
    { "linhagem", T"LINHAGEM", function() return Species.texto("linhagem") end },
}
local function textoDoItem(t, tela) return type(t) == "function" and t(tela) or t end

function TracaTela:pintarMenu(bb)
    self.camada = "menu"
    local x, y, w = 263, 66, 334
    local h = 14 + #ITENS_MENU * 48 + 6
    self:cartao(bb, x, y, w, h, true)
    local iy = y + 12
    for _, item in ipairs(ITENS_MENU) do
        local atual = (self.modo or "casa") == item[1]
        if atual then
            self:ret(bb, x + 12, iy + 4, 6, 6, PRETO)
            self:ret(bb, x + 12, iy + 10, 6, 6, PRETO)
            self:ret(bb, x + 18, iy + 7, 6, 6, PRETO)
        end
        self:texto(bb, textoDoItem(item[2], self), x + 34, iy, true, 16)
        self:texto(bb, textoDoItem(item[3], self), x + 34, iy + 21, false, 10, CINZA_55)
        local modo = item[1]
        self:alvo(x, iy - 6, w, 48, function()
            self.menu_aberto = false
            self:entrar(modo)
        end)
        iy = iy + 48
    end
end

function TracaTela:entrar(modo)
    self.modo = modo ~= "casa" and modo or nil
    self.pag = 1
    self.mensagem = nil
    self.geracao_aberta = nil
    if modo == "caderno" then
        self:carregarSublinhados()
    elseif modo == "conquistas" then
        local s = self.traca.estado
        self.terminados = s.dev_simulacao and s.sim_terminados or TracaTela.livrosTerminados()
        local n = 0
        for _, L in ipairs(s.dev_simulacao and s.sim_sublinhados or TracaTela.lerSublinhados()) do n = n + #L.itens end
        self.n_sublinhados = n
    end
    self:atualizar()
end

-- Tela inicial ------------------------------------------------------------------

function TracaTela:pintarCasa(bb, s, agora)
    -- balão com a fala (sorteada uma vez por abertura, para não mudar a cada redesenho)
    if not self.fala then self.fala = Estado.fala(s, agora, nil, nil, "traca") end
    -- a Traça fica sempre no lugar do Figma; o balão cresce para cima (e se alarga nas
    -- frases longas), sem nunca passar do cabeçalho
    -- o rabinho fica logo acima da cabeça real do desenho (fases pequenas: o balão desce)
    local m = self:medirBalao(self.mensagem or self.fala)
    local nome = self.quadro_atual or Estado.sprite(s, agora)
    local cabeca = (self.sprite_rect.y - self.oy) / self.k + Desenho.topoReal(nome) * self.sprite_escala / self.k
    local ponta = cabeca - 30
    local topo = math.max(70, ponta - (m.H + 15))
    self:balao(bb, self.mensagem or self.fala, nil, topo, m)

    -- a Traça
    local r = self.sprite_rect
    Desenho.pintarSprite(bb, self.quadro_atual or Estado.sprite(s, agora), r.x, r.y, self.sprite_escala)

    self:cartoesStatus(bb, s, agora)
end

-- Navegação de páginas (caderno e diário) -------------------------------------

function TracaTela:navegacao(bb, total)
    if total <= 1 then return end
    self.pag = math.max(1, math.min(self.pag or 1, total))
    self:cartao(bb, 20, 744, 84, 50, true)
    self:texto(bb, "<", 0, 750, true, 28, PRETO, 62)
    self:cartao(bb, 514, 744, 84, 50, true)
    self:texto(bb, ">", 0, 750, true, 28, PRETO, 556)
    self:texto(bb, string.format("%d / %d", self.pag, total), 0, 760, false, 14, CINZA_55, 309)
    self:alvo(14, 738, 100, 64, function() self.pag = math.max(1, self.pag - 1) end)
    self:alvo(508, 738, 100, 64, function() self.pag = math.min(total, self.pag + 1) end)
end

--- Balão com o rabinho à esquerda (Figma 37:7072): mesma borda e sombra do balão
-- principal; a altura cresce com o texto e o balão fica centrado em `centro_y`.
function TracaTela:balaoLateral(bb, texto, bx, W, centro_y, tam)
    local caixa = TextBoxWidget:new{
        text = maiusculas(texto), face = self:face(false, tam or 13), width = self:px(W - 56),
    }
    local th = caixa:getSize().h / self.k
    local H = th + 35
    local by = centro_y - H / 2
    local function r(x, y, w, h, cor) self:ret(bb, bx + x, by + y, w, h, cor) end
    r(3, 3, W - 6, H - 3, BRANCO)                         -- fundo
    r(6, 0, W - 12, 3, PRETO)                             -- topo
    r(3, 3, 3, 3, PRETO); r(W - 6, 3, 3, 3, PRETO)
    r(0, 6, 3, H - 9, PRETO)                              -- lado esquerdo
    r(3, H - 3, 3, 3, PRETO)
    r(W - 3, 6, 3, H - 3, PRETO)                          -- lado direito
    r(W - 6, H - 3, 3, 6, PRETO)
    r(W, 9, 3, H - 3, PRETO); r(W + 3, 12, 3, H - 6, PRETO)          -- sombra à direita
    r(6, H, W - 12, 3, PRETO)                                         -- base
    r(9, H + 3, W - 9, 3, PRETO); r(12, H + 6, W - 9, 3, PRETO)      -- sombra embaixo
    -- rabinho à esquerda, no meio da altura
    local ty = math.floor(H / 2) - 1
    r(0, ty - 6, 3, 15, BRANCO)
    r(-3, ty - 3, 3, 9, BRANCO); r(-6, ty, 3, 3, BRANCO)
    r(-3, ty - 6, 3, 3, PRETO); r(-6, ty - 3, 3, 3, PRETO); r(-9, ty, 3, 3, PRETO)
    r(-6, ty + 3, 3, 3, PRETO); r(-3, ty + 6, 3, 3, PRETO)
    caixa:paintTo(bb, self.ox + self:px(bx + 28), self.oy + self:px(by + 19))
    caixa:free()
end

--- Carinha da Traça com um balão ao lado (usado nas telas do arquivo).
function TracaTela:rodapeFala(bb, s, texto, y)
    local escala = math.max(1, math.floor(110 * self.k / Desenho.LARGURA))
    Desenho.pintarSprite(bb, Estado.fase(s).nome, self.ox + self:px(14), self.oy + self:px(y), escala)
    local lado = escala * Desenho.LARGURA / self.k
    self:balaoLateral(bb, texto, 14 + lado + 16, LARG - (14 + lado + 16) - 20, y + lado / 2)
end

-- Caderno: os sublinhados e notas do KOReader, organizados por livro ---------------

function TracaTela:carregarSublinhados()
    local s = self.traca.estado
    self.caderno = s.dev_simulacao and s.sim_sublinhados or TracaTela.lerSublinhados()
    self.livro_aberto = nil
end

--- Sublinhados e notas do KOReader, agrupados por livro (mais recente primeiro).
function TracaTela.lerSublinhados()
    local livros = {}
    pcall(function()
        local ReadHistory = require("readhistory")
        local DocSettings = require("docsettings")
        for i, item in ipairs(ReadHistory.hist or {}) do
            if i > 80 then break end
            if item.file and DocSettings:hasSidecarFile(item.file) then
                local ds = DocSettings:open(item.file)
                local props = ds:readSetting("doc_props") or {}
                local titulo = props.display_title or props.title or item.text or "?"
                local itens = {}
                for _, a in ipairs(ds:readSetting("annotations") or {}) do
                    if a.text and a.text ~= "" and (a.drawer or a.note) then
                        itens[#itens + 1] = { texto = a.text, nota = a.note, capitulo = a.chapter, data = a.datetime or "" }
                    end
                end
                if #itens > 0 then
                    table.sort(itens, function(a, b) return a.data < b.data end)
                    livros[#livros + 1] = { livro = titulo, autor = props.authors, itens = itens, recente = itens[#itens].data }
                end
            end
        end
    end)
    table.sort(livros, function(a, b) return a.recente > b.recente end)
    return livros
end

function TracaTela:pintarCaderno(bb, s)
    local livros = self.caderno or {}
    if #livros == 0 then
        self:rodapeFala(bb, s, T"Nenhum sublinhado. Ou você não lê, ou não sente nada. Segure o dedo numa frase do livro e destaque.", 380)
        return
    end
    if self.livro_aberto then return self:pintarSublinhado(bb, s, livros[self.livro_aberto]) end

    -- estante: 2 colunas x 3 linhas de caixinhas
    local por_pag = 6
    local total = math.ceil(#livros / por_pag)
    self.pag = math.max(1, math.min(self.pag or 1, total))
    for k = 0, por_pag - 1 do
        local idx = (self.pag - 1) * por_pag + k + 1
        local L = livros[idx]
        if not L then break end
        local x = 20 + (k % 2) * 299
        local y = 92 + math.floor(k / 2) * 208
        self:cartao(bb, x, y, 279, 188, true)
        self:ret(bb, x + 16, y + 16, 6, 30, PRETO)  -- lombada em pixels
        self:ret(bb, x + 22, y + 16, 3, 30, CINZA_BB)
        local titulo = TextBoxWidget:new{
            text = maiusculas(L.livro), face = self:face(true, 14), width = self:px(220),
            height = self:px(90), height_overflow_show_ellipsis = true,
        }
        titulo:paintTo(bb, self.ox + self:px(x + 38), self.oy + self:px(y + 16))
        titulo:free()
        if L.autor then
            local autor = TextBoxWidget:new{
                text = maiusculas(L.autor:gsub("\n.*", "")), face = self:face(false, 10), fgcolor = CINZA_55,
                width = self:px(220), height = self:px(28), height_overflow_show_ellipsis = true,
            }
            autor:paintTo(bb, self.ox + self:px(x + 38), self.oy + self:px(y + 112))
            autor:free()
        end
        local n = #L.itens
        self:texto(bb, string.format("%d %s", n, n == 1 and T"SUBLINHADO" or T"SUBLINHADOS"), x + 16, y + 154, true, 11, CINZA_55)
        self:alvo(x, y, 279, 188, function()
            self.livro_aberto = idx
            self.pag_estante = self.pag
            self.pag = 1
        end)
    end
    self:navegacao(bb, total)
end

function TracaTela:pintarSublinhado(bb, s, L)
    -- voltar para a estante
    self:cartao(bb, 20, 82, 150, 38, true)
    self:texto(bb, T"< LIVROS", 0, 92, true, 13, PRETO, 95)
    self:alvo(14, 76, 162, 50, function()
        self.livro_aberto = nil
        self.pag = self.pag_estante or 1
    end)
    local livro = TextBoxWidget:new{
        text = maiusculas(L.livro), face = self:face(true, 12), fgcolor = CINZA_55, width = self:px(410),
        height = self:px(16), height_overflow_show_ellipsis = true,
    }
    livro:paintTo(bb, self.ox + self:px(188), self.oy + self:px(94))
    livro:free()

    local total = #L.itens
    self.pag = math.max(1, math.min(self.pag or 1, total))
    local item = L.itens[self.pag]
    self:cartao(bb, 20, 136, 578, 392, true)
    self:ret(bb, 44, 154, 18, 6, PRETO)  -- aspas em pixels
    self:ret(bb, 44, 160, 6, 12, PRETO)
    self:ret(bb, 68, 154, 18, 6, PRETO)
    self:ret(bb, 68, 160, 6, 12, PRETO)
    local corpo = TextBoxWidget:new{
        text = item.texto, face = self:face(false, 16), width = self:px(526),
        height = self:px(290), height_overflow_show_ellipsis = true,
    }
    corpo:paintTo(bb, self.ox + self:px(44), self.oy + self:px(184))
    corpo:free()
    if item.capitulo then
        local cap = TextBoxWidget:new{
            text = "— " .. maiusculas(item.capitulo), face = self:face(false, 11), fgcolor = CINZA_55,
            width = self:px(526), height = self:px(16), height_overflow_show_ellipsis = true,
        }
        cap:paintTo(bb, self.ox + self:px(44), self.oy + self:px(494))
        cap:free()
    end

    -- comentário com contexto
    local no_cap = 0
    for _, it in ipairs(L.itens) do if it.capitulo and it.capitulo == item.capitulo then no_cap = no_cap + 1 end end
    local pers = Memoria.personagens(s, L.livro, 10)
    local comentario = Memoria.comentarioContexto(item, {
        s = s, temperamento = Estado.fase(s).temperamento, livro = L.livro, personagens = pers,
        ordem = self.pag, total = total, no_capitulo = no_cap,
    })
    self:rodapeFala(bb, s, comentario, 560)
    self:navegacao(bb, total)
end

-- Diário: memórias e o que os livros fizeram com ela --------------------------------

local MESES = {}
for m in T"JAN FEV MAR ABR MAI JUN JUL AGO SET OUT NOV DEZ":gmatch("%S+") do MESES[#MESES + 1] = m end

function TracaTela:pintarDiario(bb, s)
    local y = 88
    -- "biblioteca interior" resumida: quem ela virou
    local a, b = Memoria.ambivalente(s)
    local resumo
    if a then
        resumo = string.format(T"DIVIDIDA ENTRE %s E %s", maiusculas(Memoria.NOMES_TEMA[a]), maiusculas(Memoria.NOMES_TEMA[b]))
    elseif s.tema_dominante then
        resumo = string.format(Species.texto("obsessao"), maiusculas(Memoria.tema(s.tema_dominante, "por")))
    end
    -- o jeito que ela ficou com as suas leituras (até 2 traços; 1 quando já está dividida)
    local jeito = Tracos.rotulos(s.tracos, a and 1 or 2)
    if #jeito > 0 then resumo = (resumo and (resumo .. " · ") or "") .. table.concat(jeito, " · ") end
    resumo = resumo or T"AINDA SEM OPINIÕES. LEIA MAIS."
    self:texto(bb, resumo, 20, y, true, 12, CINZA_55)
    y = y + 26

    local entradas = {}
    for i = #(s.diario or {}), 1, -1 do entradas[#entradas + 1] = s.diario[i] end
    if #entradas == 0 then
        self:rodapeFala(bb, s, T"Meu diário está vazio. Como a sua estante.", 380)
        return
    end
    local por_pag = 5
    local total = math.ceil(#entradas / por_pag)
    self.pag = math.max(1, math.min(self.pag or 1, total))
    for i = (self.pag - 1) * por_pag + 1, math.min(#entradas, self.pag * por_pag) do
        local e = entradas[i]
        local d = os.date("*t", e.t)
        self:texto(bb, string.format("%02d %s", d.day, MESES[d.month]), 20, y, true, 12)
        local caixa = TextBoxWidget:new{
            text = maiusculas(e.texto), face = self:face(false, 13), width = self:px(500),
            height = self:px(72), height_overflow_show_ellipsis = true,
        }
        local hh = caixa:getSize().h / self.k
        caixa:paintTo(bb, self.ox + self:px(96), self.oy + self:px(y))
        caixa:free()
        y = y + math.max(22, hh) + 14
        self:ret(bb, 20, y - 8, 578, 3, CINZA_BB)
        y = y + 6
    end
    self:navegacao(bb, total)
end

--- Cartões de barriga/humor e de fase (rodapé da tela principal).
function TracaTela:cartoesStatus(bb, s, agora)
    -- cartão de status: barriga e humor
    -- os dois cartões (380 + 20 de espaço + 174, mais 6 de sombra) centralizados na tela
    local cx, cy = (LARG - 580) / 2, 696
    self:cartao(bb, cx, cy, 380, 104, true)
    self:retangulos(bb, ICONE_LIVRO, cx, cy, PRETO)
    self:retangulos(bb, ICONE_CARA, cx, cy, PRETO)
    self:texto(bb, Species.texto("barra"), cx + 62, cy + 12, true, 16)
    local hoje = Estado.paginasHoje(s, agora)
    -- até as bolinhas (cx + 244), com folga
    self:textoQueCabe(bb, string.format(T"%s · %d PÁG. HOJE", Estado.rotuloBarriga(s), hoje), cx + 62, cy + 33, false, 10,
        CINZA_55, 176)
    self:texto(bb, T"HUMOR", cx + 62, cy + 58, true, 16)
    self:texto(bb, Estado.rotuloHumor(s), cx + 62, cy + 79, false, 10, CINZA_55)
    self:bolinhas(bb, cx + 244, cy + 16, Estado.bolinhas(s.barriga))
    self:bolinhas(bb, cx + 244, cy + 62, Estado.bolinhas(s.humor))

    -- cartão de fase: geração e fase, páginas que faltam para a próxima e a barra até lá
    -- (a idade em dias não dizia nada: ela cresce pelo que come; as datas ficam no memorial)
    local ix, iy, larg = cx + 400, 696, 146
    self:cartao(bb, ix, iy, 174, 104, true)
    local pf = Estado.progressoFase(s)
    -- título: a fase grande e a geração pequena ao lado ("JOVEM  GERAÇÃO 1", ou "GER. 1" se não couber;
    -- "GERAÇÃO 1 · JOVEM" inteiro só cabia em fonte 10, menor que o resto do cartão)
    local fw = self:texto(bb, TITULO_FASE[pf.fase.nome] or "", ix + 14, iy + 8, true, 16)
    local ger = string.format(T"GERAÇÃO %d", s.geracao or 1)
    if fw + 8 + self:larguraTexto(ger, false, 10) > larg then ger = string.format(T"GER. %d", s.geracao or 1) end
    self:texto(bb, ger, ix + 14 + fw + 8, iy + 13, false, 10, CINZA_55)
    local alvo = pf.proxima and TITULO_FASE[pf.proxima.nome] or Species.texto("alvo_final")
    if pf.fase.nome == "ovo" then alvo = T"NASCER" end
    local linha1 = pf.paginas == 1 and T"PÁG. PARA" or T"PÁGS. PARA"
    local rotulo = math.max(self:larguraTexto(linha1, false, 10), self:larguraTexto(alvo, true, 10))
    local num = Desenho.milhar(pf.paginas)
    local tam_num = 28
    while tam_num > 16 and self:larguraTexto(num, true, tam_num) + 6 + rotulo > larg do tam_num = tam_num - 4 end
    local nw = self:texto(bb, num, ix + 14, iy + 26, true, tam_num)
    self:texto(bb, linha1, ix + 14 + nw + 6, iy + 30, false, 10, CINZA_55)
    self:texto(bb, alvo, ix + 14 + nw + 6, iy + 43, true, 10)
    -- barra: trilho cinza e o progresso em preto
    self:ret(bb, ix + 14, iy + 64, larg, 6, CINZA_BB)
    local cheio = math.floor(larg * pf.fracao + 0.5)
    if cheio > 0 then self:ret(bb, ix + 14, iy + 64, cheio, 6, PRETO) end
    self:retangulos(bb, ICONE_AMPULHETA, ix, iy, CINZA_55)
    -- até a borda do cartão (ix + 171), com folga
    self:textoQueCabe(bb, string.format(Species.texto("paginas"), Desenho.milhar(s.paginas)), ix + 30, iy + 77, false, 10,
        CINZA_55, 137)
end

--- Tela de descanso: o balão e a Traça dormindo, sozinhos, no meio da tela (sem cartões desde 29/10/2026:
-- a imagem é desenhada quando o Kindle dorme, e de manhã barriga, humor e "pág. hoje" já seriam de ontem).
-- Pinta numa imagem e salva em PNG; o KOReader mostra quando o Kindle dorme.
-- escolher = true só quando o Kindle vai dormir: a fala é escolhida agora (Estado.falaDescanso); nos outros
-- redesenhos, repete a última.
function TracaTela.gerarTelaDescanso(s, caminho, agora, escolher)
    local sw, sh = Screen:getWidth(), Screen:getHeight()
    local w, h = math.min(sw, sh), math.max(sw, sh)  -- sempre em pé
    local bb = Desenho.novoBuffer(w, h)  -- in colour when the screen shows colour
    bb:fill(BRANCO)
    local k = math.min(w / LARG, h / ALT)
    local p = setmetatable({
        k = k, ox = math.floor((w - LARG * k) / 2), oy = math.floor((h - ALT * k) / 2),
        fator_fonte = Screen:scaleBySize(1000) / 1000, faces = {},
    }, { __index = TracaTela })
    -- a Traça dormindo: o desenho da fase (repouso_jovem…) ou, enquanto ele não existe, o da fase anterior;
    -- o ovo não dorme, aparece ele mesmo. 64 de altura (a anciã dormindo é mais larga), no tamanho do pixel da Home.
    local fase, nome = Estado.fase(s).nome, "ovo"
    if fase ~= "ovo" then
        for _, etapa in ipairs(Estado.fases()) do  -- the active species' stages
            local f = etapa.nome
            if f ~= "ovo" and Desenho.resolver("repouso_" .. f) == "repouso_" .. f then nome = "repouso_" .. f end
            if f == fase then break end
        end
    end
    local escala = math.max(1, math.floor(295 * k / Desenho.LARGURA))
    local L = Desenho.sprite(nome)
    local larg = #L[1] * escala
    local topo_real = Desenho.topoReal(nome) * escala           -- linhas vazias acima da antena
    local alt_real = #L * escala - topo_real
    -- balão e Traça como um grupo, igual à Home (rabinho 30 acima da cabeça), no meio da tela
    local fala = Estado.falaDescanso(s, agora, escolher)
    local m = p:medirBalao(fala)
    local grupo = m.H + 15 + 30 + alt_real / k
    local topo = math.max(20, (ALT - grupo) / 2)
    p:balao(bb, fala, nil, topo, m)
    local cabeca = p.oy + p:px(topo + m.H + 15 + 30)
    Desenho.pintarSprite(bb, nome, p.ox + p:px(LARG / 2) - math.floor(larg / 2), cabeca - topo_real, escala)
    local ok, err = pcall(bb.writePNG, bb, caminho)
    bb:free()
    return ok, err
end

-- Conquistas: resumo, marcos e estante por ano -------------------------------------

--- Livros marcados como terminados no KOReader (ou lidos até o fim), com a data.
function TracaTela.livrosTerminados()
    local lista = {}
    pcall(function()
        local ReadHistory = require("readhistory")
        local DocSettings = require("docsettings")
        for _, item in ipairs(ReadHistory.hist or {}) do
            if item.file and DocSettings:hasSidecarFile(item.file) then
                local ds = DocSettings:open(item.file)
                local resumo = ds:readSetting("summary") or {}
                local pct = ds:readSetting("percent_finished") or 0
                if resumo.status == "complete" or pct >= 0.995 then
                    local props = ds:readSetting("doc_props") or {}
                    local data = resumo.modified or (item.time and os.date("%Y-%m-%d", item.time)) or ""
                    lista[#lista + 1] = { titulo = props.display_title or props.title or item.text or "?", data = data }
                end
            end
        end
    end)
    table.sort(lista, function(a, b) return a.data > b.data end)
    return lista
end

function TracaTela:pintarConquistas(bb, s)
    local terminados = self.terminados or {}
    -- página 1: resumo + marcos; páginas seguintes: estante por ano
    local anos, por_ano = {}, {}
    for _, L in ipairs(terminados) do
        local ano = L.data:sub(1, 4)
        if ano == "" then ano = "????" end
        if not por_ano[ano] then por_ano[ano] = {}; anos[#anos + 1] = ano end
        table.insert(por_ano[ano], L)
    end
    local paginas_estante = {}
    for _, ano in ipairs(anos) do
        local lista = por_ano[ano]
        for i = 1, #lista, 9 do
            paginas_estante[#paginas_estante + 1] = { ano = ano, total = #lista, de = i, lista = lista }
        end
    end
    local total = 2 + #paginas_estante  -- 2 páginas de marcos
    self.pag = math.max(1, math.min(self.pag or 1, total))

    if self.pag <= 2 then
        if self.pag == 1 then
            -- cartão-resumo
            self:cartao(bb, 20, 86, 578, 96, true)
            local function bloco(x, valor, rotulo)
                self:texto(bb, valor, x, 100, true, 28)
                self:texto(bb, rotulo, x, 140, false, 10, CINZA_55)
            end
            local paginas, dias = Estado.totais(s)
            bloco(44, tostring(#terminados), T"LIVROS TERMINADOS")
            bloco(240, Desenho.milhar(paginas), Species.texto("paginas_total"))
            bloco(436, tostring(dias), T"DIAS LENDO")
        end
        local marcos = Estado.marcos(s, {
            livros_terminados = #terminados, sublinhados = self.n_sublinhados or 0,
            ambivalente = Memoria.ambivalente(s) ~= nil,
        })
        local ini = self.pag == 1 and 1 or 11
        local y0 = self.pag == 1 and 200 or 92
        for k = 0, 9 do
            local m = marcos[ini + k]
            if not m then break end
            local x = 20 + (k % 2) * 299
            local y = y0 + math.floor(k / 2) * 104
            self:cartao(bb, x, y, 279, 88, true)
            -- selo: quadrado cheio se conquistado, vazio (cinza) se não
            local sx, sy = x + 16, y + 26
            if m.feito then
                self:ret(bb, sx + 3, sy, 20, 26, PRETO); self:ret(bb, sx, sy + 3, 26, 20, PRETO)
                self:ret(bb, sx + 6, sy + 6, 3, 3, BRANCO)
            else
                self:ret(bb, sx + 3, sy, 20, 3, CINZA_BB); self:ret(bb, sx + 3, sy + 23, 20, 3, CINZA_BB)
                self:ret(bb, sx, sy + 3, 3, 20, CINZA_BB); self:ret(bb, sx + 23, sy + 3, 3, 20, CINZA_BB)
            end
            self:texto(bb, m.titulo, x + 56, y + 16, true, 13, m.feito and PRETO or CINZA_55)
            local desc = m.feito and m.descricao
                or (m.meta > 1 and string.format("%s / %s", Desenho.milhar(math.min(m.atual, m.meta)), Desenho.milhar(m.meta)) or m.descricao)
            self:texto(bb, desc, x + 56, y + 42, false, 9, CINZA_55)
        end
    else
        local P = paginas_estante[self.pag - 2]
        self:texto(bb, string.format("%s · %d %s", P.ano, P.total, P.total == 1 and T"LIVRO" or T"LIVROS"), 20, 88, true, 18)
        local y = 124
        for i = P.de, math.min(P.de + 8, #P.lista) do
            local L = P.lista[i]
            self:cartao(bb, 20, y, 578, 62, true)
            self:ret(bb, 36, y + 14, 6, 34, PRETO); self:ret(bb, 42, y + 14, 3, 34, CINZA_BB)  -- lombada
            local t = TextBoxWidget:new{
                text = maiusculas(L.titulo), face = self:face(true, 13), width = self:px(420),
                height = self:px(18), height_overflow_show_ellipsis = true,
            }
            t:paintTo(bb, self.ox + self:px(60), self.oy + self:px(y + 14))
            t:free()
            local d = L.data
            local dia, mes = d:sub(9, 10), tonumber(d:sub(6, 7))
            self:texto(bb, mes and (dia .. " " .. MESES[mes]) or "", 60, y + 38, false, 10, CINZA_55)
            y = y + 70
        end
    end
    self:navegacao(bb, total)
end

-- Linhagem: a geração viva e os memoriais das anteriores ---------------------------

local function data_curta(t)
    if not t then return "?" end
    local d = os.date("*t", t)
    return string.format("%02d %s %d", d.day, MESES[d.month], d.year)
end

function TracaTela:pintarLinhagem(bb, s)
    local linhagem = s.linhagem or {}
    if self.geracao_aberta then return self:pintarMemorial(bb, s, linhagem[self.geracao_aberta]) end
    -- árvore: viva no topo, ancestrais abaixo (mais recente primeiro), ligados por uma linha
    local itens = { { viva = true } }
    for i = #linhagem, 1, -1 do itens[#itens + 1] = { idx = i, m = linhagem[i] } end
    local por_pag = 5
    local total = math.ceil(#itens / por_pag)
    self.pag = math.max(1, math.min(self.pag or 1, total))
    local y = 92
    for i = (self.pag - 1) * por_pag + 1, math.min(#itens, self.pag * por_pag) do
        local it = itens[i]
        if i > (self.pag - 1) * por_pag + 1 then self:ret(bb, 60, y - 26, 6, 26, PRETO) end  -- linha da árvore
        self:cartao(bb, 20, y, 578, 104, true)
        local escala = math.max(1, math.floor(80 * self.k / Desenho.LARGURA))
        if it.viva then
            Desenho.pintarSprite(bb, Estado.fase(s).nome, self.ox + self:px(30), self.oy + self:px(y + 12), escala)
            self:texto(bb, string.format(Species.texto("viva"), s.geracao or 1), 130, y + 16, true, 15)
            self:texto(bb, T"DESDE " .. data_curta(s.nascimento), 130, y + 42, false, 10, CINZA_55)
            self:texto(bb, string.format(T"%s PÁG. · %s", Desenho.milhar(s.paginas or 0), maiusculas(Estado.fase(s).titulo)), 130, y + 62, false, 10, CINZA_55)
            if s.heranca then self:texto(bb, T"HERDOU: " .. maiusculas(Memoria.NOMES_TEMA[s.heranca]), 130, y + 80, false, 10, CINZA_55) end
        else
            local m = it.m
            local fases = Estado.fases()  -- the active species' last stage (the silverfish's elder, the cat's)
            Desenho.pintarSprite(bb, fases[#fases].nome, self.ox + self:px(30), self.oy + self:px(y + 12), escala)
            self:texto(bb, string.format(T"GERAÇÃO %d", m.geracao), 130, y + 16, true, 15)
            self:texto(bb, data_curta(m.nascimento) .. " — " .. data_curta(m.morte), 130, y + 42, false, 10, CINZA_55)
            self:texto(bb, string.format(T"%s PÁG. · %d LIVROS", Desenho.milhar(m.paginas or 0), #(m.livros or {})), 130, y + 62, false, 10, CINZA_55)
            if m.tema then self:texto(bb, string.format(Species.texto("obsessao"), maiusculas(Memoria.tema(m.tema, "por"))), 130, y + 80, false, 10, CINZA_55) end
            self:texto(bb, ">", 0, y + 36, true, 24, PRETO, 570)
            local idx = it.idx
            self:alvo(20, y, 578, 104, function() self.geracao_aberta = idx; self.pag_linhagem = self.pag; self.pag = 1 end)
        end
        y = y + 130
    end
    if #linhagem == 0 then
        self:rodapeFala(bb, s, Species.texto("primeira"), 560)  -- a fala de cada espécie (lote 4)
    end
    self:navegacao(bb, total)
end

function TracaTela:pintarMemorial(bb, s, m)
    self:cartao(bb, 20, 82, 150, 38, true)
    self:texto(bb, T"< LINHAGEM", 0, 92, true, 12, PRETO, 95)
    self:alvo(14, 76, 162, 50, function() self.geracao_aberta = nil; self.pag = self.pag_linhagem or 1 end)
    -- páginas: 1 = resumo e últimas palavras; 2+ = livros (14 por página)
    local livros = m.livros or {}
    local total = 1 + math.ceil(#livros / 14)
    self.pag = math.max(1, math.min(self.pag or 1, total))
    if self.pag == 1 then
        self:texto(bb, string.format(T"GERAÇÃO %d", m.geracao), 20, 136, true, 26)
        self:texto(bb, data_curta(m.nascimento) .. " — " .. data_curta(m.morte), 20, 176, false, 12, CINZA_55)
        self:texto(bb, string.format(T"%s PÁGINAS · %d LIVROS", Desenho.milhar(m.paginas or 0), #livros), 20, 198, false, 12, CINZA_55)
        local y = 232
        -- obsessão e jeito no mesmo cartão (o jeito na linha de baixo)
        local jeito = table.concat(Tracos.rotulos(m.tracos, 3), " · ")
        local quem = {}
        if m.tema then quem[#quem + 1] = Memoria.NOMES_TEMA[m.tema] .. (m.palavra and (T" · última palavra: “" .. m.palavra .. "”") or "") end
        if jeito ~= "" then quem[#quem + 1] = jeito end
        if #quem > 0 then y = self:caixaTexto(bb, y, m.tema and T"OBSESSÃO" or T"JEITO", table.concat(quem, "\n"), 110) end
        if m.citacao then y = self:caixaTexto(bb, y, T"CITAÇÃO FAVORITA", m.citacao, 120) end
        local memorias = {}
        for i = math.max(1, #(m.memorias or {}) - 1), #(m.memorias or {}) do memorias[#memorias + 1] = m.memorias[i] end
        if #memorias > 0 and 640 - 18 - y >= 80 then
            self:caixaTexto(bb, y, T"ÚLTIMAS MEMÓRIAS", table.concat(memorias, " / "), 640 - 18 - y)
        end
        self:rodapeFala(bb, s, T"Últimas palavras: “" .. (m.ultimas or "…") .. "”", 640)
    else
        self:texto(bb, string.format(T"LIVROS DA GERAÇÃO %d", m.geracao), 20, 136, true, 16)
        local y = 170
        for i = (self.pag - 2) * 14 + 1, math.min(#livros, (self.pag - 1) * 14) do
            local t = TextBoxWidget:new{
                text = "· " .. maiusculas(livros[i]), face = self:face(false, 13), width = self:px(570),
                height = self:px(18), height_overflow_show_ellipsis = true,
            }
            t:paintTo(bb, self.ox + self:px(20), self.oy + self:px(y))
            t:free()
            y = y + 38
        end
    end
    self:navegacao(bb, total)
end

-- A ninhada ---------------------------------------------------------------------------
-- Figma "Brood — ninhada" (334:506), 07/11/2026: o bicho acordado num cartão grande e o ninho com 8 casas, uma
-- por espécie, na ordem de NINHO; as que ainda não existem ficam em segredo. Toda espécie vem liberada (o ovo do
-- gato já pode chocar). Tocar num bicho que dorme acorda ele; num ovo que nunca chocou, choca; o acordado vai
-- dormir, com o tempo parado (traca_brood.lua).

local NINHO, CASAS = { "traca", "gato" }, 8
local CINZA_88 = Blitbuffer.Color8(0x88)
local CADEADO = { { 3, 0, 4, 2 }, { 1, 2, 2, 5 }, { 7, 2, 2, 5 }, { 0, 6, 10, 8 } }  -- 10x14, em 1,5x
-- Lápis 11x11 (em 1,5x) ao lado do nome no cartão de cima: toque troca o nome (pedido de 07/11/2026).
local LAPIS = {}
for y, linha in ipairs({ "........##.", ".......###.", "......#.#..", ".....###...", "....###....", "...###.....",
                         "..###......", ".#.#.......", "#..#.......", "#.#........", "##........." }) do
    for a, b in linha:gmatch("()#+()") do LAPIS[#LAPIS + 1] = { a - 1, y - 1, b - a, 1 } end
end

-- Borda de 3 com os cantos recortados, sem sombra (as casas em segredo).
local function moldura(self, bb, x, y, w, h, cor)
    self:ret(bb, x + 3, y, w - 6, 3, cor); self:ret(bb, x + 3, y + h - 3, w - 6, 3, cor)
    self:ret(bb, x, y + 3, 3, h - 6, cor); self:ret(bb, x + w - 3, y + 3, 3, h - 6, cor)
end

-- Selo preto com texto branco (COM VOCÊ, NOVIDADE!); x é o meio quando centro.
local function selo(self, bb, texto, x, y, centro)
    local w = self:larguraTexto(texto, true, 10) + 18
    if centro then x = x - w / 2 end
    self:ret(bb, x, y, w, 21, PRETO)
    self:texto(bb, texto, x + 9, y + 5, true, 10, BRANCO)
end

-- Texto centrado que diminui (até 7) para caber em `largura` (os nomes nas casas).
local function centradoQueCabe(self, bb, str, cx, y, negrito, tam, cor, largura)
    local t = tam
    while t > 7 and self:larguraTexto(str, negrito, t) > largura do t = t - 1 end
    self:texto(bb, str, 0, y + (tam - t) / 2, negrito, t, cor, cx)
end

-- Texto com as letras afastadas `t` pontos, como no mockup do cartão de cima (07/11/2026). A largura de cada
-- letra é medida uma vez só e guardada.
local LETRA = "[%z\1-\127\194-\244][\128-\191]*"
local larguras_letra = {}
local function larguraLetra(self, c, negrito, tam)
    local chave = c .. (negrito and "|b|" or "|r|") .. tam .. "|" .. self.k
    local w = larguras_letra[chave]
    if not w then w = self:larguraTexto(c, negrito, tam); larguras_letra[chave] = w end
    return w
end

local function larguraEspacada(self, str, negrito, tam, t)
    local w, n = 0, 0
    for c in str:gmatch(LETRA) do w, n = w + larguraLetra(self, c, negrito, tam), n + 1 end
    return w + math.max(0, n - 1) * t
end

local function espacado(self, bb, str, x, y, negrito, tam, cor, t)
    local cx = x
    for c in str:gmatch(LETRA) do
        if c ~= " " then self:texto(bb, c, cx, y, negrito, tam, cor) end
        cx = cx + larguraLetra(self, c, negrito, tam) + t
    end
end

-- Corta um texto espaçado com "…" até caber (o livro de agora, a obsessão).
local function cortar(self, str, negrito, tam, t, largura)
    if larguraEspacada(self, str, negrito, tam, t) <= largura then return str end
    local resto = largura - larguraLetra(self, "…", negrito, tam)
    local letras, soma = {}, 0
    for c in str:gmatch(LETRA) do
        soma = soma + larguraLetra(self, c, negrito, tam) + t
        if soma > resto then break end
        letras[#letras + 1] = c
    end
    return (table.concat(letras):gsub(" +$", "")) .. "…"
end

-- Selo do cartão de cima: preto, texto branco espaçado, 24 de altura.
local function seloCartao(self, bb, texto, x, y)
    local w = larguraEspacada(self, texto, true, 11, 1) + 24
    self:ret(bb, x, y, w, 24, PRETO)
    espacado(self, bb, texto, x + 12, y + 4.5, true, 11, BRANCO, 1)
end

-- Quebra um texto espaçado em até `max_linhas` linhas de `largura`, pelas palavras; o que sobra vai para a
-- última linha, cortada com "…" (o livro de agora).
local function quebrar(self, str, negrito, tam, t, largura, max_linhas)
    local linhas, atual = {}, ""
    for palavra in str:gmatch("%S+") do
        local junto = atual == "" and palavra or atual .. " " .. palavra
        if atual == "" or larguraEspacada(self, junto, negrito, tam, t) <= largura then
            atual = junto
        else
            linhas[#linhas + 1], atual = atual, palavra
        end
    end
    if atual ~= "" then linhas[#linhas + 1] = atual end
    if #linhas > max_linhas then
        linhas[max_linhas] = table.concat(linhas, " ", max_linhas)
        for i = #linhas, max_linhas + 1, -1 do linhas[i] = nil end
    end
    for i, l in ipairs(linhas) do linhas[i] = cortar(self, l, negrito, tam, t, largura) end
    return linhas
end

-- O desenho de um bicho dormindo, da espécie ativa: repouso_<fase> ou, sem ele, o da fase; o ovo é o ovo.
local function desenhoDormindo(s)
    local fase = Estado.fase(s).nome
    if fase == "ovo" then return "ovo" end
    local nome = "repouso_" .. fase
    return Desenho.resolver(nome) == nome and nome or fase
end

-- O tamanho dos bichos nos cartões pelo que está desenhado, não pelo quadro de 64 (07/11/2026): o filhote
-- dormindo ocupa 36x23 do quadro e, na escala do adulto, ficava minúsculo. Cada desenho ganha a maior escala
-- inteira em que cabe na área, até `max_escala` (os pequenos crescem, mas continuam menores que o adulto);
-- os pés ficam em `base` e o meio do desenho em `cx`. `ref` é o desenho que dá a medida (a fase, para o
-- humor do momento não mudar o tamanho). Na espécie ativa (Species.com para os outros).
local caixas_desenho = {}
local function caixaDoDesenho(nome)
    local real = Desenho.resolver(nome)
    local chave = Species.current().id .. ":" .. real
    if not caixas_desenho[chave] then
        local x0, x1, y0, y1 = math.huge, -1, math.huge, -1
        for i, l in ipairs(Desenho.sprite(real) or {}) do
            local a = l:find("[^ ]")
            if a then
                x0, x1 = math.min(x0, a - 1), math.max(x1, #l - l:reverse():find("[^ ]"))
                y0, y1 = math.min(y0, i - 1), i - 1
            end
        end
        caixas_desenho[chave] = x1 < 0 and { 0, 0, Desenho.LARGURA, Desenho.LARGURA } or { x0, y0, x1 - x0 + 1, y1 - y0 + 1 }
    end
    return caixas_desenho[chave]
end

local function pintarNoLugar(self, bb, nome, ref, cx, base, larg, alt, max_escala, no_meio, trocar)
    local c = caixaDoDesenho(ref or nome)
    local escala = math.max(1, math.min(max_escala, math.floor(larg * self.k / c[3]), math.floor(alt * self.k / c[4])))
    if no_meio then base = base - (alt - c[4] * escala / self.k) / 2 end  -- no meio da área, não no pé dela
    Desenho.pintarSprite(bb, nome, self.ox + self:px(cx) - math.floor((c[1] + c[3] / 2) * escala),
        self.oy + self:px(base) - (c[2] + c[4]) * escala, escala, trocar)
end

-- As casas do bando como no Figma (337:963 e 337:979, 07/11/2026): o desenho com os pés a 98 do alto da casa e
-- o nome (ou EM SEGREDO) com o alto das letras a 117, na mesma linha em todas. O ovo pronto é pequeno (escala 5)
-- e tem brilhos; o ovo em segredo é a silhueta do ovo da traça inteiro, num cinza só e sem a sombra (07/11/2026),
-- e o cadeado e o rótulo em cinza mais escuro.
local CASA_PES, CASA_NOME = 98, 117 - 0.4 * 12
local OVO_SEGREDO = { cor = Blitbuffer.Color8(0xC7), rgb = false }
-- brilhos do ovo pronto, em quadrados de 3 a partir do meio da casa: { dx, dy (do alto da casa), cruz? }
local BRILHOS = { { -18, 34.5, true }, { 21.5, 30.5, false }, { 30.5, 51.5, true } }

local function nomeDe(s)  -- da espécie ativa
    return s.nome and maiusculas(s.nome) or Species.texto("titulo")
end

-- Pedido de 07/11/2026: sem a linha de resumo embaixo do título, o ninho mais longe das casas e as casas
-- terminando a 20 do pé da tela (a mesma margem dos lados); o cartão de cima cresce para ocupar o espaço.
-- O acordado fica só no cartão de cima: o ninho mostra quem espera (como no Figma), então tudo que tem borda
-- preta e sombra ali é tocável. Quem vai dormir volta para o ninho.
function TracaTela:pintarNinhada(bb, s, agora)
    local ninhada, ativo = self.traca.ninhada, Brood.speciesOf(s)
    self:cartaoAtivo(bb, s, agora, 82, 318)
    self:texto(bb, T"O BANDO", 20, 430, true, 12)  -- era O NINHO; repetia NINHADA (07/11/2026)
    local outros = {}
    for _, id in ipairs(NINHO) do
        if id ~= ativo then outros[#outros + 1] = id end
    end
    for i = 1, CASAS do
        local x, y = 20 + ((i - 1) % 4) * 148, 476 + math.floor((i - 1) / 4) * 172
        self:casaDoNinho(bb, outros[i], x, y, 134, 150, ninhada)
    end
end

--- O cartão do bicho acordado, como no mockup do usuário (07/11/2026): o selo e o desenho grande, sem fundo; ao
-- lado a espécie e a fase, o nome grande, a obsessão (e o jeito, se a espécie já tem palavras para ele), uma
-- linha, e o livro de agora, as páginas, os livros terminados e a barra em quadrados. Rótulos em cinza com as
-- letras afastadas; 28 de folga à direita. Tocar volta para a tela dele.
function TracaTela:cartaoAtivo(bb, s, agora, y, h)
    self:cartao(bb, 20, y, 578, h, true)
    -- o desenho no meio do lado esquerdo, os pés a 22 do pé do cartão; sem passar do selo (230 de altura)
    pintarNoLugar(self, bb, Estado.sprite(s, agora), Estado.fase(s).nome, 152, y + 296, 214, 230, 10)
    -- A coluna da direita em dois grupos (07/11/2026, "a hierarquia tá solta"): o nome e a espécie e fase
    -- presos no alto; e embaixo, a mesma distância da borda que o nome tem do alto, a obsessão e o jeito
    -- pousados na linha cinza, o livro de agora e os números. O que sobra fica entre os dois grupos. Os
    -- números são o pé do grupo de baixo; o resto sobe quando o livro tem 2 linhas.
    -- Medidas em "alto da letra" (o texto começa 1/3 do tamanho acima dele).
    seloCartao(self, bb, T"NA ATIVA", 50, y + 35.5)  -- o meio do selo na altura do meio do nome
    local ix, dx = 276, 570  -- a coluna de texto e onde ela termina
    local iw = dx - ix
    -- o nome em cima, com o lápis ao lado (07/11/2026), e embaixo a espécie e a fase
    local nw = self:textoQueCabe(bb, self:nomeDoBicho(), ix, y + 27, true, 30, PRETO, iw - 27)
    local lx = ix + nw + 10
    for _, r in ipairs(LAPIS) do
        self:ret(bb, lx + r[1] * 1.5, y + 39 + r[2] * 1.5, r[3] * 1.5, r[4] * 1.5, CINZA_55)
    end
    local fase = Estado.fase(s)
    espacado(self, bb, Species.texto("titulo") .. " · " .. (TITULO_FASE[fase.nome] or maiusculas(fase.titulo)),
        ix, y + 62, false, 12, CINZA_88, 3)  -- alto da letra a 8 do pé do nome
    local linhas = {}
    if s.tema_dominante then
        linhas[#linhas + 1] = string.format(Species.texto("obsessao"), maiusculas(Memoria.tema(s.tema_dominante, "por")))
    end
    -- o jeito só quando já está marcado e só em palavras, nunca quanto (07/11/2026): até 2, numa linha
    if Tracos.banco() then  -- só a espécie que já tem palavras para o jeito (o gato, desde o lote 5a)
        local jeitos = Tracos.rotulos(s.tracos, 2)
        if #jeitos > 0 then linhas[#linhas + 1] = maiusculas(table.concat(jeitos, " · ")) end
    end
    -- a ficha de vida (07/11/2026): só o que é deste bicho e não está na tela inicial. O livro de agora com a
    -- largura toda, em até 2 linhas; embaixo, três números grandes com o rótulo pequeno: dias de vida (sem os
    -- dormidos, traca_brood.lua), livros terminados e geração.
    local livro = s.livro_corrente or s.ultimo_livro
    local linhas_livro = quebrar(self, livro and maiusculas(livro) or "—", true, 14, 1, iw, 2)
    local sobe = 20 * (#linhas_livro - 1)
    local linha_y = y + 181.6 - sobe
    -- a obsessão e o jeito pousados na linha cinza (a última termina 16 acima dela), e não colados no nome
    for i, l in ipairs(linhas) do
        espacado(self, bb, cortar(self, l, false, 12, 1.5, iw), ix, linha_y - 28.4 - 16.4 * (#linhas - i), false, 12,
            PRETO, 1.5)
    end
    self:ret(bb, ix, linha_y, iw, 1.5, CINZA_BB)  -- mais fina que as bordas; 18 acima do AGORA
    espacado(self, bb, T"LENDO", ix, y + 195.6 - sobe, false, 12, CINZA_88, 3)
    for i, l in ipairs(linhas_livro) do  -- a última linha termina 22 acima dos números
        espacado(self, bb, l, ix, y + 211.4 - sobe + 20 * (i - 1), true, 14, PRETO, 1)
    end
    local terminados = 0
    for titulo, L in pairs(s.livros or {}) do
        if L.terminado and (type(s.meus_livros) ~= "table" or s.meus_livros[titulo]) then terminados = terminados + 1 end
    end
    local dias = math.max(1, math.floor((agora - (s.nascimento or agora)) / 86400) + 1)
    local numeros = {
        { tostring(dias), dias == 1 and T"DIA" or T"DIAS" },
        { tostring(terminados), terminados == 1 and T"LIVRO" or T"LIVROS" },
        { tostring(s.geracao or 1), T"GERAÇÃO" },
    }
    for i, n in ipairs(numeros) do
        local nx = ix + 90 * (i - 1)
        espacado(self, bb, n[1], nx, y + 239.9, true, 24, PRETO, 1)
        espacado(self, bb, n[2], nx, y + 268.6, false, 12, CINZA_88, 3)  -- o pé a 37 da borda, como o nome no alto
    end
    self:alvo(20, y, 578, h, function() self:entrar("casa") end)
    self:alvo(ix - 6, y + 28, nw + 10 + 16.5 + 14, 40, function() self:pedirNome(false) end)  -- o nome e o lápis
end

--- Uma casa do ninho: um bicho que dorme (toque acorda), um ovo que nunca chocou (NOVIDADE!, toque choca) ou,
-- sem espécie, um segredo cinza com cadeado.
function TracaTela:casaDoNinho(bb, id, x, y, w, h, ninhada)
    local cx = x + w / 2
    if not id then
        moldura(self, bb, x, y, w, h, CINZA_BB)
        Species.com("traca", function()  -- o mesmo ovo para todo segredo, seja qual for a espécie acordada
            local c = caixaDoDesenho("ovo")
            local sombra = c[2] + c[4] - 3  -- nas 3 últimas linhas, o cinza claro é a sombra: fica de fora
            pintarNoLugar(self, bb, "ovo", nil, cx, y + CASA_PES, w - 16, 70, 5, false,
                function(j, tinta) if j > sombra and tinta.lum >= 0xBB then return nil end return OVO_SEGREDO end)
        end)
        for _, r in ipairs(CADEADO) do self:ret(bb, x + w - 28 + r[1] * 1.5, y + 12 + r[2] * 1.5, r[3] * 1.5, r[4] * 1.5, CINZA_88) end
        centradoQueCabe(self, bb, T"EM SEGREDO", cx, y + CASA_NOME, true, 12, CINZA_88, w - 16)
        return
    end
    -- a casa tocável, com a sombra, ocupa o mesmo quadrado das em segredo (pedido de 07/11/2026): a grade fica
    -- alinhada e a casa parece levantada dentro do lugar dela
    local dorme = ninhada.sleeping[id]
    w, h = w - 6, h - 6
    cx = x + w / 2
    self:cartao(bb, x, y, w, h, true)
    local nome
    if dorme then  -- quem dorme: o desenho e o nome; o desenho já mostra que dorme (07/11/2026, sem DORMINDO)
        nome = Species.com(id, function()
            pintarNoLugar(self, bb, desenhoDormindo(dorme), nil, cx, y + CASA_PES, w - 16, 74, 6)
            return nomeDe(dorme)
        end)
    else  -- o ovo pronto: pequeno, no meio, com os brilhos, e só o nome embaixo
        nome = Species.com(id, function()
            pintarNoLugar(self, bb, "ovo", nil, cx, y + CASA_PES, w - 16, 70, 5)
            return Species.texto("ovo_nome")
        end)
        for _, b in ipairs(BRILHOS) do
            local bx, by = cx + b[1], y + b[2]
            self:ret(bb, bx - 1.5, by - 1.5, 3, 3, PRETO)
            if b[3] then
                self:ret(bb, bx - 1.5, by - 4.5, 3, 3, PRETO); self:ret(bb, bx - 1.5, by + 1.5, 3, 3, PRETO)
                self:ret(bb, bx - 4.5, by - 1.5, 3, 3, PRETO); self:ret(bb, bx + 1.5, by - 1.5, 3, 3, PRETO)
            end
        end
        selo(self, bb, T"PRONTO!", cx, y - 10, true)
    end
    centradoQueCabe(self, bb, nome, cx, y + CASA_NOME, true, 12, PRETO, w - 16)
    self:alvo(x - 4, y - 4, w + 14, h + 14, function() self:trocarPara(id, nome, not dorme) end)
end

--- Pergunta antes de trocar: quem está acordado vai dormir, com o tempo parado. Acordar quem dorme fica na
-- ninhada (07/11/2026): o que acordou sobe para o cartão e o outro desce para o ninho, à vista, e dá para
-- destrocar ali mesmo. Chocar um ovo vai para a tela do bicho novo e pergunta o nome: nascer é um momento.
function TracaTela:trocarPara(id, nome, chocar)
    local quem = self:nomeDoBicho()
    local texto = chocar and string.format(T"Chocar este ovo?\n%s vai dormir com o tempo parado: sem fome e sem envelhecer.", quem)
        or string.format(T"Acordar %s?\n%s vai dormir com o tempo parado: sem fome e sem envelhecer.", nome, quem)
    local titulo, corpo = texto:match("^(.-)\n(.*)$")
    -- a pergunta no desenho do app (07/11/2026), em vez da caixa do KOReader: pintarConfirmacao. Só a pergunta e
    -- a frase embaixo: a despedida de quem vai dormir e a fala de dentro do ovo (lote 4) saíram da caixa; ficam
    -- guardadas em traca_species.lua (despedidas, ovo_fala)
    self.confirmacao = {
        id = id, chocar = chocar, dorme = self.traca.ninhada.sleeping[id],
        titulo = maiusculas(titulo or texto), corpo = maiusculas(corpo or ""),
        ok = maiusculas(chocar and T"Chocar" or T"Acordar"), cancelar = maiusculas(T"Cancelar"),
        acao = function()
            if not self.traca:acordar(id) then return end
            if chocar then
                self:entrar("casa")
                self:reiniciar()
                UIManager:scheduleIn(0.3, function() self:pedirNome(true) end)
            else
                self:reiniciar()  -- continua na ninhada, já com a troca feita
            end
        end,
    }
    self:atualizar()
end

-- Botão do app, texto bold 15 no meio, ocupando w x h: o principal levantado (cartão com sombra, a sombra
-- dentro do quadrado, como as casas do ninho), o outro chato, só a borda (07/11/2026).
local function botao(self, bb, texto, x, y, w, h, acao, levantado)
    if levantado then w, h = w - 6, h - 6 end
    self:cartao(bb, x, y, w, h, levantado)
    local t = 15  -- o meio das maiúsculas no meio do botão (Silkscreen: começam 0,4 do tamanho abaixo, altura 0,61)
    self:texto(bb, texto, 0, y + math.floor((h - 0.61 * t) / 2 - 0.4 * t + 0.5), true, t, PRETO, x + w / 2)
    self:alvo(x - 6, y - 6, w + 12 + (levantado and 6 or 0), h + 12 + (levantado and 6 or 0), acao)
end

--- A pergunta antes de trocar de bicho, por cima da ninhada: o desenho de quem vai acordar (ou o ovo), a
-- pergunta, a frase embaixo (quem vai dormir, com o tempo parado) e os botões Cancelar e Acordar/Chocar. A tela
-- de trás fica clareada, como um véu (sem lightenRect, numa margem branca em volta da caixa); tocar fora dela
-- cancela (TracaTela:onTap).
function TracaTela:pintarConfirmacao(bb)
    local c = self.confirmacao
    self.camada = "confirmacao"
    local x, w, cx, area = 49, 520, 309, 150
    local titulo = quebrar(self, c.titulo, true, 20, 1, w - 60, 2)
    local corpo = quebrar(self, c.corpo, false, 12, 1, w - 80, 4)
    local h = 28 + area + 22 + 26 * #titulo + 10 + 18 * #corpo + 26 + 66 + 22
    local y = math.floor((824 - h) / 2)
    if bb.lightenRect then
        bb:lightenRect(self.dimen.x, self.dimen.y, self.dimen.w, self.dimen.h, 0.75)
    else
        self:ret(bb, x - 14, y - 14, w + 34, h + 34, BRANCO)
    end
    self:cartao(bb, x, y, w, h, true)
    local base = y + 28 + area
    Species.com(c.id, function()  -- acordado, como vai ficar (o ovo, para chocar)
        pintarNoLugar(self, bb, c.chocar and "ovo" or Estado.fase(c.dorme).nome, nil, cx, base, 200, area, 6, true)
    end)
    local ty = base + 22
    for i, l in ipairs(titulo) do
        espacado(self, bb, l, cx - larguraEspacada(self, l, true, 20, 1) / 2, ty + 26 * (i - 1), true, 20, PRETO, 1)
    end
    local cy = ty + 26 * #titulo + 10
    for i, l in ipairs(corpo) do
        espacado(self, bb, l, cx - larguraEspacada(self, l, false, 12, 1) / 2, cy + 18 * (i - 1), false, 12, CINZA_55, 1)
    end
    local by = cy + 18 * #corpo + 26
    botao(self, bb, c.cancelar, cx - 12 - 206, by, 206, 66, function() self.confirmacao = nil end)
    botao(self, bb, c.ok, cx + 12, by, 206, 66, function()
        self.confirmacao = nil
        c.acao()
    end, true)
    self.camada = "conteudo"
end

-- Cartões de texto (memorial) --------------------------------------------------------

--- Altura (em pontos do Figma) que um texto ocupa numa largura, com a fonte pixel.
function TracaTela:alturaTexto(texto, negrito, tam, largura)
    local t = TextBoxWidget:new{ text = texto, face = self:face(negrito, tam), width = self:px(largura) }
    local h = t:getSize().h / self.k
    t:free()
    return h
end

--- Cartão com rótulo e texto, da altura do texto (até altura_max). Devolve o y logo abaixo.
function TracaTela:caixaTexto(bb, y, rotulo, texto, altura_max)
    texto = maiusculas(texto)
    local altura = math.min(altura_max, math.ceil(self:alturaTexto(texto, false, 13, 530)) + 52)
    self:cartao(bb, 20, y, 578, altura, true)
    self:texto(bb, rotulo, 40, y + 14, true, 11, CINZA_55)
    local t = TextBoxWidget:new{
        text = texto, face = self:face(false, 13), width = self:px(530),
        height = self:px(altura - 46), height_overflow_show_ellipsis = true,
    }
    t:paintTo(bb, self.ox + self:px(40), self.oy + self:px(y + 36))
    t:free()
    return y + altura + 18
end

--- Modo dev: salva cada tela em PNG (koreader/traca/demo), na resolução do aparelho.
function TracaTela:exportarTelas(pasta)
    local lfs = require("libs/libkoreader-lfs")
    local DataStorage = require("datastorage")
    pasta = pasta or DataStorage:getDataDir() .. "/traca/demo"
    local mae = pasta:match("^(.*)/[^/]+$")
    if mae and lfs.attributes(mae, "mode") ~= "directory" then lfs.mkdir(mae) end
    if lfs.attributes(pasta, "mode") ~= "directory" then lfs.mkdir(pasta) end
    local bb = Desenho.novoBuffer(Screen:getWidth(), Screen:getHeight())
    local s = self.traca.estado
    local n, falhas = 0, 0
    self.exportando = true  -- sem o selo SIMULAÇÃO nas imagens
    local function foto(nome, preparar)
        local ok = pcall(function()
            self.menu_aberto = false
            preparar()
            bb:fill(BRANCO)
            self:paintTo(bb, 0, 0)
            bb:writePNG(string.format("%s/%02d-%s.png", pasta, n + 1, nome))
        end)
        if ok then n = n + 1 else falhas = falhas + 1 end
    end
    foto("casa", function() self.modo = nil; self.mensagem = nil end)
    foto("menu", function() self.modo = nil; self.menu_aberto = true end)
    foto("diario", function() self:entrar("diario") end)
    foto("diario-2", function() self.pag = 2 end)
    foto("caderno", function() self:entrar("caderno") end)
    foto("caderno-trecho", function() self.livro_aberto = 1; self.pag = 1 end)
    foto("conquistas", function() self:entrar("conquistas") end)
    foto("conquistas-2", function() self.pag = 2 end)
    foto("estante", function() self.pag = 3 end)
    foto("linhagem", function() self:entrar("linhagem") end)
    if #(s.linhagem or {}) > 0 then
        foto("memorial", function() self:entrar("linhagem"); self.geracao_aberta = #s.linhagem; self.pag = 1 end)
    end
    foto("percepcao", function() self:entrar("percepcao") end)
    -- demonstração: falas e sonhos escolhidos (dev_falas e dev_sonhos, postos no estado simulado), uma tela
    -- para cada, no lugar dos sorteados
    for i, f in ipairs(s.dev_falas or {}) do
        foto("casa-" .. i, function() self:entrar("casa"); self.mensagem = nil; self.fala = f end)
    end
    bb:free()
    if pcall(TracaTela.gerarTelaDescanso, s, string.format("%s/%02d-descanso.png", pasta, n + 1), os.time()) then n = n + 1 end
    for i, f in ipairs(s.dev_sonhos or {}) do
        s.fala_descanso = f
        if pcall(TracaTela.gerarTelaDescanso, s, string.format("%s/%02d-descanso-%d.png", pasta, n + 1, i), os.time(), false) then
            n = n + 1
        end
    end
    self.exportando = false
    self:entrar("casa")
    return n, pasta, falhas
end

--- Modo dev: exporta as telas de cada simulação em koreader/traca/simulacoes/*.lua, cada uma na sua pasta em
-- koreader/traca/demo/<nome do arquivo>/. Não salva nada: no fim volta o estado que estava aberto.
function TracaTela:exportarSimulacoes()
    local lfs = require("libs/libkoreader-lfs")
    local DataStorage = require("datastorage")
    local LuaSettings = require("luasettings")
    local base = DataStorage:getDataDir() .. "/traca"
    local arquivos = {}
    if lfs.attributes(base .. "/simulacoes", "mode") == "directory" then
        for f in lfs.dir(base .. "/simulacoes") do
            if f:match("%.lua$") then arquivos[#arquivos + 1] = f end
        end
    end
    table.sort(arquivos)
    local traca, antes = self.traca, self.traca.estado
    self:pararAnimacao()
    local sims, telas, falhas = 0, 0, 0
    for _, f in ipairs(arquivos) do
        local ok, sim = pcall(function() return LuaSettings:open(base .. "/simulacoes/" .. f):readSetting("estado") end)
        if ok and type(sim) == "table" then
            traca.estado = Estado.normalizar(sim, os.time())
            traca.estado.dev_simulacao = true
            Estado.passarTempo(traca.estado, os.time())
            self.fala, self.quadro_atual = nil, nil  -- nada da simulação anterior
            local n, _, x = self:exportarTelas(base .. "/demo/" .. (f:gsub("%.lua$", "")))
            sims, telas, falhas = sims + 1, telas + n, falhas + x
        else
            falhas = falhas + 1
        end
    end
    traca.estado = antes
    self.fala, self.quadro_atual = nil, nil
    return sims, telas, falhas
end

-- Painel dev: o que ela percebeu do livro atual ----------------------------------------

local NOMES_EVENTO = { morte = T"MORTE", casamento = T"CASAMENTO", viagem = T"VIAGEM", carta = T"CARTA",
    tempestade = T"TEMPESTADE", doenca = T"DOENÇA", festa = T"FESTA", briga = T"BRIGA", fuga = T"FUGA", crime = T"CRIME" }

function TracaTela:pintarPercepcao(bb, s)
    local livro = s.ultimo_livro
    local P = livro and Memoria.percepcao(s, livro)
    if not P then
        self:rodapeFala(bb, s, T"Ainda não percebi nada. Leia umas páginas com esta versão.", 380)
        return
    end
    local linhas = { T"LIVRO: " .. maiusculas(livro), "" , T"PERSONAGENS (VEZES · FALAS · CAPÍTULOS)" }
    for i, p in ipairs(P.personagens) do
        if i > 8 then break end
        linhas[#linhas + 1] = string.format("  %s%s  %d · %d · %d", p.protagonista and "★ " or "", maiusculas(p.nome), p.vezes, p.falas, p.capitulos)
    end
    local lug = {}
    for i, l in ipairs(P.lugares) do if i <= 6 then lug[#lug + 1] = maiusculas(l[1]) end end
    linhas[#linhas + 1] = ""
    linhas[#linhas + 1] = T"LUGARES: " .. (#lug > 0 and table.concat(lug, ", ") or "—")
    local tem = {}
    for i, t in ipairs(P.temas) do if i <= 4 then tem[#tem + 1] = string.format("%s %d", maiusculas(Memoria.tema(t[1])), math.floor(t[2] + 0.5)) end end
    linhas[#linhas + 1] = T"TEMAS: " .. (#tem > 0 and table.concat(tem, " · ") or "—")
    local refs = {}
    for i, r in ipairs(P.referencias or {}) do if i <= 4 then refs[#refs + 1] = string.format("%s %d", maiusculas(r[1]), r[2]) end end
    linhas[#linhas + 1] = T"CITADOS: " .. (#refs > 0 and table.concat(refs, " · ") or "—")
    local narr = P.narrador
    linhas[#linhas + 1] = T"NARRADOR: " .. (not narr and "?" or not narr.primeira and T"TERCEIRA PESSOA"
        or (T"PRIMEIRA PESSOA" .. (narr.genero == "f" and (" · " .. T"MULHER") or narr.genero == "m" and (" · " .. T"HOMEM") or "")))
    local tr = {}
    for _, t in ipairs(Tracos.LISTA) do
        local v = (s.tracos or {})[t.id] or 0
        tr[#tr + 1] = string.format("%s %+d", Tracos.rotulo(v >= 0 and t.pos or t.neg), math.floor(v + 0.5))
    end
    linhas[#linhas + 1] = T"TRAÇOS: " .. table.concat(tr, " · ")
    linhas[#linhas + 1] = ""
    linhas[#linhas + 1] = T"ÚLTIMOS CAPÍTULOS (PÁG · CLIMA · EVENTOS)"
    for i, c in ipairs(P.capitulos) do
        if i > 6 then break end
        local evs = {}
        for ev in pairs(c.C.eventos or {}) do evs[#evs + 1] = NOMES_EVENTO[ev] or ev end
        local clima = c.C.paginas > 0 and c.C.clima / c.C.paginas or 0
        linhas[#linhas + 1] = string.format("  %s · %d · %+.1f · %s", maiusculas(c.nome):sub(1, 22), c.C.paginas, clima,
            #evs > 0 and table.concat(evs, ", ") or "—")
    end
    local p = s.comentario_pendente
    linhas[#linhas + 1] = ""
    linhas[#linhas + 1] = T"ÚLTIMO COMENTÁRIO DE CAPÍTULO: " .. (p and (maiusculas(p.texto) .. (p.usado and T" (JÁ DITO)" or "")) or "—")
    local caixa = TextBoxWidget:new{
        text = table.concat(linhas, "\n"), face = self:face(false, 11), width = self:px(578),
        height = self:px(700), height_overflow_show_ellipsis = true,
    }
    caixa:paintTo(bb, self.ox + self:px(20), self.oy + self:px(90))
    caixa:free()
end

function TracaTela:atualizar()
    UIManager:setDirty(self, "ui")
end

-- Animação ------------------------------------------------------------------------

function TracaTela:iniciarAnimacao()
    self.quadros = Desenho.quadros(Estado.quadros(self.traca.estado, os.time()))
    self.quadro_atual = nil
    if not self.quadros then return end
    if not self.anim_ate then
        self.anim_ate = os.time() + 60 * ANIMACAO_MINUTOS
    end
    self.quadro = 0
    UIManager:scheduleIn(QUADRO_SEGUNDOS, self.tick)
end

function TracaTela:pararAnimacao()
    UIManager:unschedule(self.tick)
end

function TracaTela:proximoQuadro()
    local agora = os.time()
    if agora >= (self.anim_ate or 0) then
        self.anim_ate = nil
        return
    end
    self.quadro = self.quadro % #self.quadros + 1
    self.quadro_atual = self.quadros[self.quadro]
    UIManager:setDirty(self, function() return "ui", self.sprite_rect end)
    UIManager:scheduleIn(QUADRO_SEGUNDOS, self.tick)
end

function TracaTela:reiniciar()
    self:pararAnimacao()
    self.fala = nil
    self:iniciarAnimacao()
    self:atualizar()
end

-- Toques ----------------------------------------------------------------------------

function TracaTela:carinho()
    -- a species with lines of its own (the cat) answers with them; the silverfish keeps these fixed ones
    if self.traca:carinho() then
        self.mensagem = Estado.falaPropria(self.traca.estado, "carinho") or T"Hm. Tá. Pode continuar."
    elseif self.traca.estado.hibernando then
        self.mensagem = Estado.falaPropria(self.traca.estado, "casulo")
            or T"(escondida na lombada; leia uma página para ela sair)"
    else
        self.mensagem = T"Já chega de carinho por agora."
    end
    self:atualizar()
end

function TracaTela:onTap(_, ges)
    local pos = ges and ges.pos
    if not pos then return end
    local alvos = self.alvos or {}
    if self.confirmacao then  -- com a pergunta aberta, só os botões dela respondem; tocar fora cancela
        for i = #alvos, 1, -1 do
            local a = alvos[i]
            if a.camada == "confirmacao" and pos:intersectWith(a.rect) then
                if a.acao() ~= "fechou" then self:atualizar() end
                return true
            end
        end
        self.confirmacao = nil
        self:atualizar()
        return true
    end
    for i = #alvos, 1, -1 do  -- os desenhados por último (menu) têm prioridade
        local a = alvos[i]
        if (not self.menu_aberto or a.camada ~= "conteudo") and pos:intersectWith(a.rect) then
            if a.acao() ~= "fechou" then self:atualizar() end
            return true
        end
    end
    if self.menu_aberto then
        self.menu_aberto = false
        self:atualizar()
        return true
    end
    if not self.modo and pos:intersectWith(self.sprite_rect) then
        self:carinho()
        return true
    end
end

function TracaTela:onHold(_, ges)
    local pos = ges and ges.pos
    if self.modo or not (pos and pos:intersectWith(self.sprite_rect)) then return end
    self:menuAjustes()
    return true
end

--- Ajustes: tela de descanso, abrir ao iniciar, atalho por gesto, idioma (e modo dev).
-- Abre pela engrenagem do topo ou segurando no bichinho.
function TracaTela:menuAjustes()
    local dialogo
    local botoes = {
            {{
                text = self.traca:telaDescansoAtiva() and T"Tela de descanso: ligada" or T"Tela de descanso: desligada",
                callback = function()
                    UIManager:close(dialogo)
                    self.traca:alternarTelaDescanso()
                end,
            }},
            {{
                text = self.traca:abrirAoIniciar() and T"Abrir ao iniciar: ligado" or T"Abrir ao iniciar: desligado",
                callback = function()
                    UIManager:close(dialogo)
                    self.traca:abrirAoIniciar(not self.traca:abrirAoIniciar())
                end,
            }},
            {{
                text = self.traca:atalhoGesto() and T"Atalho por gesto: ligado" or T"Atalho por gesto: desligado",
                callback = function()
                    UIManager:close(dialogo)
                    self.traca:atalhoGesto(not self.traca:atalhoGesto())
                end,
            }},
    }
    table.insert(botoes, {{ text = T"Nome…", callback = function()
        UIManager:close(dialogo)
        self:pedirNome(false)
    end }})
    table.insert(botoes, {{ text = T"Idioma…", callback = function()
        UIManager:close(dialogo)
        self:menuIdioma()
    end }})
    if TracaTela.devLigado() then
        table.insert(botoes, {{ text = T"Modo dev…", callback = function()
            UIManager:close(dialogo)
            self:menuDev()
        end }})
    end
    dialogo = ButtonDialog:new{ buttons = botoes }

    UIManager:show(dialogo)
end

--- Idioma: automático (segue o KOReader), português ou inglês. Vale depois de reiniciar.
function TracaTela:menuIdioma()
    local Lingua = require("traca_lingua")
    local atual = Lingua.escolha()
    local dialogo
    local function opcao(texto, valor)
        return {{ text = (atual == valor and "▸ " or "") .. texto, callback = function()
            UIManager:close(dialogo)
            if valor == atual then return end
            Lingua.salvarEscolha(valor)
            UIManager:show(require("ui/widget/infomessage"):new{
                text = "Reinicie o KOReader para trocar o idioma.\nRestart KOReader to change the language.",
            })
        end }}
    end
    dialogo = ButtonDialog:new{
        title = T"Idioma da Traça",
        buttons = { opcao(T"Automático (idioma do KOReader)", "auto"), opcao("Português", "pt"), opcao("English", "en") },
    }
    UIManager:show(dialogo)
end

--- Modo dev: só existe se o arquivo koreader/traca/dev existir. Muda fase e humor para teste.
function TracaTela:menuDev(fechar_anterior)
    local s = self.traca.estado
    local dialogo
    local function acao(fn)
        return function()
            UIManager:close(dialogo)
            fn()
            self.traca:salvar(true)
            self.mensagem = nil
            self:reiniciar()
        end
    end
    local fases = {}
    for _, f in ipairs(Estado.fases()) do
        fases[#fases + 1] ={ text = (s.dev_fase == f.nome and "▸ " or "") .. f.titulo, callback = acao(function() s.dev_fase = f.nome end) }
    end
    dialogo = ButtonDialog:new{
        title = T"TRAÇA · MODO DEV",
        buttons = {
            fases,
            {
                { text = T"Faminta", callback = acao(function() s.barriga, s.humor = 5, 40 end) },
                { text = T"Ranzinza", callback = acao(function() s.barriga, s.humor = 60, 10 end) },
                { text = T"Feliz", callback = acao(function() s.barriga, s.humor = 90, 90 end) },
            },
            {
                { text = s.dev_noite and T"Noite: ligada" or T"Noite: desligada", callback = acao(function() s.dev_noite = not s.dev_noite or nil end) },
                { text = s.hibernando and T"Sair da lombada" or T"Esconder na lombada", callback = acao(function() s.hibernando = not s.hibernando end) },
            },
            {
                { text = T"O que ela percebeu", callback = function()
                    UIManager:close(dialogo)
                    self:entrar("percepcao")
                end },
            },
            {
                -- the brood, for testing until the brood screen exists: wake the other creature (the one awake
                -- goes to sleep with its time stopped; a species that never hatched starts as an egg)
                (function()
                    local outro = Species.current().id == "gato" and "traca" or "gato"
                    return { text = outro == "gato" and T"Acordar o gato (teste)" or T"Acordar a Traça (teste)",
                             callback = acao(function() self.traca:acordar(outro) end) }
                end)(),
            },
            {
                { text = T"Fim do ciclo (teste)", callback = function()
                    UIManager:close(dialogo)
                    s.dev_fase = nil
                    self:onClose()
                    self.traca:fimDoCiclo()
                end },
            },
            (function()
                -- carregar sempre lê o arquivo de novo (o estado real fica guardado na primeira vez)
                local linha = {
                    { text = T"Simulação de endgame", callback = function()
                        UIManager:close(dialogo)
                        if not self.traca:carregarSimulacao() then
                            UIManager:show(require("ui/widget/infomessage"):new{ text = T"Nenhuma simulação em koreader/traca/simulacao.lua." })
                        end
                        self.mensagem = nil
                        self:reiniciar()
                    end },
                }
                if self.traca:emSimulacao() then
                    linha[2] = { text = T"Voltar ao estado real", callback = function()
                        UIManager:close(dialogo)
                        self.traca:voltarEstadoReal()
                        self.mensagem = nil
                        self:reiniciar()
                    end }
                end
                return linha
            end)(),
            {
                { text = T"Exportar telas (PNG)", callback = function()
                    UIManager:close(dialogo)
                    local n, pasta, falhas = self:exportarTelas()
                    UIManager:show(require("ui/widget/infomessage"):new{
                        text = string.format(T"%d telas salvas em %s", n, pasta) .. (falhas > 0 and string.format(" (%d ✗)", falhas) or ""),
                    })
                end },
            },
            {
                { text = T"Exportar todas as simulações", callback = function()
                    UIManager:close(dialogo)
                    local InfoMessage = require("ui/widget/infomessage")
                    local aviso = InfoMessage:new{ text = T"Exportando as simulações de koreader/traca/simulacoes…" }
                    UIManager:show(aviso)
                    UIManager:forceRePaint()
                    local sims, n, falhas = self:exportarSimulacoes()
                    UIManager:close(aviso)
                    self:reiniciar()
                    UIManager:show(InfoMessage:new{
                        text = string.format(T"%d simulações, %d telas salvas em koreader/traca/demo", sims, n)
                            .. (falhas > 0 and string.format(" (%d ✗)", falhas) or ""),
                    })
                end },
            },
            {
                { text = self.traca.falha_teste and T"Falha de teste: ligada" or T"Falha de teste: desligada", callback = function()
                    UIManager:close(dialogo)
                    self.traca:alternarFalhaTeste()
                end },
            },
            {
                { text = T"Ver boas-vindas", callback = function()
                    UIManager:close(dialogo)
                    self:onClose()
                    self.traca:mostrarBoasVindas()
                end },
            },
            {
                { text = T"Sair do teste (volta ao normal)", callback = acao(function()
                    s.dev_fase, s.dev_noite, s.hibernando = nil, nil, false
                    s.barriga, s.humor = math.max(s.barriga, 60), math.max(s.humor, 60)
                end) },
            },
        },
    }
    UIManager:show(dialogo)
end

function TracaTela.devLigado()
    local okV, Versao = pcall(require, "traca_versao")
    if okV and type(Versao) == "table" and Versao.publica then return false end  -- versão da comunidade: nunca
    local lfs = require("libs/libkoreader-lfs")
    local DataStorage = require("datastorage")
    return lfs.attributes(DataStorage:getDataDir() .. "/traca/dev", "mode") == "file"
end

function TracaTela:onSuspend()
    self:pararAnimacao()
end

function TracaTela:onResume()
    self.anim_ate = nil
    self:reiniciar()
end

function TracaTela:onCloseWidget()
    self:pararAnimacao()
end

function TracaTela:onClose()
    UIManager:close(self, "flashpartial")
    return true
end

-- Proteção: um erro ao desenhar, tocar ou animar não pode travar o KOReader. Se falhar, a tela
-- mostra um aviso simples e qualquer toque fecha (para nunca prender o leitor numa tela quebrada).
local Guarda = require("traca_guarda")
Guarda.padrao:envolver(TracaTela, { "paintTo", "onTap", "onHold", "proximoQuadro" }, function(nome, self, bb, x, y)
    if nome == "paintTo" then
        bb:paintRect(x, y, self.dimen.w, self.dimen.h, BRANCO)
        local aviso = TextBoxWidget:new{
            text = T"A Traça tropeçou. Toque para fechar.", face = Font:getFace("cfont", 22), width = self.dimen.w - 80,
        }
        aviso:paintTo(bb, x + 40, y + math.floor(self.dimen.h / 3))
        aviso:free()
    elseif nome == "onTap" or nome == "onHold" then
        UIManager:close(self)
        return true
    end
end)

return TracaTela
