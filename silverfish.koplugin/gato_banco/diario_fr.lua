--[[--
Banque du journal du Chat des Cendres, NOTES DE LA CAVE (français), traduite de gato_banco/diario_pt.lua
(lots 5b-1, 5b-2 et 5b-3). Même format que traca_banco/diario_fr.lua ; par phase : filhote, adulto, velho.
{tema} porte son article (« la mer »), {de_tema} sa préposition (« de la mer »).
]]

local B = { dia = {}, inicio = {}, fim = {}, obsessao = {}, lembranca = {} }

-- Le jour de lecture (5b-1)
B.dia.magro = { "{n} pages de « {livro} ». Un petit morceau. Ça reste un morceau.", "{n} pages de « {livro} », rangées dans le foulard." }
B.dia.normal = { "{n} pages de « {livro} » archivées.", "« {livro} » a lâché {n} pages aujourd'hui.", "Aujourd'hui : « {livro} », {n} pages, pas de fumée." }
B.dia.banquete = { "{n} pages de « {livro} ». Il va me falloir un autre mur.", "J'ai descendu {n} pages de « {livro} » à la cave." }
B.dia.enorme = { "{n} pages. Tu n'as pas lu « {livro} », tu l'as passé en contrebande.", "{n} pages de « {livro} ». Personne ne garde autant. Nous, si." }
B.dia.dois_livros = { "{n} pages, partagées entre « {livro} » et « {livro2} ». Deux planques.", "{n} pages. « {livro} » a eu la plupart. « {livro2} », le reste." }
B.dia.horario = { madrugada = { "Presque tout après minuit. Moins d'yeux." }, manha = { "Tout avant le déjeuner. Rien à cacher." }, noite = { "Lumière basse, pages qui tournent." } }
B.dia.fala = { filhote = { "{nome} a dit « {fala} ». Je l'ai appris par cœur." }, adulto = { "{nome} a dit « {fala} ». Archivé comme pièce à conviction." }, velho = { "« {fala} », a dit {nome}. Je l'apprendrai à un chaton." } }
B.dia.novo = { "Rencontré {nome}. Je repère les sorties.", "{nome} débarque. Des ennuis, sûrement." }
B.dia.novos2 = { "{nome} et {nome2} débarquent. Quelqu'un, là-dedans, cache quelque chose." }
B.dia.evento = {
    morte = { "Quelqu'un est mort. J'ai gardé la dernière page." },
    casamento = { "Un mariage. Promesses archivées, à vérifier plus tard." },
    viagem = { "Des allées et venues toute la journée. Trop de sorties." },
    carta = { "Quelqu'un a écrit ce qu'il ne fallait pas. Je l'ai gardé." },
    tempestade = { "Tempête toute la journée. Bonne couverture." },
    doenca = { "Quelqu'un est resté au lit toute la journée. J'ai monté la garde." },
    festa = { "Un bal. Tout le monde regardait, personne ne surveillait." },
    briga = { "Une dispute. Les murs ont des oreilles ; aujourd'hui, ils ont été servis." },
    fuga = { "Quelqu'un s'est enfui. Belle sortie." },
    crime = { "Du sang et des questions. J'aime les questions." },
}
B.dia.tema = { "Dossier du jour : {tema}.", "Encore {tema}. Quelqu'un s'obstine à mettre ça là." }
B.dia.pesado = { "Des pages qui laissent de la suie." }
B.dia.leve = { "Une journée de papier tout doux. Je me méfie." }
B.dia.fecho = { filhote = { "Je le raconterai à Grand-mère en rêve.", "" }, adulto = { "Porte fermée.", "" }, velho = { "Encore une nuit de gardée.", "" } }
B.dia.fecho_escuro = { filhote = { "J'ai dormi une oreille dressée.", "" }, adulto = { "J'ai dormi sur le livre. Au cas où.", "" }, velho = { "Il y a des pages que je préférerais ne pas garder. Je les garde quand même.", "" } }
B.dia.fecho_leve = { filhote = { "J'ai ronronné en dormant. Ça ne compte pas.", "" }, adulto = { "Nuit tranquille. Je n'ai pas confiance.", "" }, velho = { "C'est pour des nuits comme ça qu'on a gardé les livres.", "" } }

-- Début et fin de livre, l'obsession (5b-2)
B.inicio.generico = { "« {livro} » est arrivé. Personne ne l'a suivi. Parfait.", "« {livro} ». J'ai d'abord reniflé le dos. Vieille manie.", "On commence « {livro} ». Je prends les notes de bas de page." }
B.inicio.autor = { "{autor}, enchanté. Je vais te garder à l'œil." }
B.inicio.mesmo_autor = { "Retour chez {autor}. Même écriture, nouvelles pages." }
B.inicio.largou = { "On a laissé « {anterior} » en plan. Règle 1, complice. Règle 1." }
B.inicio.relendo = { "On relit « {livro} ». Bien. Une page gardée deux fois est plus en sûreté." }
B.fim.abertura = { "Dernière page de « {livro} ». Gardée.", "« {livro} » est passé. En entier." }
B.fim.nome = { "Classé sous : {nome}." }
B.fim.protagonista = { filhote = { "Quand je serai grand, je veux être comme {nome}. Peut-être." }, adulto = { "{nome} va rester avec moi un moment. Sous le plancher." }, velho = { "{nome} m'a rappelé Grand-mère." } }
B.fim.mais_escuro = { "À côté, « {outro} », c'était un pique-nique." }
B.fim.mais_leve = { "Après « {outro} », celui-ci m'a laissé dormir." }
B.fim.serie = { "{ordinal} livre d'affilée qui parle {de_tema}. Je vois un schéma. Eux aussi, peut-être." }
B.fim.traco = {
    amarga = { "Ce livre a pris un peu d'espoir. Je vais le récupérer." },
    otimista = { "J'en sors convaincu que les livres gagnent. Encore une fois." },
    medrosa = { "Je vais dormir avec la lumière allumée quelques jours." },
    corajosa = { "Ce livre m'a épaissi le poil." },
    cinica = { "Je fais moins confiance au narrateur, maintenant. Et à l'auteur." },
    romantica = { "J'en sors plus tendre. Ne le répète pas." },
    popular = { "J'ai aimé. J'enquête sur le pourquoi." },
    erudita = { "J'en sors avec une odeur d'édition ancienne." },
}
B.fim.nota = { filhote = { "{n} pattes sur 5." }, adulto = { "{n} briques descellées sur 5." }, velho = { "{n} braises sur 5." } }
-- Ici {tema}, {antes} et {agora} suivent un verbe sans préposition ; {antes_s}, {agora_s} sont les formes nues.
B.obsessao.nova = { "Je n'arrête pas de ressasser {tema}. Quelqu'un a planté ça." }
B.obsessao.troca = { "Entrée : {agora_s}. Sortie : {antes_s}. Sans bruit, comme de la contrebande." }

-- Souvenirs (5b-3) ; ceux d'humeur (sombrio_desde…) sont coupés dans traca_lembrancas.lua
B.lembranca.autor = { "{autor} encore : le {n}e livre. On sait déjà où {autor} cache les portes." }
B.lembranca.aniversario = { "Un an qu'on a fini « {livro} ». Je connais encore mon morceau." }
B.lembranca.personagem = { "{nome} encore… j'ai un dossier sur cette figure depuis « {livro} »." }
B.lembranca.recorde_longo = { "Je n'ai jamais rien porté d'aussi gros que « {livro} ». Mon dos confirme." }
B.lembranca.recorde_rapido = { "« {livro} » a été le plus rapide de tous. Évasion propre." }
B.lembranca.serie_tema = { "Encore un livre qui parle {de_tema} : {n} d'affilée. Tu cherches quoi, complice ?" }

-- Suite (parité avec la mite, phase 3) : gato_banco/diario_mais_fr.lua s'ajoute au bout des listes ci-dessus.
do
    local function juntar(a, b)
        for k, v in pairs(b) do
            if type(v) == "table" and type(a[k]) == "table" then
                if type(v[1]) == "string" then
                    for _, x in ipairs(v) do a[k][#a[k] + 1] = x end
                else
                    juntar(a[k], v)
                end
            elseif a[k] == nil then
                a[k] = v
            end
        end
    end
    local ok, M = pcall(require, "gato_banco.diario_mais_fr")
    if ok and type(M) == "table" then juntar(B, M) end
end

return B
