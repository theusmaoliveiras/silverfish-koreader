--[[--
Boas-vindas: aparece na primeira vez que a Traça é instalada (ou pelo modo dev).

Tela 1 · o ovo        — balão + ovo + botão CHOCAR
Tela 2 · rachou       — o ovo racha; ela só sai com as primeiras páginas lidas + CONTINUAR
Tela 3 · onde me achar — 3 opções (abrir ao iniciar, gesto, cartão no Simple UI) + PRONTO
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
for _, nome in ipairs({ "px", "face", "ret", "texto", "cartao", "medirBalao", "balao", "alvo" }) do
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
        cartao = self.traca:cartaoSimpleUI(),
    }
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

--- Botão grande (cartão com sombra) com texto centralizado.
function BoasVindas:botao(bb, texto, y, acao)
    self:cartao(bb, 20, y, 578, 80, true)
    self:texto(bb, texto, 0, y + 24, true, 24, PRETO, LARG / 2)
    self:alvo(14, y - 6, 590, 92, acao)
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

function BoasVindas:paintTo(bb, x, y)
    self.dimen.x, self.dimen.y = x, y
    bb:paintRect(x, y, self.dimen.w, self.dimen.h, BRANCO)
    self.alvos = {}
    self.camada = "conteudo"
    -- pontinhos de progresso no rodapé (3 passos)
    for i = 1, 3 do
        self:ret(bb, LARG / 2 - 30 + (i - 1) * 24, 800, 12, 12, i == self.passo and PRETO or CINZA_BB)
    end

    if self.passo == 1 then
        self:sprite(bb, "ovo", T"(algo tremeu dentro do ovo…)", 430, 295)
        self:botao(bb, T"CHOCAR", 690, function() self.passo = 2 end)

    elseif self.passo == 2 then
        self:sprite(bb, "ovo", T"(o ovo rachou… ela só sai quando você ler as primeiras páginas)", 430, 295)
        self:botao(bb, T"CONTINUAR", 690, function() self.passo = 3 end)

    else
        self:sprite(bb, "ovo", T"(de dentro do ovo:) Onde você vai me achar? Escolha. Eu espero. Mal.", 245, 170)
        self:opcao(bb, 400, T"ABRIR AO INICIAR", T"A TRAÇA APARECE QUANDO O KOREADER ABRE",
            self.op.iniciar, function() self.op.iniciar = not self.op.iniciar end)
        self:opcao(bb, 494, T"ATALHO POR GESTO", T"SEGURE O DEDO NO CANTO SUPERIOR DIREITO",
            self.op.gesto, function() self.op.gesto = not self.op.gesto end)
        local tem_sui = self.traca:temSimpleUI()
        self:opcao(bb, 588, T"CARTÃO NA HOME", tem_sui and T"NA TELA INICIAL DO SIMPLE UI" or T"SIMPLE UI NÃO INSTALADO",
            tem_sui and self.op.cartao, function() self.op.cartao = not self.op.cartao end, not tem_sui)
        self:botao(bb, T"PRONTO", 696, function() self:terminar() end)
    end
end

function BoasVindas:terminar()
    local s = self.traca.estado
    s.boasvindas = true
    G_reader_settings:saveSetting("traca_abrir_ao_iniciar", self.op.iniciar or nil)
    G_reader_settings:saveSetting("traca_gesto", self.op.gesto or nil)
    self.traca:aplicarGesto()
    if self.traca:temSimpleUI() then self.traca:cartaoSimpleUI(self.op.cartao) end
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
