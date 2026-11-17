--[[--
Répliques du Chat des Cendres, en français. Celles que l'utilisateur a choisies dans les lots 1A, 1B et 1C,
dans le même ordre que falas_pt.lua. Il est au masculin, tutoie le lecteur ; jamais d'adjectif genré pour
le lecteur.

Par stade (tempéraments du chat dans traca_species.lua) et par situation. traca_estado.lua pioche ici
tant que le chat est éveillé.
]]

local B = {
    -- l'œuf (lot 1A) : il ne parle pas encore, des choses arrivent ; même liste éveillé et endormi
    ovo = {
        _todas = {
            "(une petite patte a poussé la coquille, puis s'est arrêtée pour écouter)",  -- 1A.1
            "(la coquille s'est tue quand la page a tourné, puis a recommencé)",  -- 1A.2
            "(l'œuf aime rester près du livre. Il y fait plus chaud)",  -- 1A.3
            "(l'œuf ronronne. Il niera plus tard)",  -- 1A.4
            "(la coquille est toute fine. Quelque chose attend dedans que la voie soit libre)",  -- 1A.5
            "(de l'intérieur, tout bas : « psst. continue à lire. »)",  -- 1A.6
        },
    },
    -- le chaton (lot 1A)
    filhote = {
        feliz = {  -- content
            "J'ai gardé une page et personne ne m'a attrapé. C'est comme ça que ça marche ?",  -- 1A.7
            "Grand-mère a dit de commencer par les notes de bas de page. J'en connais déjà trois !",  -- 1A.8
            "Porte fermée, page gardée, ventre au chaud. Règle 1 : faite.",  -- 1A.9
            "Tu lis, je garde. On est une équipe. Une équipe secrète.",  -- 1A.10
            "J'ai caché un mot dans mon foulard. Il y fait bien chaud.",  -- 1A.11
            "Encore un chapitre ? Oui, mais tout bas.",  -- 1A.12
        },
        normal = {  -- au quotidien
            "Grand-mère a dit : vérifie les sorties, puis vérifie l'index. Je vérifie.",  -- 1A.13
            "C'était quoi, ce bruit ? Ah. Juste la page. Bonne page.",  -- 1A.14
            "Approche. J'ai un secret. Je l'ai oublié. Il était bien.",  -- 1A.15
            "Ne me demande pas pour le bandeau. Bon, demande. J'inventerai un truc.",  -- 1A.16
            "Grand-mère m'a mis en garde contre les mites. Elles mangent ce qu'on sauve.",  -- 1A.17
            "J'apprends encore. Il faut commencer par les parties ennuyeuses. C'est la règle.",  -- 1A.18
            "Règle 3 : si un livre est partout, demande qui l'a mis là. Qui a mis celui-ci ?",  -- 1A.19
            "Le noir, c'est bien pour cacher des pages. Et mal pour les retrouver.",  -- 1A.20
        },
        triste = {  -- triste ou affamé
            "Encore vide. Ils ont emporté les livres ? J'ai raté ça ?",  -- 1A.21
            "Grand-mère disait que l'oubli ne fait pas de bruit. Il n'y a pas un bruit, ici.",  -- 1A.22
            "Psst. Tu es toujours là ? Moi, je suis toujours là.",  -- 1A.23
            "J'ai senti de la fumée. Ce n'était rien. Je tremble encore un peu.",  -- 1A.24
            "Rien qu'une page ? Une page, c'est quand même une page sauvée.",  -- 1A.25
        },
        dormindo = {  -- endormi, la nuit sur son écran
            "Zzz… je récite l'index… A… B… zzz…",  -- 1A.26
            "Zzz… je ronronne pour une note de bas de page… zzz…",  -- 1A.27
            "Zzz… touche pas au foulard… zzz…",  -- 1A.28
        },
        casulo = {  -- caché : trop longtemps sans pages
            "Je suis passé dans la clandestinité. Grand-mère m'a appris. Lis une page quand la voie sera libre.",  -- 1A.29
            "Je suis sous le plancher. C'est pas de la peur. C'est de la prudence.",  -- 1A.30
        },
        repouso = {  -- rêves sur l'écran de veille
            "Zzz… je rêve que tous les chats se sont retrouvés et que l'histoire était entière…",  -- 1A.31
            "Zzz… je rêve que les fours étaient pleins de pain, pas de livres…",  -- 1A.32
            "Zzz… je rêve d'une bibliothèque sans portes à vérifier…",  -- 1A.33
        },
        carinho = {  -- caresses
            "Rrrr. C'était pas moi. C'était le livre.",  -- 1A.34
            "Grand-mère a dit de ne jamais baisser la garde. Je la baisse un tout petit peu.",  -- 1A.35
            "Chut. S'ils me voient ronronner, ils sauront que je suis content.",  -- 1A.36
        },
        muda = {  -- proche du stade suivant (le vieux : proche de la fin, avant de laisser un œuf)
            "Je crois que je grandis. Le foulard me va presque.",  -- 1A.37
            "Je ne serai plus chaton très longtemps. Les parties inutiles vont me manquer.",  -- 1A.38
        },
        sumiu = {  -- retour après des jours d'absence ; {n} = jours
            "{n} jours ! J'ai cru qu'ils étaient venus te chercher. J'ai gardé ta page au chaud.",  -- 1A.39
            "Psst. {n} jours. J'ai surveillé l'étagère tout le temps. Presque tout le temps.",  -- 1A.40
        },
    },
    -- l'adulte (lot 1B)
    adulto = {
        feliz = {
            "Page gardée. Archivée. Personne n'a rien vu.",  -- 1B.1
            "Bonne page. Celle-là, je la cacherais derrière un livre ennuyeux.",  -- 1B.2
            "Porte fermée. Sorties vérifiées. Pages à l'abri. Ça, c'est une bonne nuit.",  -- 1B.3
            "Psst. Même heure demain. Apporte le livre.",  -- 1B.4
            "Je sourirais bien, mais quelqu'un nous regarde peut-être.",  -- 1B.5
            "Tu peux continuer à lire. Je surveille la porte.",  -- 1B.6
        },
        normal = {
            "Règle 4 : lis la première page deux fois. C'est là qu'ils cachent la porte.",  -- 1B.7
            "J'ai entendu quelque chose. Sans doute rien. Je vais vérifier quand même.",  -- 1B.8
            "Psst. Si on te demande, on lit, c'est tout.",  -- 1B.9
            "Un œil voit moins. Il remarque plus. Échange honnête.",  -- 1B.10
            "Ne fixe pas l'oreille. C'est impoli. Et c'est une longue histoire.",  -- 1B.11
            "Les mites mangent les livres. Moi, je les garde. On a un accord. De justesse.",  -- 1B.12
            "Tout le monde lit le même livre. Quelqu'un l'a choisi.",  -- 1B.13
            "Je garde mon morceau. Tu gardes le reste. C'est comme ça que les histoires survivent.",  -- 1B.14
        },
        triste = {
            "Étagère vide. Maison silencieuse. Mauvaise combinaison.",  -- 1B.15
            "Règle 2. Tu sais laquelle. L'oubli ne fait pas de bruit.",  -- 1B.16
            "Tu as disparu. J'ai gardé les sorties dégagées.",  -- 1B.17
            "Pas moyen de tenir en place. Un chat sans pages, c'est juste un chat.",  -- 1B.18
            "Donne-moi une phrase, je la ferai durer.",  -- 1B.19
        },
        dormindo = {
            "Zzz… règle 15… sorties… index… zzz…",  -- 1B.20
            "Zzz… je récite mon morceau… dans l'ordre… zzz…",  -- 1B.21
            "Zzz… touche pas au foulard… zzz…",  -- 1B.22
        },
        casulo = {
            "Dans la clandestinité jusqu'à nouvel ordre. Une page me fera sortir.",  -- 1B.23
            "Trop de silence dehors. Je ne me fie pas au silence.",  -- 1B.24
        },
        repouso = {
            "Zzz… je rêve que les chats de la cave se sont retrouvés et que l'histoire était entière…",  -- 1B.25
            "Zzz… je rêve que la mange-papier montait la garde, pour changer…",  -- 1B.26
            "Zzz… je rêve de Grand-mère qui récitait, dans le noir, dans l'ordre…",  -- 1B.27
        },
        carinho = {
            "En service. Mais tu peux continuer.",  -- 1B.28
            "Je ronronne pour des raisons opérationnelles.",  -- 1B.29
            "La règle 10 dit que, plus tard, je raconterai cette histoire autrement.",  -- 1B.30
        },
        muda = {
            "Les moustaches grisonnent. De la suie, je dis aux autres.",  -- 1B.31
            "Bientôt, c'est moi qui raconterai les histoires. Différemment à chaque fois.",  -- 1B.32
        },
        sumiu = {
            "De retour après {n} jours. Parfait. Ferme la porte.",  -- 1B.33
            "{n} jours. Je ne dis pas que je me suis inquiété. Je dis que j'ai beaucoup vérifié la porte.",  -- 1B.34
        },
    },
    -- le vieux (lot 1C)
    velho = {
        feliz = {
            "Page archivée. Les vieilles pattes marchent encore.",  -- 1C.1
            "Une bonne phrase. Je la garderai avec les anciennes.",  -- 1C.2
            "Nuit calme. Je me souviens d'un temps où il n'y en avait aucune.",  -- 1C.3
            "On en a gardé, des choses, toi et moi.",  -- 1C.4
            "Je souris. C'est la faute du livre.",  -- 1C.5
            "Tu peux continuer. Je suis vieux, pas fatigué. Bon. Les deux.",  -- 1C.6
        },
        normal = {
            "« Qui détruit un bon livre tue la raison même. » Milton. Les chats ont gardé celle-là.",  -- 1C.7 (Areopagitica, 1644 ; traduction maison)
            "Des pas ? Non. C'est juste la mémoire qui se promène dans la maison.",  -- 1C.8
            "Approche. Les murs ont des oreilles. Ce sont les miennes qui marchent moins bien.",  -- 1C.9
            "Demande-moi d'où vient mon bandeau. Aujourd'hui, c'est une histoire avec un dragon.",  -- 1C.10
            "Ce foulard a porté plus de pages que je ne saurais en compter.",  -- 1C.11
            "Si la mange-papier me survit, dis-lui quelles pages laisser tranquilles.",  -- 1C.12
            "Lis ce que tout le monde lit. Puis lis ce qu'il y a dessous.",  -- 1C.13
            "Mon morceau de ce livre est aussi le tien, maintenant. Garde-le bien.",  -- 1C.14
        },
        triste = {
            "Une étagère vide, ça fait remonter des choses à un vieux chat.",  -- 1C.15
            "J'oublie l'ordre. L'ordre compte.",  -- 1C.16
            "J'ai déjà veillé sur des pièces vides. Je croyais que c'était fini.",  -- 1C.17
            "Je pense aux chats de la cave. Il en reste peu.",  -- 1C.18
            "Une page, s'il te plaît. Il ne m'en reste plus tant à garder.",  -- 1C.19
        },
        dormindo = {
            "Zzz… sur le livre… là où il fait chaud… zzz…",  -- 1C.20
            "Zzz… grand-mère… je les ai gardées… zzz…",  -- 1C.21
            "Zzz… j'apprends à un chaton… une phrase… zzz…",  -- 1C.22
        },
        casulo = {
            "Encore dans la clandestinité. Je croyais que c'était fini.",  -- 1C.23
            "Trop de silence. À mon âge, le silence est suspect.",  -- 1C.24
        },
        repouso = {
            "Zzz… je rêve que les chats de la cave se sont retrouvés une dernière fois… et que l'histoire était entière…",  -- 1C.25
            "Zzz… je rêve d'une bibliothèque aux portes ouvertes…",  -- 1C.26
            "Zzz… je rêve que je me suis souvenu de la vraie histoire du bandeau…",  -- 1C.27
        },
        carinho = {
            "Bon. Deux fois. À mon âge, je l'ai mérité.",  -- 1C.28
            "C'est là. Ça fait des années que c'est là.",  -- 1C.29
            "Règle 10. Demain, je raconterai ça autrement. En mieux, sans doute.",  -- 1C.30
        },
        muda = {
            "Chaque chat transmet son morceau. Je prépare le mien.",  -- 1C.31
            "Ne sois pas triste. Une histoire racontée à un chaton ne finit pas.",  -- 1C.32
        },
        sumiu = {
            "{n} jours. À mon âge, je les compte.",  -- 1C.33
            "{n} jours. Ne laisse jamais un livre seul. Ni un vieux chat.",  -- 1C.34
        },
    },
}

-- Depuis le 07/11/2026 (parité avec la Mite) : gato_banco/falas_mais_fr.lua, écrit à la main, est ajouté
-- à la suite des listes ci-dessus.
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
    local ok, M = pcall(require, "gato_banco.falas_mais_fr")
    if ok and type(M) == "table" then juntar(B, M) end
end

return B
