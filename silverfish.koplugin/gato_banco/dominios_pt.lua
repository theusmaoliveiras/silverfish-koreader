--[[--
Vocabulário de cada tema do Gato-das-Cinzas (português), desde 07/11/2026: a fase 5 da paridade com a traça.
Escrito e aprovado por Claude, a pedido do usuário. O mesmo formato de traca_banco/dominios_pt.lua (lá estão os
seis tipos e como entram nas frases): gosto (o gosto da página que ele carrega no dente), cheiro, comparacao,
exclamacao, lugar, coisa. Nos temas de política, nenhuma palavra de política (VOICE-CAT.md, seção 4).
_causa: o mau humor com motivo real do livro, por fase (filhote, adulto, velho); {evento} já vem com
"aquela"/"aquele", então nunca depois de preposição.
]]

local D = {}

D.morte = {
    gosto = { "cinza fria", "vela apagada", "terra molhada", "chá de velório", "papel queimado" },
    cheiro = { "vela queimada", "crisântemo", "terra revirada", "fumaça velha", "flor de enterro" },
    comparacao = { "um sino ao longe", "uma vela no fim", "uma carta que ninguém vai abrir", "um relógio parado", "um nome riscado" },
    exclamacao = { "Que descanse em paz!", "Acende uma vela!", "Silêncio, por respeito!", "Guarda o nome!" },
    lugar = { "num cemitério", "atrás de uma lápide", "numa capela vazia", "num velório", "numa cripta" },
    coisa = { "uma coroa de flores", "um véu preto", "uma lápide sem nome", "um retrato com fita preta", "uma vela apagada" },
}
D.amor = {
    gosto = { "carta perfumada", "mel", "bombom", "morango", "chá com açúcar" },
    cheiro = { "rosa", "perfume de carta", "lavanda", "flor de laranjeira", "papel de seda" },
    comparacao = { "um bilhete dobrado", "uma promessa cumprida", "um coração desenhado na margem", "uma valsa", "uma carta escondida no lenço" },
    exclamacao = { "Ai, o amor!", "Que romântico!", "Guarda essa carta!", "Promessa é promessa!" },
    lugar = { "num baile", "debaixo de uma janela", "num jardim de rosas", "numa varanda", "num banco de praça" },
    coisa = { "uma carta de amor", "um anel", "uma rosa seca", "um lenço bordado", "um retrato num medalhão" },
}
D.guerra = {
    gosto = { "pólvora", "ferrugem", "fumaça", "lama", "pão duro" },
    cheiro = { "pólvora", "fumaça", "couro de bota", "lama", "metal quente" },
    comparacao = { "um tambor marchando", "um mapa rasgado", "um canhão ao longe", "uma trincheira molhada", "uma bandeira caída" },
    exclamacao = { "Abaixa!", "Todo mundo pro porão!", "Silêncio na trincheira!", "Fogo!" },
    lugar = { "numa trincheira", "no campo de batalha", "atrás de uma barricada", "num quartel", "na linha de frente" },
    coisa = { "uma medalha", "um capacete amassado", "uma bandeira rasgada", "um mapa de batalha", "uma carta do front" },
}
D.mar = {
    gosto = { "sal", "maresia", "peixe seco", "alga", "água de coco" },
    cheiro = { "maresia", "corda molhada", "alcatrão", "peixe", "madeira de navio" },
    comparacao = { "uma onda quebrando", "um farol piscando", "um navio sem rumo", "uma garrafa com bilhete", "uma âncora no fundo" },
    exclamacao = { "Terra à vista!", "Segura o mastro!", "Baixa a vela!", "Vento a favor!" },
    lugar = { "no convés", "no porão do navio", "num farol", "num cais", "no fundo do mar" },
    coisa = { "uma âncora", "um mapa de tesouro", "uma garrafa com bilhete", "uma bússola", "uma rede de pesca" },
}
D.fe = {
    gosto = { "hóstia", "vinho de missa", "pão abençoado", "água benta", "cera de vela" },
    cheiro = { "incenso", "cera de vela", "pedra fria de igreja", "pergaminho", "flor de altar" },
    comparacao = { "um sino de igreja", "uma oração baixinha", "um vitral aceso", "um rosário entre os dedos", "uma vela num altar" },
    exclamacao = { "Valha-me!", "Amém!", "Que os livros nos guardem!", "Graças!" },
    lugar = { "numa capela", "num mosteiro", "atrás do altar", "numa biblioteca de convento", "num claustro" },
    coisa = { "um rosário", "um livro de salmos", "um vitral", "uma vela de promessa", "um pergaminho antigo" },
}
D.dinheiro = {
    gosto = { "moeda velha", "papel-moeda", "ouro", "cobre", "tinta de recibo" },
    cheiro = { "moeda velha", "cofre fechado", "couro de carteira", "tinta de banco", "papel novo" },
    comparacao = { "um cofre trancado", "uma moeda rolando", "um recibo amassado", "uma herança disputada", "um livro de contas" },
    exclamacao = { "Que fortuna!", "Segue o dinheiro!", "Tudo por umas moedas!", "Quem paga essa conta?" },
    lugar = { "num banco", "atrás de um cofre", "num escritório de contas", "numa casa de penhores", "num leilão" },
    coisa = { "uma moeda de ouro", "um cofre", "um testamento", "um livro de contas", "um recibo" },
}
D.loucura = {
    gosto = { "remédio amargo", "chá de camomila", "giz", "tinta fresca", "nada" },
    cheiro = { "éter", "quarto fechado", "papel de parede velho", "remédio", "vela de madrugada" },
    comparacao = { "um relógio andando pra trás", "uma porta que abre sozinha", "um espelho rachado", "um eco no corredor", "uma escada que não acaba" },
    exclamacao = { "Que delírio!", "Confere a porta de novo!", "Calma, calma!", "Ninguém tá ouvindo isso?" },
    lugar = { "num sótão trancado", "num corredor sem fim", "num quarto de papel de parede amarelo", "num labirinto", "atrás do espelho" },
    coisa = { "um espelho rachado", "uma carta sem sentido", "uma chave que não abre nada", "um relógio sem ponteiros", "um caderno rabiscado" },
}
D.tempo = {
    gosto = { "poeira", "chá frio", "papel amarelado", "pão de ontem", "tinta desbotada" },
    cheiro = { "papel amarelado", "poeira", "relógio de corda", "baú antigo", "sótão" },
    comparacao = { "um relógio de pêndulo", "uma ampulheta virando", "uma foto desbotada", "uma folha caindo", "um calendário rasgado" },
    exclamacao = { "Como o tempo passa!", "Já é tarde!", "Mais um ano!", "Lembra disso?" },
    lugar = { "num sótão", "dentro de um relógio", "num baú antigo", "numa estação vazia", "numa casa abandonada" },
    coisa = { "uma ampulheta", "um relógio de bolso", "um calendário velho", "uma foto antiga", "uma carta datada" },
}
D.cidade = {
    gosto = { "fuligem", "café de esquina", "pão de padaria", "chuva de calçada", "fumaça de bonde" },
    cheiro = { "fuligem", "café", "chuva no asfalto", "sebo de livros", "pão quente" },
    comparacao = { "um bonde passando", "uma janela acesa", "uma esquina sem nome", "um beco escuro", "uma multidão apressada" },
    exclamacao = { "Olha o bonde!", "Que barulheira!", "Cuidado na esquina!", "Pega o atalho!" },
    lugar = { "num beco", "numa esquina", "num sebo", "debaixo de uma ponte", "num telhado" },
    coisa = { "um bilhete de bonde", "um lampião", "uma chave de pensão", "um mapa da cidade", "um jornal de ontem" },
}
D.natureza = {
    gosto = { "folha", "orvalho", "terra", "musgo", "chuva" },
    cheiro = { "terra molhada", "pinho", "musgo", "chuva", "grama cortada" },
    comparacao = { "um rio correndo", "uma árvore velha", "um vento no mato", "uma folha caindo", "uma tempestade chegando" },
    exclamacao = { "Que céu!", "Olha a chuva!", "Escuta o vento!", "Cuidado com a raiz!" },
    lugar = { "no meio do mato", "debaixo de uma árvore", "na beira de um rio", "numa clareira", "numa toca" },
    coisa = { "uma folha seca", "uma pedra lisa", "um galho", "um ninho vazio", "uma pena" },
}
D.comida = {
    gosto = { "pão quente", "sopa", "queijo", "bolo de vó", "chá com mel" },
    cheiro = { "pão quente", "sopa de panela", "canela", "café passado", "bolo saindo do forno" },
    comparacao = { "uma panela no fogo", "uma mesa posta", "uma fatia de bolo", "um banquete", "uma xícara fumegando" },
    exclamacao = { "Que banquete!", "Tá servido!", "Passa o pão!", "Cheiro de comida!" },
    lugar = { "numa cozinha", "numa despensa", "numa padaria", "debaixo da mesa", "numa estalagem" },
    coisa = { "uma colher de pau", "um pão", "uma panela", "um pote de mel", "uma toalha xadrez" },
}
D.familia = {
    gosto = { "almoço de domingo", "bolo de aniversário", "sopa de vó", "chá da tarde", "doce de casa" },
    cheiro = { "casa de vó", "baú de família", "álbum antigo", "lençol limpo", "almoço de domingo" },
    comparacao = { "um álbum de fotos", "uma árvore genealógica", "um testamento lido em voz alta", "uma mesa cheia", "um segredo de família" },
    exclamacao = { "Ai, a família!", "Todo mundo pra mesa!", "Isso fica entre nós!", "Que herança!" },
    lugar = { "numa casa de família", "na sala de jantar", "num casarão", "no quarto dos fundos", "num retrato de parede" },
    coisa = { "um álbum de fotos", "um anel de família", "um testamento", "um retrato antigo", "uma árvore genealógica" },
}
D.infancia = {
    gosto = { "bala", "leite morno", "bolacha", "pirulito", "maçã" },
    cheiro = { "giz de cera", "lápis apontado", "bala", "talco", "caderno novo" },
    comparacao = { "um pião girando", "um balão escapando", "uma pipa no céu", "um esconde-esconde", "um desenho de giz" },
    exclamacao = { "Achei!", "Pega!", "Mais uma vez!", "Não vale!" },
    lugar = { "num quintal", "numa casa na árvore", "debaixo da cama", "num esconderijo de criança", "numa sala de aula" },
    coisa = { "um pião", "uma bolinha de gude", "um caderno de desenho", "um ursinho", "uma pipa" },
}
D.politica = {
    gosto = { "cera de lacre", "tinta de pergaminho", "vinho de banquete", "poeira de trono", "papel timbrado" },
    cheiro = { "cera de lacre", "salão fechado", "tapete antigo", "pergaminho", "vela de palácio" },
    comparacao = { "uma coroa torta", "um trono vazio", "um selo partido", "um discurso comprido", "uma escadaria de palácio" },
    exclamacao = { "Viva a coroa!", "Silêncio no salão!", "Que discurso!", "Abram alas!" },
    lugar = { "num palácio", "num salão de trono", "numa torre", "numa praça cheia", "num corredor de palácio" },
    coisa = { "uma coroa", "um selo de cera", "um cetro", "um pergaminho lacrado", "um estandarte" },
}
D.ciencia = {
    gosto = { "álcool", "giz", "ferro", "pó de laboratório", "tinta de caneta" },
    cheiro = { "álcool", "fumaça de experimento", "ozônio", "papel queimado", "metal" },
    comparacao = { "um tubo de ensaio fervendo", "uma engrenagem girando", "uma estrela num telescópio", "uma fórmula no quadro", "uma faísca" },
    exclamacao = { "Eureca!", "Funcionou!", "Cuidado com a faísca!", "Anota isso!" },
    lugar = { "num laboratório", "num observatório", "numa oficina", "atrás de uma máquina", "numa sala de aula" },
    coisa = { "um tubo de ensaio", "uma lupa", "uma engrenagem", "um telescópio", "um caderno de fórmulas" },
}
D.solidao = {
    gosto = { "chá frio", "pão de uma pessoa só", "silêncio", "café requentado", "nada" },
    cheiro = { "quarto vazio", "chá frio", "poeira", "janela fechada", "casa sem gente" },
    comparacao = { "um farol sem navio", "uma cadeira vazia", "uma carta sem resposta", "um eco", "uma vela sozinha" },
    exclamacao = { "Tem alguém aí?", "Que silêncio!", "Fica um pouco!", "Ninguém?" },
    lugar = { "num quarto vazio", "numa casa sem gente", "numa ilha", "num farol", "num banco de estação" },
    coisa = { "uma cadeira vazia", "uma carta sem resposta", "uma xícara só", "uma chave sem porta", "um retrato virado" },
}
D.arte = {
    gosto = { "tinta a óleo", "carvão", "verniz", "aquarela", "papel de desenho" },
    cheiro = { "tinta fresca", "aguarrás", "carvão", "papel de desenho", "verniz" },
    comparacao = { "um quadro inacabado", "um verso decorado", "uma partitura", "uma estátua", "um poema na margem" },
    exclamacao = { "Que obra!", "Bravo!", "Guarda esse verso!", "Que beleza!" },
    lugar = { "num ateliê", "num museu", "num teatro", "numa sala de concerto", "atrás de uma tela" },
    coisa = { "um pincel", "uma partitura", "um poema", "uma tela em branco", "um caderno de esboços" },
}
D.animais = {
    gosto = { "leite", "peixe", "capim", "ração", "queijo" },
    cheiro = { "pelo molhado", "estrebaria", "toca", "feno", "peixe" },
    comparacao = { "um lobo na neve", "um cavalo galopando", "um corvo na janela", "um gato no telhado", "uma coruja de vigia" },
    exclamacao = { "Miau!", "Olha o bicho!", "Psst, bicho!", "Que bicho esperto!" },
    lugar = { "numa toca", "num estábulo", "num ninho", "num telhado", "num celeiro" },
    coisa = { "uma pena", "uma coleira", "uma pegada", "um ninho", "um sino de gato" },
}
D.noite = {
    gosto = { "orvalho", "chá de madrugada", "escuro", "leite morno", "café frio" },
    cheiro = { "vela", "orvalho", "jasmim de noite", "lampião", "madrugada" },
    comparacao = { "uma lua cheia", "um lampião aceso", "uma coruja de vigia", "uma janela acesa no escuro", "um sino à meia-noite" },
    exclamacao = { "Psst!", "Apaga a luz!", "Meia-noite!", "Quem tá aí?" },
    lugar = { "debaixo da lua", "num telhado de noite", "numa rua escura", "num porão", "perto de um lampião" },
    coisa = { "um lampião", "uma vela", "uma lanterna", "uma coruja de pedra", "um relógio batendo meia-noite" },
}
D.viagem = {
    gosto = { "poeira de estrada", "pão de viagem", "café de estação", "fruta de beira de estrada", "água de cantil" },
    cheiro = { "poeira de estrada", "fumaça de trem", "mala de couro", "estação", "mapa velho" },
    comparacao = { "um trem partindo", "uma estrada sem fim", "um mapa dobrado", "uma mala fechada", "um apito ao longe" },
    exclamacao = { "Partindo!", "Todo mundo a bordo!", "Segue o mapa!", "Olha a estação!" },
    lugar = { "num trem", "numa estação", "numa estalagem", "na beira da estrada", "numa carruagem" },
    coisa = { "uma mala", "um mapa", "uma passagem de trem", "uma bússola", "um cantil" },
}
D.vinganca = {
    gosto = { "veneno", "ferro", "fel", "vinho amargo", "cinza" },
    cheiro = { "veneno", "pólvora", "fumaça", "lâmina", "carta queimada" },
    comparacao = { "uma brasa escondida", "uma lâmina guardada", "uma conta antiga", "uma carta queimada", "uma promessa ruim" },
    exclamacao = { "Isso não fica assim!", "Eu não esqueço!", "Cuidado!", "Agora sim!" },
    lugar = { "num duelo", "atrás de uma cortina", "num corredor escuro", "num baile de máscaras", "numa cela" },
    coisa = { "uma luva atirada", "uma adaga", "um frasco de veneno", "uma máscara", "uma carta anônima" },
}
D.liberdade = {
    gosto = { "ar livre", "vento", "pão repartido", "água de fonte", "chuva" },
    cheiro = { "vento", "campo aberto", "mar aberto", "porta aberta", "manhã" },
    comparacao = { "uma gaiola aberta", "um pássaro voando", "uma porta destrancada", "uma corrente partida", "uma janela escancarada" },
    exclamacao = { "Corre!", "Abre a porta!", "Agora!", "Livre!" },
    lugar = { "a céu aberto", "num campo aberto", "fora da gaiola", "no alto de um morro", "do lado de fora" },
    coisa = { "uma chave", "uma corrente partida", "uma gaiola vazia", "uma porta aberta", "uma asa" },
}
D.saber = {
    gosto = { "papel velho", "tinta", "cola de lombada", "poeira de biblioteca", "pergaminho" },
    cheiro = { "papel velho", "biblioteca", "tinta", "lombada de couro", "poeira de estante" },
    comparacao = { "uma enciclopédia aberta", "um índice bem feito", "uma nota de rodapé comprida", "uma biblioteca inteira", "um dicionário gasto" },
    exclamacao = { "Confere o índice!", "Que nota de rodapé!", "Anotado!", "Isso eu sei!" },
    lugar = { "numa biblioteca", "num arquivo", "numa estante alta", "num sebo", "numa sala de leitura" },
    coisa = { "um dicionário", "um índice", "uma errata", "uma primeira edição", "uma enciclopédia" },
}
D.medo = {
    gosto = { "fumaça", "poeira de porão", "ferrugem", "vela apagada", "susto" },
    cheiro = { "fumaça", "porão fechado", "mofo", "cera derretida", "coisa queimada" },
    comparacao = { "um passo no escuro", "uma porta rangendo", "uma sombra na parede", "um sussurro no corredor", "uma vela apagando" },
    exclamacao = { "Psst! Fica perto!", "Quem tá aí?", "Confere a porta!", "Corre!" },
    lugar = { "num porão escuro", "atrás da parede", "num corredor sem luz", "debaixo da escada", "num sótão" },
    coisa = { "uma vela apagada", "uma chave enferrujada", "um retrato que olha", "uma porta trancada", "uma teia" },
}

-- Causa inventada: o mau humor ganha um motivo real (o acontecimento de destaque de um capítulo recente).
D._causa = {
    eventos = {
        morte = "aquela morte", casamento = "aquele casamento", viagem = "aquela viagem", carta = "aquela carta",
        tempestade = "aquela tempestade", doenca = "aquela febre", festa = "aquela festa", briga = "aquela briga",
        fuga = "aquela fuga", crime = "aquele crime",
    },
    filhote = {
        "Acordei com a orelha baixa. Deve ser {evento} de “{livro}”.",
        "Tô sem vontade de nada hoje. Acho que foi {evento} de “{livro}”.",
        "Não sei por que tô assim. Ou sei: {evento} de “{livro}”.",
        "Não sai da minha cabeça: {evento} de “{livro}”.",
    },
    adulto = {
        "Mau humor. Deve ser {evento} de “{livro}”. Ainda tô arquivando.",
        "Acordei de pelo eriçado. É {evento} de “{livro}”, certeza.",
        "Se eu responder seco hoje, culpa: {evento} de “{livro}”.",
        "Não me pergunta nada hoje. É {evento} de “{livro}”, ainda.",
    },
    velho = {
        "Dia de lenço puxado. É {evento} de “{livro}”.",
        "Na minha idade, {evento} de “{livro}” pesa mais.",
        "Não esqueço {evento} de “{livro}”. A vovó saberia o que dizer.",
        "Hoje o porão tá frio. É {evento} de “{livro}”, ainda.",
    },
}

return D
