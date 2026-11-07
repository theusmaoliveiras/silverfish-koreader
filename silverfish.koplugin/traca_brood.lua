--[[--
The brood: several creatures, one awake at a time.

The awake creature stays where the single creature always lived (settings/traca.lua, key "estado"), so an older
version of the plugin still opens the save and finds whoever was awake. The sleeping ones live under the key
"ninhada" in the same file:

  ninhada = { sleeping = { <species id> = <creature state>, ... } }

What belongs to each creature: its stage, belly and mood, traits, obsession, influences, diary, memories, lineage,
reviews and the pages it already digested. What belongs to the brood (the reader's reading memory): what each book
holds (characters, places, quotes, chapters), the bookshelf, the reading rhythm, streaks and records, and the book
that is open. That part travels with the awake creature: it is taken from the one going to sleep and handed to the
one waking up, so the save keeps a single copy of it.

A sleeping creature's time stands still: when it wakes up, its clocks move forward by the time it slept, so it
doesn't feel hungry, sad or older for it.

  Brood.speciesOf(s)                     -> species id of a creature ("traca" for old saves)
  Brood.normalize(ninhada, agora)        -> a valid brood table (sleeping creatures normalized)
  Brood.wake(s, ninhada, id, agora)      -> the creature now awake (s goes to sleep; a new egg if `id` has none)
]]

local Estado = require("traca_estado")
local Species = require("traca_species")

local Brood = {}

-- Reading memory: it belongs to the reader, so it moves to whoever is awake.
Brood.SHARED = {
    "livros", "ritmo", "hoje", "paginas_hoje", "recorde_dia", "recorde_em", "sequencia", "dias_lidos",
    "sessao_inicio", "sessao_paginas", "ultimo_livro", "livro_corrente", "ultimo_arquivo", "ultimo_capitulo",
    "ultimo_progresso", "boasvindas", "sim_terminados", "sim_sublinhados",
}

-- Inside each book, what is the creature's own: the characters it already wrote about in its diary, and its
-- traits when it started (re)reading the book.
Brood.OWN_IN_BOOK = { "anunciados", "tracos_inicio" }

-- Clocks that stand still while a creature sleeps.
Brood.CLOCKS = { "nascimento", "atualizado", "vazio_desde", "ultima_refeicao", "carinho_em" }

function Brood.speciesOf(s)
    return type(s) == "table" and type(s.especie) == "string" and s.especie or "traca"
end

function Brood.normalize(ninhada, agora)
    if type(ninhada) ~= "table" then ninhada = {} end
    if type(ninhada.sleeping) ~= "table" then ninhada.sleeping = {} end
    for id, s in pairs(ninhada.sleeping) do
        if type(id) ~= "string" or type(s) ~= "table" then
            ninhada.sleeping[id] = nil
        else
            ninhada.sleeping[id] = Estado.normalizar(s, agora)
        end
    end
    return ninhada
end

-- Takes the reading memory out of a creature going to sleep; its own bits of each book stay with it.
local function takeShared(s)
    local shared = {}
    for _, k in ipairs(Brood.SHARED) do shared[k] = s[k]; s[k] = nil end
    local own = {}
    for livro, L in pairs(shared.livros or {}) do
        if type(L) == "table" then
            for _, k in ipairs(Brood.OWN_IN_BOOK) do
                if L[k] ~= nil then
                    own[livro] = own[livro] or {}
                    own[livro][k] = L[k]
                    L[k] = nil
                end
            end
        end
    end
    s.livros_proprios = next(own) and own or nil
    return shared
end

-- Hands the reading memory to the creature waking up, with its own bits of each book back in place.
local function giveShared(s, shared)
    for _, k in ipairs(Brood.SHARED) do s[k] = shared[k] end
    for livro, bits in pairs(s.livros_proprios or {}) do
        local L = s.livros and s.livros[livro]
        if type(L) == "table" then
            for k, v in pairs(bits) do L[k] = v end
        end
    end
    s.livros_proprios = nil
end

function Brood.wake(s, ninhada, id, agora)
    local atual = Brood.speciesOf(s)
    if id == atual then return s end
    -- the one going to sleep: its time runs up to now, then stops
    Estado.passarTempo(s, agora)
    local shared = takeShared(s)
    s.dormiu_em = agora
    ninhada.sleeping[atual] = s
    -- the one waking up (or a new egg)
    local novo = ninhada.sleeping[id]
    ninhada.sleeping[id] = nil
    local nasceu = not novo
    if not novo then
        novo = Estado.novo(agora)
    elseif type(novo.dormiu_em) == "number" then
        local dormiu = math.max(0, agora - novo.dormiu_em)
        for _, k in ipairs(Brood.CLOCKS) do
            if type(novo[k]) == "number" and novo[k] > 0 then novo[k] = novo[k] + dormiu end
        end
    end
    novo.dormiu_em = nil
    novo.especie = id ~= "traca" and id or nil
    giveShared(novo, shared)
    -- a new egg: its own list of books starts empty (the shelf is the brood's), and its days count from now
    if nasceu then novo.meus_livros, novo.dias_ao_nascer = {}, novo.dias_lidos or 0 end
    Species.use(id)
    return novo
end

return Brood
