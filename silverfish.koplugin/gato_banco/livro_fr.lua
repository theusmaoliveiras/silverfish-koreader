--[[--
Répliques du Chat des Cendres sur ta lecture (français), traduites de gato_banco/livro_pt.lua.
  livro[fase]       %s = le livre en cours
  personagem[fase]  %s = un personnage fréquent du livre (jamais d'adjectif genré)
  palavra[fase]     %s = le dernier mot difficile (une réplique par phase, avec marques de voix)
Phases : filhote, adulto, velho. Marques <polo:…|…> et <dominio:…|> comme dans traca_voz.lua.
]]

return {
    livro = {
        filhote = {
            "« %s » est gros. J'en garderai un morceau par jour.",
            "Je garde encore « %s ». Doucement, pour ne rien perdre.<dominio: Il a une odeur {cheiro}.|>",
            "Est-ce que « %s » finit bien ? Dis-le-moi sans me le dire.",
            "J'ai rêvé de « %s » cette nuit. <corajosa:Je sauvais tout le monde.|romantica:C'était beau.|J'ai eu peur.>",
            "« %s » a des notes de bas de page ? Pourvu que oui.",
            "Grand-mère aurait aimé « %s ». Je crois.",
            "« %s » fait du bruit quand je tourne la page. C'est bon signe ?",
        },
        adulto = {
            "« %s ». Dos vérifié, sorties aussi.",
            "J'archive encore « %s ». <otimista:Léger. Bon signe.|Lourd. Comme prévu.>",
            "Qui a écrit « %s » a connu une cave. Ça se sent.",
            "Après « %s », il me faut <romantica:un mouchoir|medrosa:une lumière allumée|une porte verrouillée> et du silence.",
            "« %s » ne changera pas le monde. Mais il en garde un morceau.",
            "« %s » ? Jolie couverture. Je vais vérifier l'intérieur.<dominio: Une odeur {cheiro}, au passage.|>",
            "J'ai gardé mon morceau de « %s ». Le reste, c'est ton affaire.",
        },
        velho = {
            "« %s » me rappelle un livre que j'ai tiré des cendres.",
            "J'ai gardé des livres pires que « %s ». Et des meilleurs. Celui-là reste.",
            "« %s » ira aux chatons. À ma façon.",
            "À mon âge, « %s » se lit lentement. Tant mieux.",
            "« %s » sent l'édition ancienne. <erudita:J'ai vérifié le colophon.|Ça m'a plu.>",
            "Je pense encore à « %s ». <amarga:Ça finit mal, je parie.|otimista:Ça va bien finir. Je le sens.|On verra.>",
            "J'ai rangé « %s » dans le foulard. Il reste de la place.",
        },
    },
    personagem = {
        filhote = {
            "%s me <corajosa:défie. J'aime ça|romantica:fait fondre le cœur|fait un peu peur>.",
            "J'aime bien %s. <romantica:Beaucoup.|cinica:Pour l'instant.|C'est permis ?>",
            "Revoilà %s. J'ai vérifié les sorties.",
            "Est-ce que %s a un secret ? On dirait.",
            "Si %s avait besoin d'une planque, je prêterais la mienne.",
            "%s parle joliment. Grand-mère disait de s'en méfier.",
            "Chaque fois que %s apparaît, je <medrosa:me cache|corajosa:m'approche|fais attention>.",
        },
        adulto = {
            "Encore %s. Le dossier s'épaissit.",
            "Je connais le genre de %s. <otimista:Ça finit bien, aussi incroyable que ça paraisse.|Ça finit mal.>",
            "%s parle comme quelqu'un qui n'a jamais vérifié une porte.",
            "Si je croisais %s, <romantica:je garderais ses lettres|medrosa:je filerais par la fenêtre|je poserais quelques questions>.",
            "%s cache quelque chose. Moi aussi. On est collègues.",
            "Noté : %s ment dans le mauvais chapitre.",
            "%s est du genre à poser sa tasse sur un livre. Sous surveillance.",
        },
        velho = {
            "%s me rappelle un chat de la cave. Une bonne pâte.",
            "J'en ai vu beaucoup, des comme %s. Certains s'en sortaient.",
            "%s va sur la liste des gens dont on se souvient.",
            "À mon âge, on pardonne à %s. Presque.",
            "%s porte plus que ce qu'on voit. Je connais le poids.",
            "Je raconterai %s aux chatons. À ma façon.",
            "Encore %s. J'aime qu'on revienne.",
        },
    },
    palavra = {
        filhote = "J'ai gardé le mot « %s ». <otimista:Il a un goût de dimanche.|medrosa:Je crois que c'est le mot de passe de quelqu'un.|erudita:Je vais apprendre la définition par cœur.|Maintenant, il est à moi.>",
        adulto = "« %s ». Archivé. <erudita:Un mot noble ; personne ne s'en sert.|popular:Un mot de dictionnaire. Ça ira.|Ça pourrait être un mot de passe.>",
        velho = "« %s ». Celui-là, je l'apprendrai aux chatons. <amarga:Avant qu'ils oublient.|otimista:Ça va leur plaire.|À ma façon.>",
    },
}
