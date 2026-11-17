--[[--
Caisse de cartes (français). Répliques de la Mite ; rien n'entre ici sans approbation.
Source : le document « Mite — Lot 1 » (28/10/2026). Voir cartoes_pt.lua pour le détail des champs.

Désactivés pour la bêta (29/10/2026) : présage et père (les listes de mots s'allument à tort).
]]

return {
    {
        id = "pressagio",
        fala = "Cartes sur table, la chance de {personagem}. La mienne ? Personne ne la lit et tout le monde la connaît.",
        quando = { tela = "home", assunto = "pressagio" },
        desligado = true,
    },
    {
        id = "alexandria_ancia",
        fala = "Je t'ai déjà parlé d'Alexandrie ? Toute la famille. En un seul jour.",
        quando = { tela = "home", assunto = "antepassados", gravado = "contou de Alexandria", fase = "ancia" },
    },
    {
        id = "alexandria",
        fala = "On a parlé d'ancêtres. Les miens sont morts dans l'incendie d'Alexandrie. Ma grand-mère me l'a raconté.",
        quando = { tela = "home", assunto = "antepassados" },
        grava = "contou de Alexandria",
        uma_vez = true,
    },
    {
        id = "pai",
        fala = "Un père qui donne des conseils. Le mien ? Je ne l'ai pas connu. Mort écrasé par une encyclopédie Barsa. "
            .. "Mort en faisant ce qu'il aimait : essayer d'atteindre la lettre M.",
        quando = { tela = "home", assunto = "pai" },
        grava = "contou do pai",
        uma_vez = true,
        desligado = true,
    },
}
