#!/usr/bin/env luajit
--[[
Calibrations françaises sur un corpus de textes bruts (corpus_fr.py) : affiche les lignes `fr` à poser dans
traca_pesos_temas, traca_base_temas, traca_base_tracos, traca_base_livros (clima) et traca_clima_calibracao.
Usage, depuis silverfish.koplugin/ : luajit ../ferramentas/fr/calibrer.lua <dossier_corpus> [pages_par_livre]
Pages de ~1 800 caractères (comme simuler.lua), seules les pages détectées « fr » comptent.
- clima : mediana = médiane de la note ; meia_faixa = (P70 − P30)/2 (les 30 % extrêmes passent ±1).
- poids des thèmes : w = (G / fréquence)^0,5 avec G = 1,15 × fréquence moyenne des thèmes (rapport observé
  sur les tables EN et PT, dont le script d'origine n'est pas publié) ; base_temas = fréquence × w.
]]
package.path = "./?.lua;" .. package.path
local dossier, max_pages = arg[1], tonumber(arg[2] or "400")
local M = require("traca_memoria")
local Tracos = require("traca_tracos")

local livres = {}
for f in io.popen('ls "' .. dossier .. '"/*.txt'):lines() do livres[#livres + 1] = f end
local notas, pages_sn, par_livre = {}, {}, {}
local brut, npages = {}, 0
for _, f in ipairs(livres) do
    local texto = io.open(f):read("*a"):gsub("\r", "")
    local i, n, sns = math.floor(#texto * 0.03), 0, {}
    while n < max_pages and i < #texto do
        local fin = texto:find("\n", i + 1800) or #texto
        local sn = M.sinais(texto:sub(i, fin), f)
        if sn.lingua == "fr" and sn.sentimento then
            notas[#notas + 1] = sn.sentimento
            sns[#sns + 1] = sn
            npages = npages + 1
            for t, c in pairs(sn.temas) do brut[t] = (brut[t] or 0) + c end
        end
        n, i = n + 1, fin + 1
    end
    par_livre[#par_livre + 1] = sns
end
table.sort(notas)
local function q(p) return notas[math.max(1, math.floor(p * #notas + 0.5))] end
local mediana, meia = q(0.5), (q(0.7) - q(0.3)) / 2
print(("-- %d livres, %d pages fr"):format(#livres, npages))
print(("clima_calibracao: fr = { mediana = %.3f, meia_faixa = %.3f, azedou = -1.548, adocou = 1.025 },  -- %d páginas")
    :format(mediana, meia, npages))

-- clima moyen par page de chaque livre
local medias, s, s2 = {}, 0, 0
for _, sns in ipairs(par_livre) do
    if #sns >= 20 then
        local soma = 0
        for _, sn in ipairs(sns) do sn.clima = (sn.sentimento - mediana) / meia; soma = soma + sn.clima end
        medias[#medias + 1] = soma / #sns
        s, s2 = s + medias[#medias], s2 + medias[#medias] ^ 2
    end
end
local nl = #medias
local media = s / nl
print(("base_livros: clima.fr = { media = %.3f, desvio = %.3f, n = %d }"):format(media, math.sqrt(s2 / nl - media ^ 2), nl))

-- poids et base des thèmes
local temas, smoy, nt = {}, 0, 0
for t, c in pairs(brut) do temas[#temas + 1] = t; smoy, nt = smoy + c / npages, nt + 1 end
table.sort(temas)
local G = 1.15 * smoy / nt
local P, B = {}, {}
for _, t in ipairs(temas) do
    local f = brut[t] / npages
    local w = math.sqrt(G / f)
    P[#P + 1] = ("%s = %.2f"):format(t, w)
    B[#B + 1] = ("%s = %.3f"):format(t, f * w)
end
print("pesos_temas: fr = { " .. table.concat(P, ", ") .. " },")
print("base_temas: fr = { " .. table.concat(B, ", ") .. " },")

-- empurrão moyen des traits (clima déjà calibré)
local soma = {}
local n = 0
for _, sns in ipairs(par_livre) do
    for _, sn in ipairs(sns) do
        if not sn.clima or #sns < 20 then sn.clima = (sn.sentimento - mediana) / meia end
        local e = Tracos.empurrao(sn, nil, true)
        n = n + 1
        for _, id in ipairs(Tracos.CENTRADOS) do soma[id] = (soma[id] or 0) + e[id] end
    end
end
local T = {}
for _, id in ipairs(Tracos.CENTRADOS) do T[#T + 1] = ("%s = %.3f"):format(id, soma[id] / n) end
print("base_tracos: fr = { " .. table.concat(T, ", ") .. " },")
