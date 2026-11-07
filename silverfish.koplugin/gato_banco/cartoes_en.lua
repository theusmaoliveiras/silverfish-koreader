--[[--
The Ash Cat's card box (English), since 07/11/2026: phase 5 of the parity with the silverfish. Written and approved
by Claude at the user's request. Same cards, order and marks as gato_banco/cartoes_pt.lua.
]]

return {
    {
        id = "pressagio",
        fala = "Cards on the table, {personagem}'s fortune. Mine? Written on a loose brick.",
        quando = { tela = "home", assunto = "pressagio" },
        desligado = true,
    },
    {
        id = "vovo_velho",
        fala = "Did I ever tell you about Grandmother and the furnaces? Each cat kept a piece. She kept the index.",
        quando = { tela = "home", assunto = "antepassados", gravado = "contou da vovó", fase = "velho" },
    },
    {
        id = "vovo",
        fala = "Ancestors came up. My grandmother pulled pages from the ashes, one at a time, in her teeth. She told me.",
        quando = { tela = "home", assunto = "antepassados" },
        grava = "contou da vovó",
        uma_vez = true,
    },
    {
        id = "pai",
        fala = "A father giving advice. Mine? Never met him. Grandmother said he kept maps. Or was in a hurry.",
        quando = { tela = "home", assunto = "pai" },
        grava = "contou do pai",
        uma_vez = true,
        desligado = true,
    },
}
