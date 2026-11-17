--[[--
Boîte à cartes du Chat des Cendres (français), depuis le 07/11/2026 : phase 5 de la parité avec la Mite.
Mêmes cartes, ordre et marques que gato_banco/cartoes_pt.lua ; seul le texte de `fala` est traduit
(les valeurs de `grava`/`gravado` sont des identifiants).
]]

return {
    {
        id = "pressagio",
        fala = "Cartes sur table, l'avenir de {personagem}. Le mien ? Noté sur une brique descellée.",
        quando = { tela = "home", assunto = "pressagio" },
        desligado = true,
    },
    {
        id = "vovo_velho",
        fala = "Je t'ai déjà parlé de Grand-mère et des fours ? Chaque chat gardait un morceau. Elle, elle gardait l'index.",
        quando = { tela = "home", assunto = "antepassados", gravado = "contou da vovó", fase = "velho" },
    },
    {
        id = "vovo",
        fala = "On parle d'ancêtres. Ma grand-mère tirait les pages des cendres, une à une, entre ses dents. C'est elle qui me l'a dit.",
        quando = { tela = "home", assunto = "antepassados" },
        grava = "contou da vovó",
        uma_vez = true,
    },
    {
        id = "pai",
        fala = "Un père qui donne des conseils. Le mien ? Jamais connu. Grand-mère disait qu'il gardait des cartes. Ou qu'il était pressé.",
        quando = { tela = "home", assunto = "pai" },
        grava = "contou do pai",
        uma_vez = true,
        desligado = true,
    },
}
