--[[--
Boas-vindas: aparece na primeira vez que a Traça é instalada (ou pelo modo dev).

Tela 1 · o ovo        — balão + ovo + botão CHOCAR
Tela 2 · rachou       — o ovo racha; ela só sai com as primeiras páginas lidas + CONTINUAR
Tela 3 · o nome       — o campo do nome, uma casa por caractere (abre a caixa do nome, com Sortear; traca_nome.lua)
                        + CONTINUAR. Sem nome aqui, ela pergunta de novo depois de nascer.
Tela 4 · onde me achar — 3 opções (abrir ao iniciar, gesto, cartão no Simple UI e/ou no Bookshelf) + PRONTO
Ela nasce de verdade lendo (fase ninfa, a partir de 3.000 letras), com a anotação no diário.

Reaproveita os componentes da tela da Traça (balão, cartões, fonte e escala do Figma).
]]

local Device = require("device")
local Geom = require("ui/geometry")
local GestureRange = require("ui/gesturerange")
local InputContainer = require("ui/widget/container/inputcontainer")
local UIManager = require("ui/uimanager")
local Blitbuffer = require("ffi/blitbuffer")
local Screen = Device.screen

local Desenho = require("traca_desenho")
local T = require("traca_lingua").t
local Estado = require("traca_estado")
local TracaTela = require("traca_tela")

local LARG, ALT = 618, 824
local PRETO, BRANCO = Blitbuffer.COLOR_BLACK, Blitbuffer.COLOR_WHITE
local CINZA_55, CINZA_BB = Blitbuffer.Color8(0x55), Blitbuffer.Color8(0xBB)

local BoasVindas = InputContainer:extend{
    traca = nil,
    passo = 1,
    ao_terminar = nil,  -- função chamada no fim
}

-- componentes emprestados da tela da Traça
for _, nome in ipairs({ "px", "face", "ret", "texto", "larguraTexto", "cartao", "medirBalao", "balao", "alvo",
                        "pedirNome" }) do
    BoasVindas[nome] = TracaTela[nome]
end

function BoasVindas:init()
    if Device:isTouchDevice() then
        self.ges_events.Tap = { GestureRange:new{ ges = "tap", range = function() return self.dimen end } }
    end
    if Device:hasKeys() then
        self.key_events.Close = { { Device.input.group.Back } }
    end
    self.covers_fullscreen = true
    local tam = Screen:getSize()
    self.dimen = Geom:new{ x = 0, y = 0, w = tam.w, h = tam.h }
    self.k = math.min(tam.w / LARG, tam.h / ALT)
    self.ox = math.floor((tam.w - LARG * self.k) / 2)
    self.oy = math.floor((tam.h - ALT * self.k) / 2)
    self.fator_fonte = Screen:scaleBySize(1000) / 1000
    self.faces = {}
    self.op = {
        iniciar = G_reader_settings:isTrue("traca_abrir_ao_iniciar"),
        gesto = G_reader_settings:isTrue("traca_gesto"),
    }
    -- no Simple UI o cartão já vem ligado; na prateleira do Bookshelf, só se a pessoa marcar
    if self.traca:temSimpleUI() then
        self.op.cartao = self.traca:cartaoSimpleUI()
    else
        self.op.cartao = self.traca:cartaoBookshelf()
    end
end

--- Sprite centrado, com o balão logo acima da cabeça real (como na tela principal).
function BoasVindas:sprite(bb, nome, fala, centro_y, tamanho)
    local escala = math.max(1, math.floor(tamanho * self.k / Desenho.LARGURA))
    local lado = escala * Desenho.LARGURA
    local x = self.ox + self:px(LARG / 2) - math.floor(lado / 2)
    local y = self.oy + self:px(centro_y) - math.floor(lado / 2)
    Desenho.pintarSprite(bb, nome, x, y, escala)
    local cabeca = (y - self.oy) / self.k + Desenho.topoReal(nome) * escala / self.k
    local m = self:medirBalao(fala)
    self:balao(bb, fala, nil, math.max(24, cabeca - 30 - (m.H + 15)), m)
end

-- O botão de todos os passos (mockup de 06/11/2026): 212 x 66, centrado, texto 15, sempre na mesma altura.
local BOTAO = { y = 704, w = 212, h = 66, tam = 15 }

--- Botão (cartão com sombra) com texto centralizado.
function BoasVindas:botao(bb, texto, acao)
    local x, y, w, h, t = (LARG - BOTAO.w) / 2, BOTAO.y, BOTAO.w, BOTAO.h, BOTAO.tam
    self:cartao(bb, x, y, w, h, true)
    -- o meio das maiúsculas no meio do botão (na Silkscreen: começam 0,4 do tamanho abaixo do topo, altura 0,61)
    self:texto(bb, texto, 0, y + math.floor((h - 0.61 * t) / 2 - 0.4 * t + 0.5), true, t, PRETO, LARG / 2)
    self:alvo(x - 6, y - 6, w + 12, h + 12, acao)
end

--- Opção com caixinha de marcar (quadrado de pixels, cheio quando ligada).
function BoasVindas:opcao(bb, y, titulo, detalhe, ligada, acao, desativada)
    self:cartao(bb, 20, y, 578, 74, true)
    local cx, cy = 40, y + 24
    if ligada then
        self:ret(bb, cx + 3, cy, 20, 26, PRETO)
        self:ret(bb, cx, cy + 3, 26, 20, PRETO)
        self:ret(bb, cx + 6, cy + 6, 3, 3, BRANCO)
    else
        local cor = desativada and CINZA_BB or PRETO
        self:ret(bb, cx + 3, cy, 20, 3, cor); self:ret(bb, cx + 3, cy + 23, 20, 3, cor)
        self:ret(bb, cx, cy + 3, 3, 20, cor); self:ret(bb, cx + 23, cy + 3, 3, 20, cor)
    end
    self:texto(bb, titulo, 86, y + 16, true, 15, desativada and CINZA_BB or PRETO)
    self:texto(bb, detalhe, 86, y + 42, false, 10, desativada and CINZA_BB or CINZA_55)
    if not desativada then self:alvo(14, y - 4, 590, 82, acao) end
end

-- Dado de sortear, 24x24 como os ícones do topo (mostra o 5).
local ICONE_DADO = {
    { 3, 1, 18, 2 }, { 3, 21, 18, 2 }, { 1, 3, 2, 18 }, { 21, 3, 2, 18 },
    { 2, 2, 1, 1 }, { 21, 2, 1, 1 }, { 2, 21, 1, 1 }, { 21, 21, 1, 1 },
    { 6, 6, 4, 4 }, { 14, 6, 4, 4 }, { 10, 10, 4, 4 }, { 6, 14, 4, 4 }, { 14, 14, 4, 4 },
}
local CINZA_88 = Blitbuffer.Color8(0x88)

-- Moldura dos campos das boas-vindas: borda cinza de 3 (a grossura da dos botões) com os cantos recortados, sem
-- sombra, para não parecer botão.
function BoasVindas:moldura(bb, x, y, w, h)
    self:ret(bb, x + 3, y, w - 6, 3, CINZA_88); self:ret(bb, x + 3, y + h - 3, w - 6, 3, CINZA_88)
    self:ret(bb, x, y + 3, 3, h - 6, CINZA_88); self:ret(bb, x + w - 3, y + 3, 3, h - 6, CINZA_88)
end

--- O campo do nome (mockups de 06/11/2026): na moldura, o nome no meio (ou o convite em cinza); tocar abre a caixa
-- do nome. Ao lado, o dado, num quadrado com a mesma moldura: um toque sorteia um nome direto (traca_nome.lua),
-- como no Stardew Valley.
function BoasVindas:campoNome(bb, y)
    local Nome = require("traca_nome")
    local s = self.traca.estado
    local h = 72
    local dado = Nome.temSorteio()
    local x, w = 20, dado and 578 - h - 12 or 578  -- com o dado, o campo deixa espaço para ele (12 entre os dois)
    self:moldura(bb, x, y, w, h)
    if s.nome then
        self:texto(bb, TracaTela.maiusculas(s.nome), 0, y + 19, true, 24, PRETO, x + w / 2)
    else
        self:texto(bb, T"DIGITE UM NOME", 0, y + 25, false, 15, CINZA_88, x + w / 2)
    end
    self:alvo(x - 6, y - 6, w + 12, h + 12, function()
        self:pedirNome(false, function() UIManager:setDirty(self, "ui") end)
    end)
    if dado then
        local qx = 598 - h
        self:moldura(bb, qx, y, h, h)
        local m = (h - 24 * 1.5) / 2  -- o dado em 1,5x, no meio
        for _, r in ipairs(ICONE_DADO) do
            self:ret(bb, qx + m + r[1] * 1.5, y + m + r[2] * 1.5, r[3] * 1.5, r[4] * 1.5, PRETO)
        end
        self:alvo(qx - 6, y - 6, h + 12, h + 12, function()
            s.nome, s.nome_perguntado = Nome.sortear(s.nome), true
            self.traca:salvar()
        end)
    end
end

function BoasVindas:paintTo(bb, x, y)
    self.dimen.x, self.dimen.y = x, y
    bb:paintRect(x, y, self.dimen.w, self.dimen.h, BRANCO)
    self.alvos = {}
    self.camada = "conteudo"
    -- pontinhos de progresso no rodapé (4 passos)
    for i = 1, 4 do
        self:ret(bb, LARG / 2 - 42 + (i - 1) * 24, 800, 12, 12, i == self.passo and PRETO or CINZA_BB)
    end

    if self.passo == 1 then
        self:sprite(bb, "ovo", T"(algo tremeu dentro do ovo…)", 430, 295)
        self:botao(bb, T"CHOCAR", function() self.passo = 2 end)

    elseif self.passo == 2 then
        self:sprite(bb, "ovo", T"(o ovo rachou… ela só sai quando você ler as primeiras páginas)", 430, 295)
        self:botao(bb, T"CONTINUAR", function() self.passo = 3 end)

    elseif self.passo == 3 then
        self:sprite(bb, "ovo", T"(de dentro do ovo:) E eu vou me chamar como? Capricha.", 360, 250)
        self:campoNome(bb, 600)
        self:botao(bb, T"CONTINUAR", function() self.passo = 4 end)

    else
        self:sprite(bb, "ovo", T"(de dentro do ovo:) Onde você vai me achar? Escolha. Eu espero. Mal.", 245, 170)
        self:opcao(bb, 400, T"ABRIR AO INICIAR", T"A TRAÇA APARECE QUANDO O KOREADER ABRE",
            self.op.iniciar, function() self.op.iniciar = not self.op.iniciar end)
        self:opcao(bb, 494, T"ATALHO POR GESTO", T"SEGURE O DEDO NO CANTO SUPERIOR DIREITO",
            self.op.gesto, function() self.op.gesto = not self.op.gesto end)
        local tem_sui, tem_bs = self.traca:temSimpleUI(), self.traca:temBookshelf()
        local onde = tem_sui and tem_bs and T"NO SIMPLE UI E NA PRATELEIRA DO BOOKSHELF"
            or tem_sui and T"NA TELA INICIAL DO SIMPLE UI"
            or tem_bs and T"NA PRATELEIRA INICIAL DO BOOKSHELF"
            or T"PRECISA DO SIMPLE UI OU DO BOOKSHELF 6.1"
        local tem_onde = tem_sui or tem_bs
        self:opcao(bb, 588, T"CARTÃO NA HOME", onde,
            tem_onde and self.op.cartao, function() self.op.cartao = not self.op.cartao end, not tem_onde)
        self:botao(bb, T"PRONTO", function() self:terminar() end)
    end
end

function BoasVindas:terminar()
    local s = self.traca.estado
    s.boasvindas = true
    G_reader_settings:saveSetting("traca_abrir_ao_iniciar", self.op.iniciar or nil)
    G_reader_settings:saveSetting("traca_gesto", self.op.gesto or nil)
    self.traca:aplicarGesto()
    if self.traca:temSimpleUI() then self.traca:cartaoSimpleUI(self.op.cartao) end
    if self.traca:temBookshelf() and self.traca:cartaoBookshelf() ~= self.op.cartao then
        self.traca:cartaoBookshelf(self.op.cartao)
    end
    self.traca:salvar(false)
    self.alvos = nil
    UIManager:close(self)
    if self.ao_terminar then self.ao_terminar() end
end

function BoasVindas:onTap(_, ges)
    local pos = ges and ges.pos
    if not pos then return end
    for i = #(self.alvos or {}), 1, -1 do
        local a = self.alvos[i]
        if pos:intersectWith(a.rect) then
            a.acao()
            if self.alvos then UIManager:setDirty(self, "ui") end
            return true
        end
    end
    return true
end

function BoasVindas:onClose()
    UIManager:close(self)  -- fechar no meio: continua ovo; as perguntas voltam depois
    return true
end

-- Proteção (como na tela da Traça): se falhar, toque fecha.
require("traca_guarda").padrao:envolver(BoasVindas, { "paintTo", "onTap" }, function(nome, self, bb, x, y)
    if nome == "paintTo" then
        bb:paintRect(x, y, self.dimen.w, self.dimen.h, BRANCO)
    elseif nome == "onTap" then
        UIManager:close(self)
        return true
    end
end)

return BoasVindas
