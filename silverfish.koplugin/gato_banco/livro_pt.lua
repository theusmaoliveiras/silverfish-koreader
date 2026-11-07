--[[--
Falas do Gato-das-Cinzas sobre o que você está lendo (português), desde 07/11/2026: a fase 5 da paridade com a
traça (FALAS_LIVRO, FALAS_PERSONAGEM e a fala da palavra em traca_estado.lua, somadas aos lotes extras). Escrito e
aprovado por Claude, a pedido do usuário.
  livro[fase]       %s = o livro atual
  personagem[fase]  %s = um personagem frequente do livro
  palavra[fase]     %s = a última palavra difícil (uma fala por fase, com marcas de jeito)
Fases: filhote, adulto, velho. Marcas <polo:…|…> e <dominio:…|> como em traca_voz.lua.
]]

return {
    livro = {
        filhote = {
            "“%s” é grande. Vou guardar um pedaço por dia.",
            "Ainda tô guardando “%s”. Devagar, pra não perder nada.<dominio: Tem cheiro de {cheiro}.|>",
            "Será que “%s” acaba bem? Me conta sem contar.",
            "Sonhei com “%s” ontem. <corajosa:Eu salvava todo mundo.|romantica:Foi bonito.|Fiquei com medo.>",
            "“%s” tem nota de rodapé? Tomara.",
            "A vovó ia gostar de “%s”. Acho.",
            "“%s” faz barulho quando eu viro a página. Isso é bom?",
        },
        adulto = {
            "“%s”. Lombada conferida, saídas também.",
            "Ainda arquivando “%s”. <otimista:Leve. Bom sinal.|Pesado. Como esperado.>",
            "Quem escreveu “%s” conhecia um porão. Dá pra sentir.",
            "Depois de “%s”, preciso de <romantica:um lenço|medrosa:uma luz acesa|uma porta trancada> e de silêncio.",
            "“%s” não muda o mundo. Mas guarda um pedaço dele.",
            "“%s”? Capa bonita. Vou conferir o miolo.<dominio: Cheiro de {cheiro}, aliás.|>",
            "Guardei meu pedaço de “%s”. O resto é com você.",
        },
        velho = {
            "“%s” me lembra um livro que eu tirei das cinzas.",
            "Já guardei livros piores que “%s”. E melhores. Esse fica.",
            "“%s” vai pros filhotes. Do meu jeito.",
            "Na minha idade, “%s” se lê devagar. Bom.",
            "“%s” tem cheiro de edição antiga. <erudita:Conferi o colofão.|Gostei.>",
            "Ainda pensando em “%s”. <amarga:Termina mal, aposto.|otimista:Vai terminar bem. Eu sinto.|Vamos ver.>",
            "Guardei “%s” no lenço. Ainda cabe.",
        },
    },
    personagem = {
        filhote = {
            "%s me <corajosa:desafia. Gostei|romantica:deixa com o coração mole|assusta um pouco>.",
            "Gosto de %s. <romantica:Gosto muito.|cinica:Por enquanto.|Isso pode?>",
            "%s apareceu de novo. Conferi as saídas.",
            "Será que %s guarda segredo? Parece.",
            "Se %s precisasse de esconderijo, eu emprestava o meu.",
            "%s fala bonito. A vovó dizia pra desconfiar.",
            "Toda vez que %s aparece, eu <medrosa:me escondo|corajosa:chego mais perto|presto atenção>.",
        },
        adulto = {
            "%s de novo. Pasta engordando.",
            "Conheço o tipo de %s. <otimista:Termina bem, por incrível que pareça.|Termina mal.>",
            "%s fala como quem nunca conferiu uma porta.",
            "Se eu encontrasse %s, <romantica:guardava as cartas|medrosa:saía pela janela|fazia umas perguntas>.",
            "%s esconde alguma coisa. Eu também. Somos colegas.",
            "Anotado: %s mente no capítulo errado.",
            "%s é do tipo que deixa xícara em cima do livro. Vigiado.",
        },
        velho = {
            "%s me lembra um gato do porão. Gente boa.",
            "Já vi muitos como %s. Alguns sobreviviam.",
            "%s vai pra lista dos que valem lembrar.",
            "Na minha idade, a gente perdoa %s. Quase.",
            "%s carrega mais do que mostra. Eu conheço o peso.",
            "Vou contar de %s pros filhotes. Do meu jeito.",
            "%s de novo. Gosto de quem volta.",
        },
    },
    palavra = {
        filhote = "Guardei a palavra “%s”. <otimista:Tem gosto de domingo.|medrosa:Acho que é senha de alguém.|erudita:Vou decorar o verbete.|Agora é minha.>",
        adulto = "“%s”. Arquivado. <erudita:Palavra nobre; ninguém usa.|popular:Palavra de dicionário. Serve.|Pode ser senha.>",
        velho = "“%s”. Essa eu ensino pros filhotes. <amarga:Antes que esqueçam.|otimista:Eles vão gostar.|Do meu jeito.>",
    },
}
