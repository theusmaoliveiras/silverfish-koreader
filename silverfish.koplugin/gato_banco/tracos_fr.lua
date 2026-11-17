--[[--
Banque de la nature du Chat des Cendres (français), traduite de gato_banco/tracos_pt.lua (lot 5a).

rotulos[polo] : le mot de chaque côté de chaque axe, à la place de ceux de la mite ; sans genre.
falas[polo][temperamento] : ce qu'il dit à l'écran d'accueil quand ce côté est marqué, une par phase
  (filhote, adulto, velho).
diario[polo][1|2|"volta"] : ce qu'il note quand le côté devient marqué (1), fort (2) ou passe ;
  {livro} = le livre du moment où ça a changé. Il est au masculin ; jamais de genre pour le lecteur.
]]

local B = { rotulos = {}, falas = {}, diario = {} }

B.rotulos.amarga = "SANS ILLUSIONS"
B.rotulos.otimista = "GARDE UNE BRAISE"
B.rotulos.medrosa = "AUX AGUETS"
B.rotulos.corajosa = "À DÉCOUVERT"
B.rotulos.cinica = "SUR SES GARDES"
B.rotulos.romantica = "FIDÈLE À LA MORT"
B.rotulos.popular = "AIME LES BEST-SELLERS"
B.rotulos.erudita = "ÉDITIONS ANCIENNES"
B.rotulos.diurna = "GARDE DE JOUR"
B.rotulos.noturna = "GARDE DE NUIT"

B.falas.amarga = {
    filhote = { "Tout le monde meurt dans tes livres. Je tiens les comptes." },
    adulto = { "Attends-toi au pire. Ensuite, archive." },
    velho = { "J'ai gardé assez de fins tristes pour remplir une cave." },
}
B.falas.otimista = {
    filhote = { "Le papier brûle. Les histoires, non. Grand-mère l'a promis." },
    adulto = { "L'espoir, c'est la page qu'on a oublié de brûler." },
    velho = { "J'ai vu le feu s'éteindre. Chaque fois." },
}
B.falas.medrosa = {
    filhote = { "Tes livres ont trop de caves. Les caves, je connais." },
    adulto = { "Psst. Lumière éteinte. Quelque chose bouge dans les murs. Pas moi." },
    velho = { "Je sais ce qui vit dans les murs. J'en ai fait partie." },
}
B.falas.corajosa = {
    filhote = { "Grand-mère n'a jamais vu la mer. Je la lis pour elle." },
    adulto = { "Oublie les sorties. Aujourd'hui, on passe par la grande porte." },
    velho = { "Maintenant, je lis à voix haute. Les murs n'ont qu'à prendre des notes." },
}
B.falas.cinica = {
    filhote = { "Dans ce livre, tout le monde veut quelque chose. Moi aussi : la page." },
    adulto = { "De la gentillesse ? Attends trois chapitres." },
    velho = { "Chaque héros a son prix. J'ai gardé les reçus." },
}
B.falas.romantica = {
    filhote = { "Ils ont promis et ils ont tenu. Comme la Règle 1, mais pour les gens." },
    adulto = { "La loyauté, c'est la seule chose que je ne cache pas." },
    velho = { "Grand-mère gardait une lettre dans son foulard. Maintenant, je comprends." },
}
B.falas.popular = {
    filhote = { "Tout le monde lit ça. C'est mauvais ? N'empêche, c'est amusant." },
    adulto = { "J'aime bien. Je me méfie du fait que j'aime bien." },
    velho = { "Ne dis pas aux chatons que ça m'a plu." },
}
B.falas.erudita = {
    filhote = { "Note de bas de page numéro quarante. Grand-mère serait fière." },
    adulto = { "Première édition. Ne respire pas dessus." },
    velho = { "Notes, errata, l'achevé d'imprimer. Toute ma vie." },
}
B.falas.diurna = {
    filhote = { "Les pages de jour sont plus chaudes. J'ai vérifié." },
    adulto = { "Lumière du jour. Rien à cacher. Presque rien." },
    velho = { "Lumière du matin, livre ouvert. J'aurai vécu assez pour voir ça." },
}
B.falas.noturna = {
    filhote = { "Moins d'yeux la nuit. J'entends mieux les pages." },
    adulto = { "Psst. Tout le monde dort. Parfait." },
    velho = { "La garde de nuit a toujours été la mienne. Maintenant, c'est la nôtre." },
}

B.diario.amarga = { [1] = { "Moins d'illusions ces temps-ci. « {livro} » en a emporté quelques-unes." }, [2] = { "Maintenant, j'attends le pire de chaque chapitre. En général, il livre." }, volta = { "L'espoir est revenu en douce. Je ne l'ai pas laissé faire. Il est venu quand même." } }
B.diario.otimista = { [1] = { "Je me suis surpris à fredonner sur le pas de la porte. C'est « {livro} »." }, [2] = { "La braise est devenue un petit feu. Du bon." }, volta = { "La braise s'est tue. Encore tiède." } }
B.diario.medrosa = { [1] = { "J'ai sursauté à une page tournée aujourd'hui. C'est nouveau." }, [2] = { "Maintenant, tout ressemble à des pas. Merci, les livres." }, volta = { "Hier, j'ai dormi malgré un craquement. Progrès." } }
B.diario.corajosa = { [1] = { "J'ai lu une page à voix haute. Personne n'est venu. Bien." }, [2] = { "Je ne me cache plus derrière les livres ennuyeux. Bon. Moins." }, volta = { "Le courage est parti faire la sieste." } }
B.diario.cinica = { [1] = { "Maintenant, je cherche le prix de chaque faveur." }, [2] = { "Je suis l'argent dans chaque chapitre. Il est toujours là." }, volta = { "J'ai cru un narrateur, encore. On verra." } }
B.diario.romantica = { [1] = { "J'ai gardé une lettre de « {livro} ». Dans le foulard." }, [2] = { "Mon cœur est une planque pleine de lettres." }, volta = { "Le côté tendre est retourné dans sa planque." } }
B.diario.popular = { [1] = { "J'ai sauté une description aujourd'hui. Grand-mère aurait froncé les sourcils." }, [2] = { "J'aime ce que tout le monde lit. J'ai fait la paix avec ça. Presque." }, volta = { "J'ai relu une note de bas de page. Je me suis senti chez moi." } }
B.diario.erudita = { [1] = { "Je me suis mis à citer des notes de bas de page. À voix haute. Pardon." }, [2] = { "Maintenant, je lis les errata pour le plaisir." }, volta = { "J'ai lu une page entière sans note de bas de page. J'ai survécu." } }
B.diario.diurna = { [1] = { "De garde le jour, ces temps-ci. Bizarre, pour un chat de cave." }, [2] = { "Chat de jour, maintenant. Les chats de la cave en riraient." }, volta = { "Les matins se sont tus. Retour aux heures sombres." } }
B.diario.noturna = { [1] = { "De nouveau de garde la nuit, depuis tes nuits blanches." }, [2] = { "Minuit est devenu mon bureau." }, volta = { "Moins de minuits ces temps-ci. La cave les regrette." } }

-- Suite (parité avec la mite, phase 3) : gato_banco/tracos_mais_fr.lua s'ajoute au bout des listes ci-dessus.
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
    local ok, M = pcall(require, "gato_banco.tracos_mais_fr")
    if ok and type(M) == "table" then juntar(B, M) end
end

return B
