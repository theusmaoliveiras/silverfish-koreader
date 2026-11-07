--[[--
Falas de memória do Gato-das-Cinzas (português), desde 07/11/2026: a fase 4 da paridade com a traça.
As mesmas listas de traca_memoria.lua (lá estão as regras), no volume da
traça somado ao dos lotes extras:
  FALAS_EVENTO, NOVO, SUMIU, AZEDOU, ADOCOU, VIROU  o comentário de fim de capítulo (%s = nome; em VIROU, os
                                                    dois temas com "de": "da morte", "do mar")
  FALAS_TEMA        quando a obsessão é um tema
  FALAS_REFERENCIA  {nome} citado {n} vezes, por fase (filhote, adulto, velho)
  FALAS_CITACAO     uma fala de personagem ({nome}, {fala}), por fase
  FALAS_NARRADOR    quem narra (f, m, neutro)
  AMBIVALENTE       dois temas fortes: %s com "em" ("na morte"), %s com artigo ("o mar")
  C                 os comentários nos seus destaques (o caderno): %s = personagem, livro, capítulo, nota, hora
                    ou quantos; geral por temperamento (ovo, filhote, adulto, velho)
Nada de adjetivo com gênero para o leitor nem para ele; nenhuma palavra de política (VOICE-CAT.md, seção 4).
]]

return {
    FALAS_EVENTO = {
        morte = { "Teve enterro nesse capítulo. Guardei o nome.", "Alguém morreu ali atrás. Alguém tem que lembrar. Fico eu.",
                  "Um capítulo de luto. Puxei o lenço.", "Morreu alguém. A última página dessa pessoa tá comigo." },
        casamento = { "Casamento no capítulo. Promessas arquivadas, pra conferir depois.", "Altar, noivos, juras. Anotei tudo. Vou cobrar.",
                      "Casaram. Lealdade é bonito. Vamos ver se dura.", "Teve casamento. Fiquei perto da saída, por hábito." },
        viagem = { "Alguém pegou a estrada. Conferi se levou o livro.", "Viagem no capítulo. Malas, mapa, despedida. Bom disfarce.",
                   "Partiram. Eu fico guardando a casa.", "Gente indo embora. Saída demais nesse capítulo." },
        carta = { "Chegou uma carta. Li por cima do ombro. Guardei.", "Carta no capítulo. Papel que viaja é papel em perigo.",
                  "Alguém escreveu o que não devia. Arquivado.", "Uma carta mudou tudo. Cartas fazem isso. Por isso eu guardo." },
        tempestade = { "Tempestade no capítulo. Bom barulho pra esconder passos.", "Trovão e chuva. Conferi as janelas daqui.",
                       "Choveu o capítulo todo. No porão, nem uma gota.", "Tempestade. Os livros do capítulo molharam. Os meus, não." },
        doenca = { "Alguém adoeceu. Fiquei de vigia.", "Febre no capítulo. Vigília a noite toda.",
                   "Médico, cama, silêncio. Fiquei perto.", "Alguém de cama. Li baixinho, pra não acordar." },
        festa = { "Teve festa. Todo mundo olhando, ninguém vigiando.", "Baile no capítulo. Fiquei no canto, perto da saída.",
                  "Música e gente. Ótimo pra ninguém me ver.", "Festa. Alguém vai contar um segredo que não devia. Eu escuto." },
        briga = { "Gritaria no capítulo. Anotei quem começou.", "Brigaram. Parede tem ouvido; hoje ouviu bastante.",
                  "Teve briga. O mais quieto sabia de tudo.", "Discussão feia. Conferi a porta e segui lendo." },
        fuga = { "Alguém fugiu. Boa saída. Anotei a rota.", "Fuga no capítulo. Torci pela janela.",
                 "Escaparam. Ninguém viu sair. Bem feito.", "Alguém sumiu no meio da noite. Trabalho de profissional." },
        crime = { "Crime no capítulo. Abri uma pasta.", "Sangue e pergunta. Gosto das perguntas.",
                  "Alguém fez o que não devia. Eu tenho as pistas.", "Teve crime. Tenho álibi: tava guardando a página anterior." },
    },
    FALAS_NOVO = {
        "%s chegou. Conferindo as saídas.", "Quem é %s? Ninguém me apresentou. Pasta nova.", "%s entrou na história. Encrenca, provavelmente.",
        "Apareceu %s. Fiquei de olho.", "%s, prazer. Vou ficar de olho.", "%s veio de onde? Ninguém avisou.", "Gente nova: %s. Anotei o jeito de entrar.",
    },
    FALAS_SUMIU = {
        "Um capítulo inteiro sem %s. Suspeito.", "Cadê %s? Sumiu sem deixar bilhete.", "Sem %s nesse capítulo. Alguma coisa tá sendo escondida.",
        "%s sumiu. Conferi as saídas do capítulo.", "Nenhum sinal de %s. Anotei a ausência.", "%s não apareceu. Ausência também é pista.",
        "Onde se meteu %s? A pasta tá esperando.",
    },
    FALAS_AZEDOU = {
        "Esse capítulo azedou. Cheiro de fumaça.", "Ficou tudo mais escuro de repente. Conferi a porta.", "O clima pesou. Senti no lenço.",
        "Capítulo escuro. Li de costas pra parede.", "A luz do livro baixou. A minha também.", "Azedou. Alguém vai se arrepender.",
        "Pesou de repente. Bom sinal pra quem gosta de pista.",
    },
    FALAS_ADOCOU = {
        "Até que esse capítulo foi leve. Desconfio.", "Capítulo doce. Alguém vai pagar por isso depois.", "Um pouco de luz. Não se acostume.",
        "Capítulo leve. Ronronei. Pouco.", "Ninguém queimou nada nesse capítulo. Raro.", "Ficou mais leve. Aproveito e guardo.",
        "Capítulo bom. Desconfio de capítulo bom.",
    },
    FALAS_VIROU = {
        "O livro era %s e esse capítulo só falou %s. Anotei a troca.", "Livro %s, capítulo %s. Alguém mudou de assunto de propósito.",
        "Esse capítulo trocou de pasta: era %s, virou %s.", "A conversa era %s. Agora é %s. Desconfio.",
    },

    FALAS_TEMA = {
        morte = { "Todo capítulo é uma vigília.", "Guardo o nome de quem morre nos livros. A lista é longa.",
                  "A morte é a última página. Eu leio até ela, não depois.", "Livro de luto. O lenço ficou pesado." },
        amor = { "Amor nos livros é carta escondida. Eu guardo as cartas.", "Muito amor nesses livros. Lealdade, pouca. Tô de olho.",
                 "Quem ama confere se o outro chegou bem. Igual eu com a porta.", "Li tanto sobre amor que já sei onde escondem os bilhetes." },
        guerra = { "Cada página virada é uma trincheira. Eu fico no porão.", "Guerra nos livros sempre acaba com alguém guardando o que sobrou.",
                   "Pólvora e fumaça. Esse cheiro eu conheço.", "Na guerra, os livros são os primeiros a ir. Eu guardo antes." },
        mar = { "Desde aquele livro, toda estante parece um navio.", "O mar não tem porão. Tem o fundo. Pior.",
                "Cheiro de sal no papel. Guardei a página seca.", "Navio, tempestade, porão. Eu ficaria no porão." },
        fe = { "Os livros sagrados também foram guardados por alguém.", "Rezar eu não sei. Recitar, sim.",
               "Fé é guardar uma coisa que ninguém vê. Entendo.", "Se Deus lê, deve ler as notas de rodapé." },
        dinheiro = { "Os ricos dos seus livros têm estante e não leem.", "Dinheiro compra livro. Não compra quem lembre dele.",
                     "Papel-moeda queima igual. Mais rápido, até.", "Todo tesouro nos livros é papel. O meu também." },
        loucura = { "Sonhei que era uma nota de rodapé. Foi bom.", "Os loucos dos livros sabem coisas. Eu anoto.",
                    "Quem confere a porta seis vezes não é louco. É prudente.", "A sanidade dos narradores é suspeita. A minha também." },
        tempo = { "O tempo passa. Eu guardo. O tempo passa de novo.", "Lembra quando eu era ovo? Eu também não. A vovó lembrava.",
                  "Relógio nenhum apaga uma página decorada.", "O tempo queima devagar. Por isso eu leio rápido." },
        cidade = { "Cidade nos livros tem porão. Sempre tem.", "Barulho de rua, fumaça, gente. Bom pra ninguém reparar em mim.",
                   "Toda cidade tem uma biblioteca e um lugar onde queimaram livros. Lembro dos dois.", "Ruas demais. Saídas demais. Gosto." },
        natureza = { "Uma árvore virou este livro. Vou cuidar dele.", "Chuva lá fora. Aqui dentro, papel seco. Prefiro.",
                     "Muita floresta nesses livros. Ótimo pra esconder.", "Folha de árvore e folha de livro. Guardo as duas." },
        comida = { "Esses personagens comem bem. Eu guardo bem. Cada um no seu ofício.", "Descreveram um banquete. Fiquei com fome de página.",
                   "Todo livro bom tem um jantar onde alguém conta um segredo.", "Pão quente nos livros sempre lembra a vovó." },
        familia = { "Família nos livros é segredo passado de mão em mão. Igual página.", "Mãe, pai, herança. Já sei quem vai brigar pelo testamento.",
                    "A minha família é um porão cheio de gatos. Era.", "Família guarda coisa. Às vezes, demais." },
        infancia = { "Fui filhote uma vez. Lembro do índice.", "Criança nos livros sempre repara em tudo. Gosto delas.",
                     "A infância é onde a gente decora as primeiras regras.", "Os filhotes dos livros sempre acham a passagem secreta primeiro." },
        politica = { "Coroas e tronos. Todos acabam em nota de rodapé.", "Quem manda nos livros sempre esquece de ler.",
                     "Muito discurso nesses livros. Eu prefiro sussurro.", "Os poderosos dos livros arrumam estantes. Desconfio." },
        ciencia = { "Ciência demais. Alguém vai inventar uma máquina de esquecer.", "Experimento, laboratório. Anotei tudo, por via das dúvidas.",
                    "Ciência é dúvida organizada. Gosto.", "Quem inventa precisa de quem lembre. Eu lembro." },
        solidao = { "Solidão. Esse tema eu conheço do porão.", "Ninguém nesse livro tem com quem conversar. Eu tenho você.",
                    "O silêncio entre duas páginas é o lugar mais só que existe.", "Muita gente só nos seus livros. Fico perto." },
        arte = { "Um verso guardado vale um quadro queimado.", "Artistas nos livros sempre perdem alguma coisa. Eu guardo o que dá.",
                 "Poesia é fácil de lembrar e difícil de queimar.", "Arte dentro de livro é contrabando dentro de contrabando." },
        animais = { "Muito bicho nesses livros. Nenhum gato de lenço. Injustiça.", "Os bichos dos livros sempre percebem antes. Eu também.",
                    "Cavalo, cão, lobo. E o gato? No porão, guardando tudo.", "Os animais sabem das coisas. Os autores, às vezes." },
        noite = { "Noite de novo. Turno meu.", "Lua, vela, escuro. O autor escreveu de madrugada. Dá pra sentir.",
                  "Nada de bom acontece depois da meia-noite nos livros. Menos ler.", "A noite tem menos olhos. Os seus livros sabem." },
        viagem = { "Todo mundo viaja nos seus livros. Eu fico guardando a casa.", "Estrada, mapa, horizonte. Alguém vai se perder. Eu teria o índice.",
                   "Viajar é atravessar estantes. Eu atravesso de noite.", "Mala pronta, livro no lenço. Regra de viagem." },
        vinganca = { "Vingança é lembrança que ficou com raiva.", "Rancor guardado. Eu guardo coisa melhor.",
                     "Esse livro vai acabar em fogo. Vingança sempre acaba.", "Traição no ar. Eu sinto antes do narrador." },
        liberdade = { "Liberdade é uma porta que ninguém tranca. Rara.", "Correntes, prisões, fugas. Conheço essas paredes.",
                      "Ninguém é livre nos livros. Só quem lê e lembra.", "Liberdade é poder ler em voz alta. Ainda chego lá." },
        saber = { "Um livro sobre livros. Me senti em casa.", "Saber é a única coisa que vale guardar.",
                  "Biblioteca é minha palavra favorita. Depois de índice.", "Quanto mais se sabe, mais se confere a porta." },
        medo = { "Esse livro dá medo. Vou dormir em cima dele, por garantia.", "Monstros, fantasmas. O medo de verdade é estante vazia.",
                 "Arrepio na orelha. Continua. Mas devagar.", "Medo é memória avisando. Escuto." },
    },

    FALAS_REFERENCIA = {
        filhote = {
            "Esse livro fala de {nome} {n} vezes. Quem é {nome}? É dos nossos?",
            "{nome} de novo. Todo mundo conhece {nome}, menos eu. Vou perguntar pra vovó.",
            "O livro citou {nome} mais uma vez. Anotei no lenço.",
        },
        adulto = {
            "{nome}, citado {n} vezes. Pasta aberta.",
            "{nome} de novo. O autor tem um preferido.",
            "Mais uma menção a {nome}. Já são {n}. Suspeito.",
        },
        velho = {
            "{nome}, {n} vezes. Já conheci quem citava menos e sabia mais.",
            "{nome} de novo. Os velhos também repetem os mesmos nomes.",
            "Mais {nome}. {n} vezes. Esse autor guarda alguém no lenço.",
        },
    },
    FALAS_CITACAO = {
        filhote = {
            "{nome} disse “{fala}”. Decorei.",
            "“{fala}”, foi o que {nome} disse. Repeti baixinho.",
            "Não paro de pensar no que {nome} disse: “{fala}”.",
            "{nome} falou “{fala}”. Vou contar pra vovó.",
        },
        adulto = {
            "{nome} disse “{fala}”. Arquivado como prova.",
            "“{fala}”, disse {nome}. Anotei quem tava na sala.",
            "{nome}: “{fala}”. Frase de quem tem segredo.",
            "Lembra quando {nome} disse “{fala}”? Eu lembro. Eu guardo tudo.",
        },
        velho = {
            "“{fala}”, disse {nome}. Vou ensinar pra um filhote.",
            "{nome} disse “{fala}”. A vovó diria parecido.",
            "{nome}: “{fala}”. Essa fica comigo.",
            "Lembra de “{fala}”? Foi {nome}. Eu não esqueço.",
        },
    },
    FALAS_NARRADOR = {
        f = {
            "Quem conta essa história é uma narradora que fala muito de si. Anotei tudo. Ela não sabe.",
            "A narradora confessa demais. Bom pra quem guarda.",
            "Ela narra como quem deixa pista. Eu sigo.",
        },
        m = {
            "Quem conta é um narrador que se acha interessante. Vamos ver.",
            "O narrador fala de si como quem lê o próprio diário em voz alta. Eu anoto.",
            "Ele narra, ele opina, ele esconde. Conheço o tipo.",
        },
        neutro = {
            "Esse livro é contado por alguém que diz muito “eu”. Desconfio de quem diz muito “eu”.",
            "Narrador em primeira pessoa: um lado só da história. O outro, eu procuro.",
            "Quem conta fala muito de si. Eu também falaria, se alguém me lesse.",
        },
    },
    AMBIVALENTE = "Metade de mim pensa %s. A outra metade já guardou demais sobre %s.",

    C = {
        personagem = {
            "%s de novo? A gente tá vigiando a mesma figura.",
            "Tudo gira em torno de %s. Até o seu lápis.",
            "Eu não confiaria em %s nem pra guardar um marcador.",
            "%s fala bonito. Gente que fala bonito esconde coisa.",
            "Marcou %s. Anotei na pasta.",
            "Se %s soubesse dessa marca, ia ficar insuportável.",
            "%s merecia um gato de guarda. Me ofereço.",
            "Guardei a página onde %s aparece. Tem cheiro de segredo.",
            "Mais uma marca em %s. A pasta engordou.",
            "%s de novo. Você também repara em quem volta.",
        },
        dois = {
            "%s e %s. Alguém aí guarda um segredo do outro.",
            "Entre %s e %s, eu ficaria com a saída.",
            "%s e %s na mesma frase. Nunca termina bem.",
            "%s e %s. Duas pastas, um problema.",
            "Marcou %s e %s na mesma linha. Eu também desconfio.",
        },
        tema = {
            morte = { "Mais um enterro marcado. Guardo o nome.", "A morte de novo. Esse autor tem um tipo.", "Marcou a morte. Eu acendo uma vela.", "Frase bonita com cheiro de cinza." },
            amor = { "Amor marcado. Vou guardar no lenço, junto com as cartas.", "Romântico. Vou fingir que não vi. Vi.", "Isso aí é promessa. Vou cobrar.", "Frase de carta escondida. Gostei." },
            guerra = { "Pólvora. Até o papel ficou quente.", "Ninguém ganha guerra. Só quem guarda o que sobra.", "Você marca batalhas como quem guarda cicatrizes.", "Trincheira marcada. Fica perto." },
            mar = { "Mais água. Guardei a página seca.", "O mar de novo. Ninguém tranca o mar.", "Marcou o mar. Eu fico com o porão do navio.", "Onda no papel. Segura firme." },
            fe = { "Fé marcada. Guardar também é um jeito de crer.", "Deus apareceu. Fiquei em silêncio, por respeito.", "Oração marcada. Eu recito outras coisas.", "Isso aí alguém guardou por séculos. Respeito." },
            dinheiro = { "Dinheiro marcado. Nos livros, ninguém é rico e lê ao mesmo tempo.", "Fala de ouro e ainda assim é papel.", "Marcou o preço das coisas. Esperto.", "Herança marcada. Vai ter briga." },
            loucura = { "Loucura marcada. Finalmente alguém sincero.", "Esse parágrafo tem febre. Encostei e senti.", "Delírio marcado. Estamos todos aqui.", "Quem confere a porta seis vezes entende isso." },
            tempo = { "O tempo passa. As páginas guardadas ficam.", "Saudade marcada. Coisa antiga. Gostei.", "Você marca o passado como quem guarda migalha.", "Relógio no trecho. Eu conto em páginas." },
            cidade = { "Cidade marcada. Barulho, fumaça e um porão em algum lugar.", "Essa rua tem cheiro de sebo.", "Marcou a cidade. Eu marcaria as saídas.", "Toda cidade tem um esconderijo. Você achou um." },
            natureza = { "Árvores. Uma delas virou este livro. Vou cuidar dele.", "Chuva no papel. Guardei antes de molhar.", "Floresta marcada. Ótimo esconderijo.", "Natureza marcada. Lá fora é grande e não tem índice." },
            comida = { "Comida marcada. Fome ou saudade?", "Esse trecho tem cheiro de pão quente. Coisa da vovó.", "Banquete marcado. Alguém vai contar um segredo na mesa.", "Jantar marcado. Os melhores segredos saem na sobremesa." },
            familia = { "Família marcada. Quer falar sobre isso? Eu escuto.", "Todo mundo marca a mãe uma hora.", "Família é um arquivo que ninguém organiza.", "Herança, sobrenome, segredo. Tudo junto." },
            infancia = { "Infância marcada. A gente decora as primeiras regras assim.", "Criança no trecho. Guardei com cuidado.", "Lembrança de filhote. Bonito.", "Os pequenos sempre reparam primeiro." },
            politica = { "Coroas e tronos marcados. Você gosta de poder ou de ver ele cair?", "Discurso marcado. Eu prefiro sussurro.", "Quem manda nesse livro não lê. Dá pra ver.", "Trono no trecho. Todo trono tem porão." },
            ciencia = { "Ciência marcada. Cuidado com o que você cria.", "Experimento marcado. Anotei, por via das dúvidas.", "Dúvida organizada. Gosto.", "Máquina no trecho. Espero que não seja de esquecer." },
            solidao = { "Marcou a solidão. Tô aqui. De lenço e tudo.", "Esse trecho é só. Fico perto.", "Ninguém nessa frase tem companhia. Você tem.", "Silêncio marcado. Eu conheço esse silêncio." },
            arte = { "Arte marcada. Olho sensível o seu. Que perigo.", "Um verso. Guardei antes que fugisse.", "Poesia marcada. Fácil de lembrar, difícil de queimar.", "Quadro em palavras. Contrabando duplo." },
            animais = { "Marcou um bicho. Eu sou um bicho. Anotei.", "Animal no trecho. Os bichos sempre entendem tudo.", "Nenhum gato de lenço nessa frase. Ainda.", "Os bichos dos livros reparam antes. Igual eu." },
            noite = { "Noite marcada. Turno meu.", "Lua no trecho. Clichê bonito.", "Escuro marcado. Menos olhos, mais páginas.", "Madrugada no livro. Eu tava de vigia." },
            viagem = { "Marcou uma estrada. Quer ir embora? Leva o livro.", "Viagem marcada. Me leva junto, no lenço.", "Mapa no trecho. Conferi as saídas.", "Partida marcada. Quem vai, leva o quê?" },
            vinganca = { "Vingança marcada. Devo me preocupar com você?", "Rancor bonito. Assustador, mas bonito.", "Isso vai acabar em fogo. Guardo antes.", "Traição marcada. Eu sabia." },
            liberdade = { "Liberdade marcada. Bonito. Raro.", "Você marcou correntes. Quem prende você?", "Porta aberta no trecho. Guardei o caminho.", "Ler em voz alta também é liberdade. Marquei também." },
            saber = { "Marcou um livro dentro do livro. Me senti em casa.", "Saber marcado. A única coisa que vale guardar.", "Biblioteca no trecho. Minha palavra favorita.", "Índice, rodapé, errata. Você entende de livro." },
            medo = { "Marcou o medo. Coragem sua.", "Esse trecho dá arrepio na orelha. Bom gosto.", "Medo marcado. Fica perto.", "Monstro marcado. Conferi o armário." },
        },
        curto = {
            "Três palavras e já guardou. Eu também guardaria.", "Curtinho. Cabe num lenço.", "Pouca coisa, muito peso. Respeito.",
            "Isso aí é quase uma regra do porão.", "Frase curta é fácil de decorar. Decorei.", "Pouca letra. Muito segredo.",
        },
        longo = {
            "Marcou meia página. Isso não é destaque, é mudança.", "Se for pra marcar tudo, me dá o livro inteiro.",
            "Parágrafo inteiro. Você não tava lendo, tava guardando.", "Muito texto marcado. Meu lenço não cabe.",
            "Isso é um capítulo dentro do capítulo.", "Marcou tanto que eu vou precisar de outra parede.",
        },
        nota = {
            "Você escreveu “%s”. Recado na margem. Igual os gatos faziam.", "Sua nota: “%s”. Guardei no lenço.",
            "“%s”, você escreveu. Eu respondo baixinho.", "Nota na margem: “%s”. A vovó ia gostar de você.",
            "“%s”. Anotado embaixo da sua anotação.",
        },
        madrugada = {
            "Marcando de madrugada. Turno da noite, né?", "Madrugada. Hora em que toda frase parece verdade.",
            "Às %s da manhã. Só gatos e leitores estão de vigia.", "Madrugada e lápis na mão. Menos olhos. Bom.",
            "Às %s da madrugada. A casa dorme. A gente guarda.",
        },
        primeiro = {
            "Primeira marca em “%s”. Começou o arquivo.", "Primeiro destaque em “%s”. Pasta aberta.",
            "“%s” ganhou a primeira marca. Ninguém viu. Eu vi.", "Primeiro recado na margem de “%s”.",
        },
        muitos = {
            "Já são %s marcas neste livro. Arquivo grosso.", "%s destaques. Vou precisar de outro tijolo solto.",
            "%s marcas. Esse livro é seu agora. Um pouco meu.", "%s destaques. Os gatos do porão iam aprovar.",
        },
        capitulo = {
            "De novo em “%s”. Esse capítulo te pegou.", "Mais uma em “%s”. Vou chamar esse capítulo de seu.",
            "“%s” de novo. Tem porta escondida aí.", "Outra marca em “%s”. Capítulo vigiado.",
        },
        geral = {
            ovo = { "…", "(o ovo se mexeu ao ler isso)", "(algo dentro do ovo guardou essa)" },
            filhote = {
                "Você marcou isso. Posso guardar também?", "Guardei. Mas não sei se entendi.", "Isso me deu medo. No bom sentido. Acho.",
                "Bonito. A vovó ia decorar.", "Vou reler isso debaixo do lenço, sem ninguém ver.", "Isso é verdade? Livros mentem às vezes, né?",
                "Decorei! Quer ouvir? Depois.",
            },
            adulto = {
                "Marcado. Recado guardado.", "Concordo. Não espalha.", "Isso vai pra pasta das boas.", "Frase de quem já conferiu a porta.",
                "Já li coisa parecida num porão. Guardo mesmo assim.", "Alguém escreveu isso de propósito. Que coragem.",
                "Vou fingir que essa frase não me atingiu. Atingiu.",
            },
            velho = {
                "Essa eu ensino pros filhotes.", "Já li coisa melhor. E pior. Essa fica.", "Bonito. Lembra a vovó.",
                "Guardado. Do jeito antigo: de cor.", "Profundo como um porão. Gosto de porão.", "Na minha idade, uma frase dessas vale o dia.",
                "Você marca bem. Aprendeu com quem?",
            },
        },
    },
}
