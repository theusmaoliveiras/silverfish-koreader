--[[--
Caixa de cartões do Gato-das-Cinzas (português), desde 07/11/2026: a fase 5 da paridade com a traça. Escrito e
aprovado por Claude, a pedido do usuário. O mesmo formato e os mesmos assuntos de traca_banco/cartoes_pt.lua (lá
está a explicação); fase com as do gato (filhote, adulto, velho). Presságio e pai ficam desligados, como os da
traça, até as listas de palavras deles ficarem boas.
]]

return {
    {
        id = "pressagio",
        fala = "Cartas na mesa, sorte de {personagem}. A minha? Anotada num tijolo solto.",
        quando = { tela = "home", assunto = "pressagio" },
        desligado = true,
    },
    {
        id = "vovo_velho",
        fala = "Já te contei da vovó e das fornalhas? Cada gato guardava um pedaço. Ela guardava o índice.",
        quando = { tela = "home", assunto = "antepassados", gravado = "contou da vovó", fase = "velho" },
    },
    {
        id = "vovo",
        fala = "Falaram de antepassados. A minha vovó tirava páginas das cinzas, uma por vez, no dente. Ela me contou.",
        quando = { tela = "home", assunto = "antepassados" },
        grava = "contou da vovó",
        uma_vez = true,
    },
    {
        id = "pai",
        fala = "Pai dando conselho. O meu? Nunca conheci. A vovó dizia que guardava mapas. Ou tinha pressa.",
        quando = { tela = "home", assunto = "pai" },
        grava = "contou do pai",
        uma_vez = true,
        desligado = true,
    },
}
