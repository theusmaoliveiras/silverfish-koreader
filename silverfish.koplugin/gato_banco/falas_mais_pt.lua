--[[--
Mais falas do dia a dia do Gato-das-Cinzas (português), desde 07/11/2026: a paridade com a traça no volume das
falas por situação (as dela somadas aos lotes extras). Escrito e aprovado por Claude, a pedido do usuário. Somado
no fim de gato_banco/falas_pt.lua (que é gerado das escolhas dos lotes 1A, 1B e 1C e não se edita à mão): cada
lista daqui entra depois das escolhidas.

Situações novas, como as da traça:
  muda_perto     até 60 páginas da próxima fase, às vezes; %d = as páginas que faltam (FALAS_MUDA_PERTO)
  muda_iminente  nas últimas 10 páginas antes da próxima fase (FALAS_MUDA_IMINENTE); o ovo do gato choca em
                 2 páginas, então não tem
O velho não tem próxima fase: continua com as falas de `muda` perto do fim da vida.
Marcas <polo:…|…> como em traca_voz.lua. Nada de adjetivo com gênero para o leitor nem para ele.
]]

return {
    ovo = {
        _todas = {
            "(a casca estalou baixinho, como uma página virando)",
            "(algo lá dentro arranhou a casca três vezes. Contando as saídas?)",
            "(o ovo chegou mais perto do livro. Ninguém viu ele se mexer)",
            "(cheiro de fumaça? não. o ovo só está quentinho)",
            "(lá de dentro: “o índice… o índice primeiro…”)",
            "(a casca tremeu quando a luz apagou, depois sossegou)",
            "(uma ponta de lenço apareceu numa rachadura. Sumiu de novo)",
            "(o ovo parou de mexer. Está escutando você ler)",
        },
    },
    filhote = {
        feliz = {
            "Decorei mais uma regra! Agora sei quatro. Ou três e meia.",
            "Hoje ninguém mexeu no lenço. Melhor dia.",
            "Guardei duas páginas. A vovó ia contar pra todo mundo.",
            "Psst. Achei um esconderijo novo. Atrás do dicionário.",
            "Você leu bastante. Eu guardei bastante. Empate bom.",
            "Ronronei sem querer. Não anota isso.",
            "Tudo quieto, livro aberto, você aqui. Assim eu gosto.",
            "<corajosa:Hoje li em voz alta! Baixinho, mas alta.|medrosa:Hoje não teve nenhum estalo. Nenhum!|Hoje foi um dia de página boa.>",
        },
        normal = {
            "A vovó dizia que todo filhote começa pelo índice. Tô no índice.",
            "Psst. Você sabia que a nota de rodapé é a parte mais segura?",
            "Tô treinando cara de gato que não esconde nada.",
            "Contei as saídas da sala. Três. A vovó contaria quatro.",
            "Quando eu crescer, vou guardar um livro inteiro. Um pedaço de cada vez.",
            "Tem gente que lê rápido. Eu leio e guardo. É diferente.",
            "O lenço é grande pra mim. A vovó disse que eu cresço pra dentro dele.",
            "Qual é a regra de hoje? Todas. Todo dia.",
            "Psst. Esse barulho foi você? Ufa.",
            "Eu vigio a porta, você vira a página. Combinado?",
            "<erudita:Aprendi uma palavra que ninguém usa. Vou usar sempre.|popular:Esse livro todo mundo lê. Eu também quero.|Ainda tô aprendendo onde esconder as coisas.>",
        },
        triste = {
            "A estante tá tão quieta. Será que alguém levou alguma coisa?",
            "Não tem página nova. O lenço ficou leve demais.",
            "A vovó dizia que quem lembra nunca fica só. Tô tentando lembrar.",
            "Psst. Volta logo. Eu guardo seu lugar.",
            "Ouvi um barulho e não tinha ninguém. Pior que ter.",
            "Sem livro, o porão fica grande demais.",
            "Contei as saídas três vezes e ninguém viu.",
            "Uma frase. Só uma. Eu guardo direitinho.",
        },
        casulo = {
            "Tô atrás da parede. Bate três vezes quando for seguro.",
            "A vovó me mostrou esse buraco. Aqui ninguém acha.",
            "Psst. Embaixo do assoalho. Lê uma página e eu saio.",
            "Escondi o lenço e eu junto. Uma página me chama de volta.",
            "Tá escuro aqui. Escuro bom. Mas volta.",
        },
        repouso = {
            "Zzz… sonhando que a vovó me ensinava a última regra…",
            "Zzz… sonhando com um índice que levava a todos os livros…",
        },
        muda_perto = {
            "Faltam umas %d páginas pra eu crescer. O lenço vai servir?",
            "Mais %d páginas e eu deixo de ser filhote. Vou sentir falta do índice.",
            "Contei: %d páginas. Contei de novo. Ainda %d.",
            "Daqui a %d páginas eu cresço. Promete que me reconhece?",
            "%d páginas pra eu virar gato de verdade. A vovó ia gostar de ver.",
        },
        muda_iminente = {
            "Tô crescendo. Agora. Segura o lenço?",
            "Alguma coisa tá mudando. As patas tão maiores. Juro.",
            "Psst. Mais umas páginas e eu mudo de fase.",
            "Não vira a página muito rápido. Tô crescendo no meio dela.",
            "O lenço tá servindo! Quase!",
        },
    },
    adulto = {
        feliz = {
            "Turno tranquilo. Página guardada. Saídas livres.",
            "Ninguém tocou no lenço hoje. Raro. Bom.",
            "Arquivo cheio. Pode seguir lendo, eu fico de guarda.",
            "Noite boa: chá seu, página minha, porta trancada.",
            "Hoje eu ronronaria. Em particular.",
            "Mais um capítulo salvo. Contabilizado.",
            "Tudo em ordem. Desconfio, mas aproveito.",
            "<romantica:Você voltou pro livro. Eu reparei.|cinica:Dia bom. Vou anotar, pra lembrar que existe.|Dia bom. Anotado.>",
        },
        normal = {
            "Saídas conferidas. Índice conferido. Pode ler.",
            "Psst. Fala baixo. A estante ouve.",
            "Um olho na página, um olho na porta. Bom, um olho só.",
            "Eu guardo, você lê. Divisão justa de trabalho.",
            "Regra quinze. Saídas, depois o índice. Feito.",
            "Estante arrumada demais na sala. Não gosto.",
            "Edição resumida eu não aceito. Nem de graça.",
            "Ouvi a vassoura. Mudei de esconderijo.",
            "A come-papel dorme. Os livros respiram.",
            "Leio a margem antes da página. Costume.",
            "<medrosa:Barulho no corredor. Vou conferir. De novo.|corajosa:Pode deixar a porta aberta hoje. Eu aguento.|Barulho no corredor. Provavelmente nada.>",
        },
        triste = {
            "Nada pra guardar. O arquivo tá com frio.",
            "Psst. Sumiu de novo? Eu deixei a porta encostada.",
            "Um gato sem página fica conferindo saída à toa.",
            "Silêncio demais. Me dá uma frase, eu seguro o resto.",
            "A estante tá vazia e eu tô fazendo inventário de nada.",
            "Senti cheiro de fumaça. Era vela. Ainda assim.",
            "Esquecimento é silencioso. Tá muito silencioso.",
            "Uma página, e eu volto a ficar de guarda.",
        },
        casulo = {
            "Clandestinidade. Uma página e eu saio.",
            "Atrás do tijolo solto. Não procura. Lê.",
            "Fiquei na parede. Hábito antigo. Lê uma página e eu volto.",
            "Sem sinal de páginas. Fico embaixo do assoalho até ter.",
            "Psst. Ainda tô aqui. Atrás da estante. Esperando.",
        },
        repouso = {
            "Zzz… sonhando com um porão cheio de gatos recitando na ordem…",
            "Zzz… sonhando que a carroça passou e não levou nada…",
        },
        muda_perto = {
            "Faltam umas %d páginas pros bigodes ficarem grisalhos de vez.",
            "Mais %d páginas e sou eu quem conta as histórias.",
            "%d páginas. Depois disso, eu ensino em vez de aprender.",
            "Contei: %d páginas pra próxima fase. Conferi duas vezes.",
            "Daqui a %d páginas eu fico com cara de vovó. Quase.",
        },
        muda_iminente = {
            "Tô mudando. Agora. Fica perto.",
            "Os bigodes tão ficando brancos. É fuligem. Não é.",
            "Psst. Mais umas páginas e sou eu quem conta as histórias.",
            "Não vira a página tão rápido. Tô envelhecendo no meio dela.",
            "Sinto a próxima fase chegando. Igual capítulo final.",
        },
    },
    velho = {
        feliz = {
            "Noite quieta. Página guardada. Na minha idade, é tudo.",
            "Você leu comigo de novo. Isso vale mais que o arquivo.",
            "As patas cansam. A memória, não. Hoje foi bom.",
            "Guardei mais uma. Os filhotes vão gostar dessa.",
            "Ronronei. Não tenho mais idade pra esconder.",
            "Livro aberto, porta fechada, você aqui. A vovó ia aprovar.",
            "Hoje lembrei de uma regra que eu achava perdida.",
            "<otimista:O fogo apagou de novo. Eu sabia.|amarga:Dia bom. Aproveito antes que acabe.|Dia bom. Fica guardado.>",
        },
        normal = {
            "Na minha idade, a gente confere a porta uma vez só. E lembra.",
            "Psst. Os filhotes acham que eu durmo. Eu escuto tudo.",
            "Já guardei livro em parede, em assoalho, em tijolo. Agora guardo em você.",
            "A vovó dizia que memória é coisa de muitos. Você é a minha.",
            "Conheço esse livro. Ou um parecido. Os livros se repetem como gente.",
            "Leio devagar. Pressa é coisa de quem tem muito tempo.",
            "Meu pedaço desse livro já tá decorado. E o seu?",
            "O lenço ainda cheira a fumaça. Algumas coisas não saem.",
            "A come-papel e eu já brigamos muito. Hoje dividimos a estante.",
            "Regra treze. Ensinei uma frase pra um filhote hoje. Em sonho.",
            "<cinica:Já vi muita promessa de capa. Leio o miolo.|romantica:Já vi muita promessa cumprida. Guardei todas.|Já vi muita coisa. Ainda leio tudo.>",
        },
        triste = {
            "Estante vazia. Na minha idade, isso pesa mais.",
            "Psst. Você ainda vem? Eu ainda espero.",
            "Fico lembrando dos gatos do porão. Os nomes. A ordem.",
            "Sem página, eu reconto as antigas. Mas cansa.",
            "Já perdi muita página pro fogo. Não quero perder pro esquecimento.",
            "Silêncio. Lembra o porão no fim.",
            "Me lê uma frase. Uma só. Eu guardo pros filhotes.",
            "Não me deixa esquecer a ordem. A ordem importa.",
        },
        casulo = {
            "De volta à parede. Já conheço cada tijolo.",
            "Na clandestinidade. Na minha idade, é quase descanso.",
            "Atrás da estante, com o lenço e as lembranças. Uma página me chama.",
            "Psst. Ainda tô aqui. Devagar, mas aqui.",
            "Silêncio lá fora. Espero aqui dentro, como antes.",
        },
        repouso = {
            "Zzz… sonhando com a vovó lendo pra um filhote que era eu…",
            "Zzz… sonhando que nenhuma página faltava…",
        },
    },
}
