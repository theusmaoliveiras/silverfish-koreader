--[[--
The creature's name, given by the reader (06/11/2026; the community asked for it). It is the big title of its
screen; with no name, the species' name stays there. Each creature keeps its own (`s.nome`); a new generation
starts with none and is asked again when it hatches.

  Nome.MAX                    -> 14 characters: any 14 fit the title before the menu button
  Nome.limpar(texto)          -> the name, tidied (nil and "" mean no name), or nil and the reason it can't be
  Nome.sortear(atual, sorteio)-> a random pet name (traca_banco/nomes_<language>.lua, one list for every species),
                                 not `atual`
  Nome.devePerguntar(s)       -> true once, after it hatches, until the reader names it or says "not now"
]]

local Nome = {}

Nome.MAX = 14

-- One character of the text: an ASCII byte or a whole UTF-8 sequence.
local CARACTERE = "[%z\1-\127\194-\244][\128-\191]*"

-- What the pixel font (Silkscreen) draws: ASCII letters and digits, space, hyphen, apostrophe and period, and the
-- accented Latin letters (À to ÿ, without × and ÷). Anything else would show as a box.
local function permitido(c)
    if #c == 1 then return c:match("[%w %-'%.]") ~= nil end
    if #c == 2 and c:byte(1) == 195 then
        local b = c:byte(2)
        return b >= 128 and b ~= 151 and b ~= 183
    end
    return false
end

--- Tidies what the reader typed: spaces at the ends go, runs of spaces become one. Gives the name, or "" for
-- none, or nil and why it can't be used ("longo": over MAX characters; "caractere": one the font can't draw).
function Nome.limpar(texto)
    texto = tostring(texto or ""):gsub("^%s+", ""):gsub("%s+$", ""):gsub("%s+", " ")
    local n = 0
    for c in texto:gmatch(CARACTERE) do
        n = n + 1
        if not permitido(c) then return nil, "caractere" end
    end
    if n > Nome.MAX then return nil, "longo" end
    return texto
end

local listas = {}  -- per language: generic pet names, the same for every species
local function lista()
    local mod = "traca_banco.nomes_" .. require("traca_lingua").codigo()
    if listas[mod] == nil then
        local ok, b = pcall(require, mod)
        listas[mod] = ok and type(b) == "table" and #b > 0 and b or false
    end
    return listas[mod] or nil
end

--- Whether there are names to draw from (the dialog shows the "Random" button only then).
function Nome.temSorteio()
    return lista() ~= nil
end

--- A random name from the list, different from `atual` when the list has more than one.
function Nome.sortear(atual, sorteio)
    local l = lista()
    if not l then return nil end
    sorteio = sorteio or math.random
    local nome
    for _ = 1, 8 do
        nome = l[sorteio(#l)]
        if nome ~= atual then break end
    end
    return nome
end

--- Ask for a name now? Once it has hatched (or its stage is forced past the egg in dev mode), until it has a
-- name or the reader said "not now".
function Nome.devePerguntar(s)
    if type(s) ~= "table" or s.nome or s.nome_perguntado or s.dev_simulacao then return false end
    local ok, Estado = pcall(require, "traca_estado")
    return ok and Estado.fase(s).nome ~= "ovo"
end

return Nome
