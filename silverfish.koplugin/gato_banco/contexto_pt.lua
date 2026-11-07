--[[--
Gato-das-Cinzas: falas com dados da sua leitura (português). Mesmo formato e gatilhos de traca_contexto.lua
(a traça), por fase do gato: filhote, adulto, velho.
No volume da traça. Voz: traca/cartoes/VOICE-CAT.md.

Brechas: {hora} ("2h13"), {n} (páginas ou dias), {livro}, {pct} ("93%"); <polo:…|…> escolhe pelo jeito;
{cheiro|…} é palavra do mundo do livro (traca_voz.lua). Nada de gênero para o leitor nem para o gato.
]]

return {
    madrugada = {
        filhote = {
            "São {hora}. A vó dizia que é a hora mais segura. Ela também dizia pra dormir.",
            "{hora}! Psst. A casa inteira dormindo e a gente aqui. Que emoção.",
            "Às {hora} o escuro fica maior. Fica perto de mim.",
            "{hora}. <noturna:Meu horário preferido!|Tô com sono, mas não vou perder esse capítulo.>",
            "Lendo às {hora}. Se perguntarem, a gente tava contando estrelas.",
        },
        adulto = {
            "{hora}. Menos olhos. Bom turno.",
            "São {hora}. Porta trancada, luz baixa. Continua.",
            "{hora}. A hora em que os porões trabalhavam.",
            "Leitura às {hora}. <medrosa:Cada estalo eu confiro.|noturna:É assim que se faz.|Ninguém viu. Ótimo.>",
            "{hora} e um livro aberto. Nada mais clandestino que isso.",
        },
        velho = {
            "{hora}. A vó recitava a essa hora. Agora sou eu que escuto.",
            "São {hora}. Já perdi a conta das madrugadas. Essa eu guardo.",
            "{hora}. Bigode branco e você lendo. Bom par.",
            "{hora}. Nessa hora os livros falam mais baixo. Eu também.",
            "Às {hora} eu lembro dos porões. Sem fumaça, pra variar.",
        },
    },
    recorde = {
        filhote = {
            "{n} páginas hoje! Recorde! A vó ia contar pro porão inteiro.",
            "Nunca guardei tanto num dia: {n} páginas. Meu lenço não fecha.",
            "Recorde de {n} páginas! Minhas patinhas tão tremendo.",
            "{n} páginas! É muito? Parece muito. Que orgulho.",
            "{n} páginas num dia. Vou recitar todas. Em ordem. Talvez amanhã.",
        },
        adulto = {
            "{n} páginas. Recorde. Arquivado com data e hora.",
            "Novo recorde: {n} páginas. Alguém tá com pressa. Ou fugindo.",
            "{n} páginas hoje. Nunca carregamos tanto num dia só.",
            "Recorde de {n}. Não comemora alto. Paredes.",
            "{n} páginas. Operação grande. Ninguém percebeu.",
        },
        velho = {
            "{n} páginas. Recorde. Na minha idade, isso é um evento.",
            "{n} páginas hoje. Mais do que muito porão guardou numa semana.",
            "Recorde: {n}. Vou contar isso pros filhotes. Do meu jeito, que muda.",
            "{n} páginas. Já vi muita noite. Nenhuma assim.",
            "Novo recorde de {n} páginas. As patas reclamam; o resto agradece.",
        },
    },
    maratona = {
        filhote = {
            "{n} páginas hoje! Você não cansa? Eu canso só de guardar.",
            "Já foram {n} páginas. Meu esconderijo tá transbordando.",
            "{n} páginas… <corajosa:Bora mais um capítulo!|posso descansar no lenço um pouquinho?>",
            "{n} páginas! A vó dizia: uma de cada vez. A gente fez várias de cada vez.",
            "Tanta página hoje: {n}. Vou ter que dormir em cima delas.",
        },
        adulto = {
            "{n} páginas. Bom dia de trabalho.",
            "{n} páginas hoje. Pisque. Depois continua.",
            "Já são {n}. A Regra 12 tá de olho na gente.",
            "{n} páginas. <erudita:Até um dicionário pediria pausa.|Isso não é leitura, é mudança.>",
            "{n} páginas e contando. O arquivo agradece. A coluna, não.",
        },
        velho = {
            "{n} páginas hoje. As patas velhas protestam. Eu ignoro.",
            "{n} páginas. Lembro de noites assim. Eram mais perigosas.",
            "Já são {n}. Bebe água. Eu espero.",
            "{n} páginas. Deixa um pouco pro amanhã. Amanhã também precisa.",
            "{n} páginas hoje. Isso é um resgate, não uma leitura.",
        },
    },
    sumiu = {
        filhote = {
            "{n} dias! Achei que tinham te levado. Conferi a porta mil vezes.",
            "Você sumiu {n} dias. Guardei seu lugar. E a página.",
            "{n} dias sem você. <medrosa:Ouvi cada barulho da casa.|Fiquei recitando o índice pra passar o tempo.>",
            "Voltou! {n} dias. Não chorei. Quase.",
            "{n} dias. A vó dizia que gente boa sempre volta. Ela tinha razão.",
        },
        adulto = {
            "{n} dias. Não vou perguntar onde. Só fecha a porta.",
            "{n} dias fora. O porão ficou quieto demais.",
            "Você sumiu {n} dias. Mantive as saídas livres.",
            "{n} dias. <romantica:Senti falta. Pronto, falei.|Anotado. Sem perguntas.>",
            "De volta depois de {n} dias. Bom. Qual a senha?",
        },
        velho = {
            "{n} dias. Na minha idade, a gente conta cada um.",
            "{n} dias. Guardei tudo direitinho. Quase tudo.",
            "Você voltou depois de {n} dias. Eu sabia. Esperei assim mesmo.",
            "{n} dias sem leitura. Os livros notaram. Eu também.",
            "{n} dias. Já guardei sala vazia antes. Prefiro com você.",
        },
    },
    tarde = {
        filhote = {
            "Já são {hora}. Só mais um capítulo? A vó dizia isso também.",
            "{hora}. <noturna:Tô sem sono nenhum!|Meus olhos tão pesando, mas continua.>",
            "Ler às {hora} é tipo segredo. Baixinho.",
            "{hora}. A casa apagou as luzes. A gente não.",
            "São {hora}. Me cobre com o lenço?",
        },
        adulto = {
            "{hora}. Hora boa pra trabalho quieto.",
            "São {hora}. Mais um capítulo e conferimos a porta.",
            "{hora}. As melhores páginas saem depois das dez.",
            "{hora}. Você lê, eu vigio. Combinado.",
            "São {hora}. <medrosa:Escuto até o relógio.|Silêncio bom.>",
        },
        velho = {
            "{hora}. A noite é longa. Já tive mais longas.",
            "São {hora}. Os velhos porões acordavam agora.",
            "{hora}. Lê. Eu cochilo de olho aberto.",
            "{hora}. Livro aberto e luz baixa. Do jeito antigo.",
            "São {hora}. Me conta o capítulo amanhã. Hoje eu escuto.",
        },
    },
    cedo = {
        filhote = {
            "{hora}! O sol acordou e você também. Eu quase.",
            "Bom dia! Às {hora} as páginas têm cheiro de pão.",
            "{hora}. Lendo cedo! A vó nunca deixava. Shh.",
            "São {hora}. <diurna:Meu horário!|Ainda tô com sono, mas tá bom.>",
            "{hora}. Ninguém de pé. Só a gente e o livro.",
        },
        adulto = {
            "{hora}. Turno do dia. Porta mais fácil de vigiar.",
            "São {hora}. Leitura antes do mundo começar a falar.",
            "{hora}. Cedo demais pra perigo. Ou não.",
            "{hora}. Café pra você, página pra mim.",
            "Bom dia. {hora}. Nada a esconder, por enquanto.",
        },
        velho = {
            "{hora}. Olho velho gosta de luz da manhã.",
            "São {hora}. Antes, a gente só lia no escuro.",
            "{hora}. Que bom ler sem precisar se esconder.",
            "Bom dia. {hora}. A estante ainda tá fria.",
            "{hora}. Manhã de livro. A vó não acreditaria.",
        },
    },
    sessao = {
        filhote = {
            "{n} páginas sem parar! Suas patas tão bem?",
            "{n} seguidas! Minha cabeça tá rodando.",
            "{n} páginas de uma vez. Nem conferi a porta.",
            "Já são {n} sem pausa. A vó ia mandar beber água.",
            "{n} páginas seguidas. Tô guardando o mais rápido que dá.",
        },
        adulto = {
            "{n} páginas sem pausa. Livro bom ou fuga?",
            "{n} seguidas. Respeito. Agora pisque.",
            "{n} páginas na mesma sessão. Operação limpa.",
            "{n} páginas sem levantar. Eu levantaria. Por segurança.",
            "{n} seguidas. <corajosa:Continua.|Pausa curta. Confere a porta. Volta.>",
        },
        velho = {
            "{n} páginas sem parar. Eu fazia isso. Faz tempo.",
            "{n} seguidas. Levanta, estica. O livro espera.",
            "{n} páginas de uma vez. Lembro dessa fome.",
            "{n} páginas. Devagar também se guarda.",
            "{n} sem pausa. Bom. Mas respira.",
        },
    },
    sequencia = {
        filhote = {
            "{n} dias seguidos! Já sei a hora que você chega.",
            "Dia {n} seguido! A vó chamaria de disciplina.",
            "{n} dias! <romantica:A gente virou uma dupla de verdade.|Virou rotina. Gosto de rotina.>",
            "{n} dias sem falhar. Meu lenço tá cheio.",
            "Dia {n}. Tô contando cada um.",
        },
        adulto = {
            "{n} dias seguidos. Disciplina de porão.",
            "Dia {n}. Ninguém quebra a corrente.",
            "{n} dias. Constância é a melhor defesa.",
            "Dia {n} seguido. Anotado.",
            "{n} dias. É assim que os livros sobrevivem.",
        },
        velho = {
            "{n} dias seguidos. Isso é passar adiante.",
            "Dia {n}. O porão ia ter orgulho.",
            "{n} dias. Já vi muita gente desistir no terceiro.",
            "{n} dias seguidos. Bom. A memória gosta de hábito.",
            "Dia {n}. Guardar todo dia. Era assim que a gente fazia.",
        },
    },
    bom_dia = {
        filhote = {
            "{n} páginas hoje! Tô crescendo, dá pra sentir.",
            "Já guardei {n} páginas hoje e ainda cabe mais.",
            "{n} páginas! A vó ia gostar desse dia.",
            "{n} páginas hoje. Uma boa pilha.",
            "{n} hoje. Meu esconderijo agradece.",
        },
        adulto = {
            "{n} páginas hoje. Decente.",
            "{n}. Dia não desperdiçado.",
            "{n} páginas hoje. Arquivo em dia.",
            "{n} páginas. Nada queimou. Bom dia.",
            "Hoje: {n} páginas. Relatório positivo.",
        },
        velho = {
            "{n} páginas hoje. Um dia bom pra guardar.",
            "{n} páginas. Já é muito, pra quem lembra das cinzas.",
            "{n} hoje. Bom. Sem pressa.",
            "{n} páginas. Os filhotes iam gostar desse pedaço.",
            "{n} páginas hoje. O suficiente pra um gato dormir em paz.",
        },
    },
    nada_hoje = {
        filhote = {
            "Hoje ainda nada. Nem uma linha. Tô de olho no livro.",
            "Nenhuma página hoje… você tá bem?",
            "Ainda nada hoje. A vó dizia: esquecer é silencioso.",
            "O livro tá fechado o dia todo. Ele tá bem?",
            "Zero hoje. Vou guardar uma lembrança no lugar.",
        },
        adulto = {
            "Nenhuma página hoje. A estante notou.",
            "Hoje: zero. Não gosto de silêncio.",
            "Nada hoje. Esquecer não faz barulho. Lembra.",
            "Dia vazio. Fico de vigia mesmo assim.",
            "Nenhuma página hoje. Não vou cobrar. Muito.",
        },
        velho = {
            "Nada hoje. Na minha idade, cada dia conta.",
            "Nenhuma página hoje. Já vi isso começar assim.",
            "Hoje não. Tudo bem. Amanhã eu espero.",
            "O livro dormiu o dia todo. Eu também, quase.",
            "Zero hoje. Guarda um parágrafo pra mim amanhã.",
        },
    },
    reta_final = {
        filhote = {
            "{pct} de “{livro}”! Quase no fim. Tô com o coração na boca.",
            "Falta pouco de “{livro}”. Vou guardar devagar.",
            "{pct}! O fim de “{livro}” tá ali. Não conta!",
            "Reta final de “{livro}”. Segura minha pata.",
            "{pct} de “{livro}”. E se acabar mal? E se acabar bem?",
        },
        adulto = {
            "{pct} de “{livro}”. Não dá mais pro autor escapar.",
            "Reta final de “{livro}”. Saídas conferidas.",
            "{pct}. “{livro}” quase passou inteiro.",
            "Últimas páginas de “{livro}”. Atenção dobrada.",
            "{pct} de “{livro}”. É aqui que escondem as surpresas.",
        },
        velho = {
            "{pct} de “{livro}”. Os fins sempre me pegam.",
            "Quase no fim de “{livro}”. Lê devagar. Fim não volta.",
            "{pct}. Daqui a pouco “{livro}” vira lembrança.",
            "Reta final de “{livro}”. Já guardei muito fim. Esse também.",
            "{pct} de “{livro}”. Prepara o lenço. O meu tá pronto.",
        },
    },
    metade = {
        filhote = {
            "Metade de “{livro}”! Agora fica bom, né?",
            "Já guardei metade de “{livro}”. A outra metade tá me olhando.",
            "Meio de “{livro}”! A vó dizia que o meio é onde mora o segredo.",
        },
        adulto = {
            "Metade de “{livro}”. Agora é que eles mostram as cartas.",
            "Meio de “{livro}”. Ponto de controle.",
            "Metade de “{livro}”. Metade guardada, metade por guardar.",
        },
        velho = {
            "Metade de “{livro}”. O meio é onde os livros tropeçam. Ou voam.",
            "Meio de “{livro}”. Já aprendi a não julgar antes.",
            "Metade de “{livro}”. Bom lugar pra respirar.",
        },
    },
    comeco = {
        filhote = {
            "Começando “{livro}”! Cheira a {cheiro|papel novo}.",
            "Primeiras páginas de “{livro}”. Tô de olho em todo mundo.",
            "“{livro}” começou! De quem eu gosto? Ainda não sei.",
        },
        adulto = {
            "Começo de “{livro}”. Primeira página duas vezes, como manda a Regra 4.",
            "Primeiras páginas de “{livro}”. Mapeando as saídas.",
            "“{livro}” no começo. Ninguém é de confiança ainda.",
        },
        velho = {
            "Começo de “{livro}”. Todo livro novo me lembra o primeiro.",
            "Primeiras páginas de “{livro}”. Sem pressa. Ele vai se mostrar.",
            "“{livro}”. Um começo. Gosto de começos.",
        },
    },
    fim_de_semana = {
        filhote = {
            "Fim de semana! Dia inteiro de livro?",
            "Fim de semana de leitura. O melhor tipo.",
            "Fim de semana sem pressa. Só papel e lenço.",
        },
        adulto = {
            "Fim de semana. O mundo sai; a gente guarda.",
            "Folga do mundo. Plantão do porão.",
            "Fim de semana lendo. Escolha certa.",
        },
        velho = {
            "Fim de semana. Antes, era quando mais queimavam. Hoje a gente lê.",
            "Folga com livro. Do jeito que deve ser.",
            "Fim de semana com livro. Os filhotes deviam aprender isso.",
        },
    },
}
