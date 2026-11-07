--[[--
Species of the brood: what belongs to each creature rather than to the engine.

The engine (pages, traits, influences, obsession, phases, diary) is shared by every creature. A species brings its
own drawings and phrase banks. The silverfish is the first species and the default: while no other species is
chosen, the plugin behaves exactly as before.

  Species.current()         -> the active species (a table shaped like SILVERFISH below)
  Species.use(id)           -> makes `id` the active species; an unknown id falls back to the silverfish
  Species.bankModule(name)  -> the module name of a phrase bank of the active species ("traca_banco.diario_en")
  Species.texto(key)        -> a screen text of the active species, translated (its name, the bar, notices…)
  Species.sprites(cor)      -> the drawings of the active species, awake and asleep, in one table; with `cor`, the
                               colour drawings over the black and white ones (a drawing with no colour version
                               stays black and white). `_cores` in the table is the colour of each character.

What still belongs to the silverfish outside this file is listed in brood/SPECIES-MAP.md.
]]

local Lingua = require("traca_lingua")
local T = Lingua.t

local Species = {}

local SILVERFISH = {
    id = "traca",
    banks = "traca_banco",  -- phrase banks live at <banks>.<name>_<language>
    sprites = { "traca_sprites_livro", "traca_sprites_repouso" },  -- merged in this order
    sprites_cor = { "traca_sprites_cor" },  -- for screens that show colour (Desenho.usarCor)
    -- stages: Estado.FASES; lines: the lists inside the code (SPECIES-MAP.md); panel labels: in traca_estado.lua
    -- Screen texts, in Portuguese (traca_en.lua has the English, keyed by these).
    textos = {
        titulo = "TRAÇA",                        -- the big title on its screen, and the first item of the menu (☰)
        barra = "BARRIGA",                       -- the bar under the drawing
        paginas = "%s PÁG. COMIDAS",             -- the total under the stage
        virou = "A Traça virou %s!",             -- a new stage with no notice of its own
        saiu = "A Traça saiu da lombada. Com fome, claro.",  -- out of hiding
        fim = "A Traça da geração %d leu tudo o que podia e deixou um ovo.\n\n“%s”\n\nVeja a LINHAGEM no menu.",
        linhagem = "AS TRAÇAS QUE VIERAM ANTES", -- the lineage item's subtitle in the menu (☰)
        diario = "MEMÓRIAS DELA",                -- the diary item's subtitle in the menu (☰)
        obsessao = "OBCECADA %s",                -- the obsession, in the lineage and the summary (%s: "pela família")
        alvo_final = "O OVO",                    -- the last stage's target on the stage card ("164 PÁGS. PARA O OVO")
        paginas_total = "PÁGINAS COMIDAS",       -- the total on the achievements screen
        agora = "COMENDO AGORA",                 -- the brood screen: the book it's on
        ovo_nome = "OVO DE TRAÇA",               -- the brood screen: its egg, before it ever hatched
        viva = "GERAÇÃO %d · VIVA",              -- the lineage: the card of the generation that's alive
        primeira = "Sou a primeira. Ainda. Um dia eu deixo um ovo e vocês me esquecem.",  -- the lineage, empty
        -- ovo_fala: a line from inside its egg in the hatch box; none (it hatches in the welcome)
    },
    -- its last words are ULTIMAS in traca_estado.lua; its achievements, Estado.marcos
    -- Batch 4 (traca/cartoes/rascunhos/cat/choices-4.md): what it says when it goes to sleep in the brood, one
    -- drawn each time, in the wake/hatch box.
    despedidas = {
        "Uma soneca entre duas páginas. A minha preferida.",
        "Quem acordar: as margens são minhas.",
        "Sem fome enquanto eu durmo. Só sonho com papel.",
    },
}

-- Ash Cat (traca/cartoes/VOICE-CAT.md): the egg and three stages, one temperament each. Its lines are the bank
-- gato_banco/falas_<language>.lua, by temperament; while it is awake, traca_estado.lua speaks only from there.
local CAT = {
    id = "gato",
    banks = "gato_banco",
    sprites = { "gato_sprites" },
    sprites_cor = { "gato_sprites_cor" },
    fases = {
        { nome = "ovo",     titulo = T"ovo",     min = 0,       temperamento = "ovo" },
        { nome = "filhote", titulo = T"filhote", min = 3000,    temperamento = "filhote",  -- ~2 pages
          aviso = T"O ovo rachou! Saiu um filhote, e a primeira coisa que fez foi conferir as saídas." },
        { nome = "adulto",  titulo = T"adulto",  min = 600000,  temperamento = "adulto",
          aviso = T"O filhote cresceu. Agora pergunta menos e confere mais a porta." },
        { nome = "velho",   titulo = T"velho",   min = 1500000, temperamento = "velho",  -- until Estado.FIM_CICLO
          aviso = T"Chegou a vez do gato de ensinar as Regras, não só de seguir." },
    },
    -- Batch 2 (traca/cartoes/rascunhos/cat/choices-2.md). It keeps pages instead of eating them: the bar is its stash.
    textos = {
        titulo = "GATO-DAS-CINZAS",
        barra = "ESTOQUE",
        paginas = "%s PÁG. ARQUIVADAS",
        saiu = "Saiu do esconderijo. Conferiu as saídas duas vezes antes de dar oi.",
        fim = "O gato da geração %d desceu ao porão uma última vez, para deixar as páginas onde as próximas "
            .. "gerações vão procurar.\n\n“%s”\n\nVeja a LINHAGEM no menu.",
        linhagem = "OS GATOS QUE VIERAM ANTES",
        -- batch 3 (choices-3.md)
        diario = "NOTAS DO PORÃO",
        obsessao = "OBSESSÃO %s",
        alvo_final = "PASSAR ADIANTE",
        paginas_total = "PÁGINAS ARQUIVADAS",
        agora = "GUARDANDO AGORA",
        ovo_nome = "OVO DE GATO",
        -- batch 4 (choices-4.md)
        viva = "GERAÇÃO %d · EM VIDA",
        primeira = "Árvore vazia. Ótimo. Menos nomes pra acharem.",
        ovo_fala = "(de dentro do ovo:) Psst. Tá seguro aí fora?",
    },
    -- What it says when it goes to sleep in the brood (batch 4), one drawn each time.
    despedidas = {
        "Durmo com um olho aberto. O bom.",
        "Você guarda o resto do livro, cúmplice. Como sempre.",
        "Regra 14: se alguém me viu entrar, não fui eu que saí.",
    },
    -- Its last words (batch 3), one drawn when its life ends: the end-of-life notice and the lineage quote it.
    ultimas = {
        "Regra 13: ensina uma frase a um filhote. Eu ensinei.",
        "Fecha a porta devagar. Eles ainda escutam.",
        "O lenço é seu agora. Não deixa ninguém tocar.",
        "Quem destrói um bom livro mata a própria razão. Milton sabia.",
    },
    -- Its achievements, over the silverfish's (Estado.marcos), by the silverfish's title: { title, line } ("nil"
    -- keeps that one), `fase` = which of its stages it is, false = it has none. The others stay as they are.
    marcos = {
        ["PRIMEIRA MORDIDA"] = { "DAS CINZAS", "TIROU A 1ª PÁGINA DAS CINZAS" },
        ["CEM PÁGINAS"] = { nil, "100 PÁGINAS ARQUIVADAS" },
        ["MIL PÁGINAS"] = { nil, "1.000 PÁGINAS ARQUIVADAS" },
        ["CINCO MIL"] = { nil, "5.000 PÁGINAS ARQUIVADAS" },
        ["DEZ MIL"] = { nil, "10.000 PÁGINAS ARQUIVADAS" },
        ["NASCEU"] = { fase = "filhote" },
        ["PRIMEIRA MUDA"] = false,  -- no stage between kitten and adult
        ["ADULTA"] = { "EM CAMPO", "SABE AS REGRAS DE COR", fase = "adulto" },
        ["ANCIÃ"] = { "VELHO", "ENSINA AS REGRAS", fase = "velho" },
        ["BIBLIÓFAGA"] = { "ARQUIVO VIVO" },
        ["DIVIDIDA"] = { "JOGO DUPLO" },
        ["COLECIONADORA"] = { "NOTAS NA MARGEM" },
    },
    -- The panel's labels, with the same thresholds as the silverfish's (traca_estado.lua): from this much up.
    rotulos = {
        barriga = { { 75, "TUDO A SALVO" }, { 50, "O SUFICIENTE" }, { 25, "RESTAM POUCAS" }, { 0.5, "NADA DE NOVO" },
                    { -1, "NADA A GUARDAR" } },
        humor = {
            ovo     = { { -1, "NAS CINZAS" } },
            filhote = { { 75, "COM ORGULHO" }, { 50, "DE VIGIA" }, { 25, "OUVINDO COISAS" }, { -1, "COM MEDO" } },
            adulto  = { { 75, "TUDO LIMPO" }, { 50, "EM SERVIÇO" }, { 25, "DESCONFIANDO" }, { -1, "ROSNANDO" } },
            velho   = { { 75, "EM PAZ" }, { 50, "DE VIGÍLIA" }, { 25, "OSSOS VELHOS" }, { -1, "INSUPORTÁVEL" } },
        },
    },
}

Species.LIST = { traca = SILVERFISH, gato = CAT }

local current = SILVERFISH

function Species.current()
    return current
end

function Species.use(id)
    current = Species.LIST[id] or SILVERFISH
    return current
end

--- Runs fn(...) as if `id` were the active species (to draw or describe a sleeping creature on the brood
-- screen), then puts the active species back.
function Species.com(id, fn, ...)
    local antes = current
    current = Species.LIST[id] or SILVERFISH
    local r = { pcall(fn, ...) }
    current = antes
    if not r[1] then error(r[2], 0) end
    return unpack(r, 2)
end

--- A screen text of the active species (`textos` above), translated; the silverfish's when it has none.
function Species.texto(key)
    local t = current.textos and current.textos[key] or SILVERFISH.textos[key]
    return t and T(t)
end

--- One of the active species' farewells (going to sleep in the brood), translated; nil if it has none.
-- sorteio(n): 1..n (math.random by default).
function Species.despedida(sorteio)
    local lista = current.despedidas
    if not lista or #lista == 0 then return nil end
    return T(lista[(sorteio or math.random)(#lista)])
end

--- Module name of the bank `name` of the active species, in the current language (or in `language`).
function Species.bankModule(name, language)
    return current.banks .. "." .. name .. "_" .. (language or Lingua.codigo())
end

local sprite_sets = {}  -- per species and mode: "<species>" and "<species>:cor"
function Species.sprites(cor)
    local key = current.id .. (cor and ":cor" or "")
    local set = sprite_sets[key]
    if not set then
        set = { _cores = {} }
        local modules = {}
        for _, module in ipairs(current.sprites) do modules[#modules + 1] = module end
        if cor then
            for _, module in ipairs(current.sprites_cor or {}) do modules[#modules + 1] = module end
        end
        for _, module in ipairs(modules) do
            for name, rows in pairs(require(module)) do
                if name == "_cores" then
                    for ch, v in pairs(rows) do set._cores[ch] = v end
                else
                    set[name] = rows
                end
            end
        end
        sprite_sets[key] = set
    end
    return set
end

return Species
