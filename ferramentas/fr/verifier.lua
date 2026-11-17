#!/usr/bin/env luajit
--[[
Vérifie un fichier de traduction française contre sa source (même structure).
Usage, depuis silverfish.koplugin/ :
  luajit ../ferramentas/fr/verifier.lua traca_banco.diario_fr traca_banco.diario_pt
  luajit ../ferramentas/fr/verifier.lua traca_fr traca_en        (structure de référence = EN)
  luajit ../ferramentas/fr/verifier.lua --ui                     (clés T"…" du code présentes dans traca_fr.ui)
Erreurs (code de sortie 1) : syntaxe, clé ou liste manquante, gabarit {…} / %s / <polo:…> inconnu,
espace ordinaire avant ! ? ; : (le moteur la supprime : mettre U+00A0), U+202F (absent de la police).
]]
package.path = "./?.lua;" .. package.path

local erreurs, avertis = 0, 0
local function err(...) erreurs = erreurs + 1; if erreurs <= 60 then print("ERREUR", ...) end end
local function warn(...) avertis = avertis + 1; if avertis <= 30 then print("avert.", ...) end end

local GLOBAL = {}  -- gabarits connus du fichier source (et de la référence), pour les listes adaptées
local function recolter(t, vus)
    vus = vus or {}
    if type(t) == "string" then for x in t:gmatch("{([%w_]+)[|}]") do GLOBAL["{" .. x .. "}"] = true end return end
    if type(t) ~= "table" or vus[t] then return end
    vus[t] = true
    for _, v in pairs(t) do recolter(v, vus) end
end

local POLOS = { amarga = 1, otimista = 1, medrosa = 1, corajosa = 1, cinica = 1, romantica = 1, popular = 1,
    erudita = 1, diurna = 1, noturna = 1, dominio = 1 }

-- gabarits d'une chaîne : {x}, {x|…} → "{x}", %s/%d → "%s"
local function gabarits(s)
    local g = {}
    for x in s:gmatch("{([%w_]+)[|}]") do g["{" .. x .. "}"] = (g["{" .. x .. "}"] or 0) + 1 end
    for x in s:gsub("%%%%", ""):gmatch("%%[%-%d%.]*([sdfiq])") do g["%" .. x] = (g["%" .. x] or 0) + 1 end
    return g
end

local function controleTexte(s, ou)
    if s:find("\226\128\175") then err(ou, "U+202F (absent de la police) : utiliser U+00A0") end
    -- espace ordinaire avant ! ? ; : (sauf "http:" et heures "2:13" qui n'ont pas d'espace)
    if s:find(" [!%?;:]") then err(ou, "espace ordinaire avant ! ? ; : → U+00A0", (s:match(".?.?.?.?.?.?.?.?.? [!%?;:]"))) end
    -- marques de voix équilibrées et pôles connus
    local prof = 0
    for c in s:gmatch("[<>]") do prof = prof + (c == "<" and 1 or -1); if prof < 0 then break end end
    if prof ~= 0 and s:find(">") then err(ou, "marque <…> non équilibrée") end  -- "< LIVROS" = flèche de retour
    for corps in s:gmatch("<([^<>]*)>") do
        for polo in corps:gmatch("([%a]+)[%.%d]*:") do
            if not POLOS[polo] then warn(ou, "pôle de voix inconnu: " .. polo) end
        end
    end
end

local function comparer(fr, src, chemin)
    if type(src) == "string" then
        if type(fr) ~= "string" then err(chemin, "attendu une chaîne, trouvé " .. type(fr)); return end
        controleTexte(fr, chemin)
        local gs, gf = gabarits(src), gabarits(fr)
        for k in pairs(gf) do if not gs[k] then err(chemin, "gabarit absent de la source: " .. k) end end
        for k in pairs(gs) do if not gf[k] then
            if k:sub(1, 1) == "%" then err(chemin, "format perdu: " .. k) else warn(chemin, "gabarit omis: " .. k) end
        end end
        if gs["%s"] and gf["%s"] ~= gs["%s"] then err(chemin, "nombre de %s différent") end
        if gs["%d"] and gf["%d"] ~= gs["%d"] then err(chemin, "nombre de %d différent") end
        return
    end
    if type(src) ~= "table" then
        if type(fr) ~= type(src) then err(chemin, "type " .. type(fr) .. " au lieu de " .. type(src)) end
        return
    end
    if type(fr) ~= "table" then err(chemin, "table manquante"); return end
    -- liste de tuples { "texte", curta = "…", fase = …, quando = … } : gabarits permis = union de la liste
    if type(src[1]) == "table" and type(src[1][1]) == "string" then
        local permis, attributs = {}, {}
        local function union(t)
            for k, v in pairs(t) do
                if type(v) == "string" then
                    if type(k) == "number" or k == "curta" then for g in pairs(gabarits(v)) do permis[g] = true end
                    else attributs[k .. "=" .. v] = true end
                elseif type(v) == "table" then
                    for _, x in ipairs(v) do if type(x) == "string" then attributs[k .. "=" .. x] = true end end
                end
            end
        end
        for _, t in ipairs(src) do union(t) end
        if #fr < #src * 0.8 then warn(chemin, ("liste courte: %d au lieu de %d"):format(#fr, #src)) end
        for i, t in ipairs(fr) do
            local c = chemin .. "[" .. i .. "]"
            if type(t) ~= "table" or type(t[1]) ~= "string" then err(c, "tuple mal formé")
            else
                for k, v in pairs(t) do
                    local vals = type(v) == "table" and v or { v }
                    for _, x in ipairs(vals) do
                        if type(x) ~= "string" then err(c, "valeur non texte en " .. tostring(k))
                        elseif type(k) == "number" or k == "curta" then
                            controleTexte(x, c)
                            for g in pairs(gabarits(x)) do
                                if not permis[g] and not GLOBAL[g] then err(c, "gabarit absent de la source: " .. g) end
                            end
                        elseif not attributs[k .. "=" .. x] then
                            err(c, "attribut inconnu de la source: " .. k .. "=" .. x)
                        end
                    end
                end
            end
        end
        return
    end
    local liste = src[1] ~= nil and type(src[1]) == "string"
    if liste then
        if #fr == 0 then err(chemin, "liste vide") end
        -- gabarits autorisés = union de la liste source (les listes EN sont adaptées, pas alignées)
        local permis = {}
        for _, s in ipairs(src) do for k in pairs(gabarits(s)) do permis[k] = true end end
        for i, s in ipairs(fr) do
            if type(s) ~= "string" then err(chemin .. "[" .. i .. "]", "pas une chaîne")
            else
                controleTexte(s, chemin .. "[" .. i .. "]")
                for k in pairs(gabarits(s)) do
                    if not permis[k] then err(chemin .. "[" .. i .. "]", "gabarit absent de la source: " .. k) end
                end
                local ref = src[i]
                if ref then
                    for k in pairs(gabarits(ref)) do
                        if k:sub(1, 1) == "%" and not gabarits(s)[k] then err(chemin .. "[" .. i .. "]", "format perdu: " .. k) end
                    end
                end
            end
        end
        if #fr < #src * 0.8 then warn(chemin, ("liste courte: %d au lieu de %d"):format(#fr, #src)) end
        return
    end
    for k, v in pairs(src) do
        local c = chemin .. "." .. tostring(k)
        if fr[k] == nil then err(c, "clé manquante") else comparer(fr[k], v, c) end
    end
    for k in pairs(fr) do if src[k] == nil then warn(chemin .. "." .. tostring(k), "clé en trop") end end
end

local function charger(nom)
    local ok, m = pcall(require, nom)
    if not ok then err(nom, "chargement impossible: " .. tostring(m)); return nil end
    return m
end

if arg[1] == "--ui" then
    -- toutes les clés T"…" / T("…") du code doivent exister dans traca_fr.ui
    local FR = charger("traca_fr")
    local EN = charger("traca_en")
    if not FR or not EN then os.exit(1) end
    for k, v in pairs(EN.ui) do
        if FR.ui[k] == nil then err("ui", "clé manquante: " .. k)
        else comparer(FR.ui[k], v, "ui[" .. k:sub(1, 40) .. "]") end
    end
    for k in pairs(FR.ui) do if EN.ui[k] == nil then warn("ui", "clé inconnue de EN: " .. k) end end
    local p = io.popen("grep -ho 'T\"[^\"]*\"' *.lua")
    for cle in p:read("*a"):gmatch('T"([^"]*)"') do
        if cle ~= "" and EN.ui[cle] == nil and FR.ui[cle] == nil then warn("code", "clé T sans traduction EN ni FR: " .. cle) end
    end
    p:close()
else
    -- usage : verifier.lua <fr> <source> [<référence>]
    local fr, src = charger(arg[1]), charger(arg[2])
    recolter(src)
    -- VERIF_CLES="base,eventos,influencias.epica" : ne comparer que ces sous-arbres (lots partiels)
    local cles = os.getenv("VERIF_CLES")
    if cles and src then
        local sous = {}
        for chemin in cles:gmatch("[^,]+") do
            local a, b, ok = src, sous, true
            local parts = {}
            for p in chemin:gmatch("[^%.]+") do parts[#parts + 1] = p end
            for i, p in ipairs(parts) do
                if type(a) ~= "table" or a[p] == nil then ok = false; break end
                if i == #parts then b[p] = a[p] else b[p] = b[p] or {}; a, b = a[p], b[p] end
            end
            if not ok then err(chemin, "clé inconnue de la source") end
        end
        src = sous
    end
    if arg[3] then recolter(charger(arg[3])) end
    if fr and src then comparer(fr, src, arg[1]) end
end
print(("%d erreur(s), %d avertissement(s)"):format(erreurs, avertis))
os.exit(erreurs > 0 and 1 or 0)
