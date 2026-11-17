#!/usr/bin/env luajit
--[[
Fait lire un livre (texte brut) à la Mite hors KOReader et affiche ce qu'elle en pense.
Usage, depuis silverfish.koplugin/ :
  luajit ../ferramentas/fr/simuler.lua <livre.txt> "<Titre>" "<Auteur>" [pages] [langue]
Pages de ~1 800 caractères, une minute de lecture chacune, un « chapitre » toutes les 25 pages.
]]
package.path = "./?.lua;" .. package.path
local fichier, titre, auteur = arg[1], arg[2] or "Livre", arg[3] or "Auteur"
local max_pages, langue = tonumber(arg[4] or "300"), arg[5] or "fr"

local Lingua = require("traca_lingua")
Lingua.forcar(langue)
local Estado = require("traca_estado")
local Memoria = require("traca_memoria")

math.randomseed(42)
local texto = io.open(fichier):read("*a"):gsub("\r", "")
-- saute le début (pages de garde) et découpe en pages sur des fins de paragraphe
local debut = math.floor(#texto * 0.03)
local pages, i = {}, debut
while #pages < max_pages and i < #texto do
    local fin = texto:find("\n", i + 1800) or #texto
    pages[#pages + 1] = texto:sub(i, fin)
    i = fin + 1
end

local agora = os.time{ year = 2026, month = 11, day = 1, hour = 21 }
local s = Estado.normalizar(nil, agora)
local erreurs = 0
for n, p in ipairs(pages) do
    local onde = { livro = titre, autor = auteur, capitulo = "Chapitre " .. (math.floor((n - 1) / 25) + 1),
                   progresso = n / #pages }
    local ok1, ev = pcall(Estado.comer, s, Estado.contarLetras(p), Estado.palavraMaisLonga(p), agora, onde)
    local ok2, e2 = pcall(Memoria.digerir, s, p, onde, agora, true)
    if not ok1 or not ok2 then
        erreurs = erreurs + 1
        if erreurs <= 3 then print("ERREUR page " .. n, not ok1 and ev or e2) end
    end
    if ok1 and type(ev) == "table" and ev.evoluiu then
        print(("[page %d] %s"):format(n, ev.evoluiu.aviso or ev.evoluiu.titulo or "évolution"))
    end
    agora = agora + 60
    if n % 40 == 0 then agora = agora + 20 * 3600 end  -- une séance de 40 pages par jour
end

local L = s.livros and s.livros[titre] or {}
print(("\n== %s — %d pages, %d erreurs, langue des pages : pt=%d fr=%d total=%d"):format(titre, #pages, erreurs,
    L.paginas_pt or 0, L.paginas_fr or 0, L.paginas or 0))
print("phase :", Estado.fase(s).titulo)
local function liste(t, n)
    local out = {}
    for k = 1, math.min(n, #(t or {})) do
        local x = t[k]
        out[#out + 1] = type(x) == "table" and tostring(x.nome or x[1] or x.palavra or "?") or tostring(x)
    end
    return table.concat(out, ", ")
end
local ok, pers = pcall(Memoria.personagens, s, titre, 8)
print("personnages :", ok and liste(pers, 8) or pers)
ok, pers = pcall(Memoria.marcantes, s, titre, 10)
print("mots marquants :", ok and liste(pers, 10) or pers)
local temas = {}
for t, c in pairs(L.temas or {}) do temas[#temas + 1] = { t, c } end
table.sort(temas, function(a, b) return a[2] > b[2] end)
local tt = {}
for k = 1, math.min(6, #temas) do tt[k] = ("%s %.0f"):format(Memoria.tema(temas[k][1]), temas[k][2]) end
print("thèmes :", table.concat(tt, ", "))
local okp, perc = pcall(Memoria.percepcao, s, titre)
print("lieux :", okp and perc and liste(perc.lugares, 8) or tostring(perc))
print("\n-- ce qu'elle dit --")
for k = 1, 12 do
    local okf, f = pcall(Estado.fala, s, agora + k * 600)
    print(okf and ("· " .. tostring(f)) or ("ERREUR fala: " .. tostring(f)))
end
print("\n-- journal (5 dernières) --")
local d = s.diario or {}
for k = math.max(1, #d - 4), #d do
    local e = d[k]
    print("· " .. tostring(type(e) == "table" and (e.texto or e[2] or e[1]) or e))
end
