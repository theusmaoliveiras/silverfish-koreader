--[[--
Integração com o Simple UI: um cartão da Traça na tela inicial e um botão de
ação rápida com a carinha dela. Usa a API pública do Simple UI para plugins
(moduleregistry e sui_quickactions); se o Simple UI não estiver instalado,
nada acontece.
]]

local Device = require("device")
local Font = require("ui/font")
local Geom = require("ui/geometry")
local GestureRange = require("ui/gesturerange")
local HorizontalGroup = require("ui/widget/horizontalgroup")
local HorizontalSpan = require("ui/widget/horizontalspan")
local InputContainer = require("ui/widget/container/inputcontainer")
local LeftContainer = require("ui/widget/container/leftcontainer")
local ProgressWidget = require("ui/widget/progresswidget")
local TextBoxWidget = require("ui/widget/textboxwidget")
local TextWidget = require("ui/widget/textwidget")
local UIManager = require("ui/uimanager")
local VerticalGroup = require("ui/widget/verticalgroup")
local VerticalSpan = require("ui/widget/verticalspan")
local Blitbuffer = require("ffi/blitbuffer")
local logger = require("logger")
local Widget = require("ui/widget/widget")
local Screen = Device.screen

local Desenho = require("traca_desenho")
local T = require("traca_lingua").t
local Estado = require("traca_estado")

local Integracao = {}

local MODULO_ID = "traca_cartao"
local ACAO_ID = "traca_abrir"

--- Ícone SVG da fase atual (ovo, ninfa, jovem, adulta ou anciã).
function Integracao.icone(traca)
    return traca.path .. "/icones/" .. Estado.fase(traca.estado).nome .. ".svg"
end

-- Cartão da tela inicial --------------------------------------------------------

-- Texto do balão: o pensamento dela (as mesmas falas da tela principal). Fica o mesmo até
-- ela comer, dormir/acordar ou passarem 20 minutos, para não trocar a cada redesenho da Home.
local TROCA_SEGUNDOS = 20 * 60
local MAX_LINHAS = 2        -- o balão do cartão é pequeno: no máximo 2 linhas
local TENTATIVAS = 12       -- quantas falas ela sorteia procurando uma que caiba (12 desde a Etapa 4 da voz:
                            -- as falas que combinam com ela são as variantes, um pouco mais longas)
local cartao_cache = {}

-- Em quantas linhas o texto quebra nessa fonte e largura (o próprio TextBoxWidget diz).
local function contarLinhas(texto, face, largura)
    local ok, n = pcall(function()
        local c = TextBoxWidget:new{ text = texto, face = face, width = largura, alignment = "center" }
        local n = c.vertical_string_list and #c.vertical_string_list or math.huge
        c:free()
        return n
    end)
    return ok and n or math.huge
end

-- linhas(texto): quantas linhas a fala ocupa no balão. Devolve o texto e as linhas.
local function textoDoCartao(traca, linhas)
    local s, agora = traca.estado, os.time()
    local e = Estado.expressao(s, agora)
    local marca = table.concat({ Estado.fase(s).nome, tostring(e == "dormindo" or e == "casulo"), s.paginas or 0 }, ":")
    if cartao_cache.texto and cartao_cache.marca == marca and agora - cartao_cache.t < TROCA_SEGUNDOS then
        return cartao_cache.texto, linhas(cartao_cache.texto)
    end
    local texto, n = Estado.falaQueCabe(s, agora, linhas, MAX_LINHAS, TENTATIVAS)
    cartao_cache.texto, cartao_cache.marca, cartao_cache.t = texto, marca, agora
    return texto, n
end

local function fonte(tam_px)
    local fator = Screen:scaleBySize(1000) / 1000
    local ok, f = pcall(Font.getFace, Font, Desenho.caminhoFonte("Silkscreen-Regular.ttf"), tam_px / fator)
    if ok and f then return f end
    return Font:getFace("cfont", tam_px / fator)
end

-- Cartão: a Traça à esquerda e um balão de pixels (rabinho apontando para ela) à direita.
local Cartao = Widget:extend{ traca = nil, largura = 0 }

function Cartao:init()
    self.u = math.max(2, math.floor(Screen:getWidth() / 618 * 3 + 0.5))   -- "pixel" do balão (3 pontos do Figma)
    self.escala = math.max(2, math.floor(Screen:getHeight() * 0.16 / Desenho.ALTURA))
    self.lado = self.escala * Desenho.ALTURA
    self.altura = self.lado
end

function Cartao:getSize()
    return Geom:new{ w = self.largura, h = self.altura }
end

function Cartao:paintTo(bb, x, y)
    self.dimen = Geom:new{ x = x, y = y, w = self.largura, h = self.altura }
    local s, agora = self.traca.estado, os.time()
    Estado.passarTempo(s, agora)
    Desenho.pintarSprite(bb, Estado.sprite(s, agora), x, y, self.escala)

    local u, PRETO, BRANCO = self.u, Blitbuffer.COLOR_BLACK, Blitbuffer.COLOR_WHITE
    local bx = x + self.lado + 4 * u          -- começo do balão (o rabinho fica antes)
    local bw = math.floor((self.largura - (bx - x) - 2 * u) * 0.72)  -- não ocupa a largura toda
    local bh = math.floor(self.altura * 0.62)
    local by = y + math.floor((self.altura - bh) / 2)
    local function r(rx, ry, rw, rh, cor) bb:paintRect(rx, ry, rw, rh, cor) end
    -- sombra, fundo e borda com cantos recortados
    r(bx + 3 * u, by + 2 * u, bw - 2 * u, bh, PRETO)
    r(bx + 2 * u, by + 3 * u, bw, bh - 2 * u, PRETO)
    r(bx + u, by + u, bw - 2 * u, bh - 2 * u, BRANCO)
    r(bx + u, by, bw - 2 * u, u, PRETO)
    r(bx + u, by + bh - u, bw - 2 * u, u, PRETO)
    r(bx, by + u, u, bh - 2 * u, PRETO)
    r(bx + bw - u, by + u, u, bh - 2 * u, PRETO)
    -- rabinho apontando para a Traça
    local ty = by + math.floor(bh / 2) - u
    r(bx, ty - u, u, 4 * u, BRANCO)
    r(bx - u, ty - u, u, u, PRETO)
    r(bx - 2 * u, ty, u, u, PRETO)
    r(bx - 3 * u, ty + u, u, u, PRETO)
    r(bx - 2 * u, ty + 2 * u, u, u, PRETO)
    r(bx - u, ty + 2 * u, u, u, PRETO)
    r(bx - u, ty, u, 2 * u, BRANCO)
    r(bx - 2 * u, ty + u, u, u, BRANCO)
    -- texto: pensamento dela, centralizado no balão, em no máximo 2 linhas (escolhe uma fala que caiba;
    -- se nenhuma couber, fonte um pouco menor e, por último, "…")
    local pad = 4 * u
    local face, largura = fonte(5 * u), bw - 2 * pad
    local ok, texto, n = pcall(textoDoCartao, self.traca, function(t) return contarLinhas(t, face, largura) end)
    if not ok then
        logger.warn("Traça: falha ao escolher o texto do cartão:", texto)
        texto, n = "…", 1
    end
    if (n or 0) > MAX_LINHAS then
        local menor = fonte(4 * u)
        if contarLinhas(texto, menor, largura) <= MAX_LINHAS then face = menor end
    end
    local caixa = TextBoxWidget:new{
        text = texto,
        face = face,
        width = largura,
        height = bh - 2 * pad,
        height_overflow_show_ellipsis = true,
        alignment = "center",
    }
    local th = caixa:getSize().h
    caixa:paintTo(bb, bx + pad, by + math.max(pad, math.floor((bh - th) / 2)))
    caixa:free()
end

-- Proteção: se o cartão falhar ao desenhar, a Home continua (o cartão fica em branco).
require("traca_guarda").padrao:envolver(Cartao, { "paintTo" })

local function criarModulo(traca)
    local M = {}
    M.id = MODULO_ID
    M.name = T"Traça"
    M.label = nil
    M.enabled_key = "traca_cartao_enabled"
    M.default_on = true

    function M.build(w, _ctx)
        local ok, cartao = pcall(function()
            local c = Cartao:new{ traca = traca, largura = w }
            local ic = InputContainer:new{ dimen = Geom:new{ w = w, h = c.altura }, c }
            ic.ges_events = {
                TapTraca = { GestureRange:new{ ges = "tap", range = function() return c.dimen end } },
            }
            function ic:onTapTraca()
                traca:onMostrarTraca()
                return true
            end
            return ic
        end)
        if not ok then
            logger.warn("Traça: falha ao montar o cartão do Simple UI:", cartao)
            return nil
        end
        return cartao
    end

    function M.getHeight(_ctx)
        return math.max(2, math.floor(Screen:getHeight() * 0.16 / Desenho.ALTURA)) * Desenho.ALTURA
    end

    function M.getMenuItems(_ctx_menu)
        return nil
    end

    return M
end

-- Registro ------------------------------------------------------------------------

function Integracao.registrar(traca)
    local ok_reg, Registry = pcall(require, "modules/moduleregistry")
    if ok_reg and type(Registry) == "table" and Registry.register then
        local ok, err = pcall(Registry.register, criarModulo(traca))
        if not ok then logger.warn("Traça: falha ao registrar o cartão no Simple UI:", err) end
    end

    -- O botão usa um módulo maior do Simple UI; registra depois que tudo carregou.
    UIManager:nextTick(function()
        local ok_qa, QA = pcall(require, "features/sui_quickactions")
        if not (ok_qa and type(QA) == "table" and QA.register) then return end
        local ok, err = pcall(QA.register, {
            id = ACAO_ID,
            label = T"Traça",
            icon = traca.path .. "/icones/ovo.svg",
            get_icon = function() return Integracao.icone(traca) end,
            is_in_place = true,
            is_async_in_place = true,
            execute = function(_ctx) traca:onMostrarTraca() end,
        })
        if not ok then logger.warn("Traça: falha ao registrar o botão no Simple UI:", err) end
    end)
end

return Integracao
