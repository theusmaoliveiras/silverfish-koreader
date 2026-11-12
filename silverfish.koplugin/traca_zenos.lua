--[[--
Integração com o ZenOS: o mesmo cartão da Traça do Simple UI, como um widget da
tela inicial do ZenOS. Usa a API pública do ZenOS para widgets de outros plugins
(__ZENOS_REGISTER_HOME_ITEM); se o ZenOS não estiver instalado, nada acontece.
O widget começa desligado: liga-se em ZenOS > Home > widgets.
]]

local Geom = require("ui/geometry")
local GestureRange = require("ui/gesturerange")
local InputContainer = require("ui/widget/container/inputcontainer")
local UIManager = require("ui/uimanager")
local logger = require("logger")

local T = require("traca_lingua").t

local Zen = {}

local WIDGET_ID = "traca_cartao"

-- A Traça mais recente (uma por tela: gerenciador de arquivos ou leitor). O widget é registrado
-- uma vez só e sempre desenha a atual.
local atual = nil
local registrado = false

local function construir(ctx)
    local traca = atual
    if not (traca and traca.estado) then return nil end
    local Cartao = require("traca_simpleui").Cartao
    local w = math.max(1, math.floor(tonumber(ctx and ctx.width) or 0))
    local h = math.max(1, math.floor(tonumber(ctx and ctx.height) or 0))
    local c = Cartao:new{ traca = traca, largura = w, altura_fixa = h }
    -- Como os widgets do próprio ZenOS: o gesto vale para a tela toda e o toque conta se cair dentro do
    -- container (o ZenOS monta as linhas fora da tela e as posiciona depois, então a posição do desenho
    -- não serve para isso).
    local Screen = require("device").screen
    local ic = InputContainer:new{
        dimen = Geom:new{ w = w, h = c.altura },
        ges_events = {
            TapTraca = { GestureRange:new{ ges = "tap", range = Geom:new{
                x = 0, y = 0, w = Screen:getWidth(), h = Screen:getHeight(),
            } } },
        },
        c,
    }
    function ic:onTapTraca(_arg, ges)
        if not (self.dimen and ges and ges.pos) then return false end
        -- no topo, o toque abre o menu do ZenOS. (O "modo de edição" do ZenOS fica ligado e só usa o
        -- toque longo para abrir as opções do widget; o toque simples continua sendo da Traça.)
        if ctx and ctx.openTopMenu and ctx.openTopMenu(ges) then return true end
        if not self.dimen:contains(ges.pos) then return false end
        traca:onMostrarTraca()
        return true
    end
    return ic
end

local function tentarRegistrar()
    if registrado then return true end
    local registrar = rawget(_G, "__ZENOS_REGISTER_HOME_ITEM") or rawget(_G, "__ZEN_UI_REGISTER_HOME_ITEM")
    if type(registrar) ~= "function" then return false end
    local ok, res = pcall(registrar, WIDGET_ID, construir, { label = T"Traça", size = "s" })
    if not ok then
        logger.warn("Traça: falha ao registrar o widget no ZenOS:", res)
        return true  -- não insiste
    end
    registrado = res == true
    return true
end

function Zen.registrar(traca)
    atual = traca
    if not tentarRegistrar() then
        -- o ZenOS pode carregar depois: tenta de novo quando tudo estiver pronto
        UIManager:nextTick(tentarRegistrar)
    end
end

--- A Traça desta tela foi fechada: o widget continua registrado, mas não desenha uma Traça velha.
function Zen.soltar(traca)
    if atual == traca then atual = nil end
end

return Zen
