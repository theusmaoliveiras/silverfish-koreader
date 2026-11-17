--[[--
Idioma da Traça: português, inglês (Silverfish) ou francês (la Mite).

Escolha: a opção "traca_lingua" ("auto", "pt", "en" ou "fr"). Em "auto", segue o idioma do
KOReader (pt* = português, fr* = francês, qualquer outro = inglês). Fora do KOReader (testes), português.

O idioma é decidido quando os módulos carregam: trocar pede reiniciar o KOReader.

Textos da interface: a frase em português é a chave (Lingua.t"BARRIGA"); a tradução fica
em traca_en.lua. Falas e comentários: cada módulo troca suas listas pelas de
Lingua.conteudo(nome).
]]

local Lingua = {}

local codigo, ui

-- módulo de textos da língua; francês sem o arquivo cai no inglês em vez de quebrar
local function textos(base, c)
    local ok, m = pcall(require, base:format(c))
    if ok then return m end
    return require(base:format("en"))
end

local function config()
    return rawget(_G, "G_reader_settings")
end

--- "auto", "pt" ou "en", como está salvo.
function Lingua.escolha()
    local g = config()
    return g and g:readSetting("traca_lingua") or "auto"
end

function Lingua.salvarEscolha(e)
    local g = config()
    if not g then return end
    if e == "auto" then g:delSetting("traca_lingua") else g:saveSetting("traca_lingua", e) end
end

--- "pt", "en" ou "fr".
function Lingua.codigo()
    if codigo then return codigo end
    local e, g = Lingua.escolha(), config()
    if e == "pt" or e == "en" or e == "fr" then
        codigo = e
    elseif g then
        local l = tostring(g:readSetting("language") or "en")
        codigo = l:match("^pt") and "pt" or l:match("^fr") and "fr" or "en"
    else
        codigo = "pt"
    end
    return codigo
end

function Lingua.ingles()
    return Lingua.codigo() == "en"
end

function Lingua.frances()
    return Lingua.codigo() == "fr"
end

--- Só para testes: força um idioma (os módulos precisam ser recarregados depois).
function Lingua.forcar(c)
    codigo, ui = c, nil
end

--- Texto da interface traduzido (ou o próprio texto, em português ou sem tradução).
function Lingua.t(s)
    local c = Lingua.codigo()
    if c == "pt" then return s end
    ui = ui or textos("traca_%s", c).ui
    if ui[s] or c == "en" then return ui[s] or s end
    return require("traca_en").ui[s] or s  -- fork FR : texte 2.0 pas encore traduit → anglais plutôt que portugais
end

--- Conteúdo traduzido de um módulo (listas de falas etc.), ou nil em português.
function Lingua.conteudo(nome)
    local c = Lingua.codigo()
    if c == "pt" then return nil end
    return textos((nome == "falas" or nome == "memoria") and "traca_%s_livros" or "traca_%s", c)[nome]
end

--- Soma listas de frases extras às de um módulo: onde `extra` tem uma lista, ela é anexada
-- à lista de mesmo nome em `base` (criando se faltar); onde tem uma tabela, desce nela.
function Lingua.anexar(base, extra)
    if type(base) ~= "table" or type(extra) ~= "table" then return end
    for k, v in pairs(extra) do
        if type(v) == "table" and v[1] ~= nil then
            base[k] = base[k] or {}
            for _, item in ipairs(v) do table.insert(base[k], item) end
        elseif type(v) == "table" then
            base[k] = base[k] or {}
            Lingua.anexar(base[k], v)
        end
    end
end

--- Frases extras (lotes novos) de um módulo, no idioma atual, ou nil.
function Lingua.extra(nome)
    local ok, banco = pcall(require, require("traca_species").bankModule("extra"))  -- the active species' batches
    return ok and banco[nome] or nil
end

return Lingua
