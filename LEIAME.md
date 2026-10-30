# Traça (Silverfish)

**Mora no seu leitor digital. Come o que você lê. Julga o seu gosto.**

*In English: [README.md](README.md).*

![A mesma traça crescendo: ninfa, jovem, adulta, anciã](media/growing-up.png)

A Traça nasce de um ovo depois das suas primeiras páginas. Ela só come páginas lidas de verdade, cresce em quatro fases e, aos poucos, vira o que você lê. Quem lê ficção científica cria uma futurista desconfiada. Quem lê sátira cria uma crítica que revira os olhos para qualquer prefácio.

Ela funciona no seu leitor **sem IA e sem internet**. Tudo o que ela diz é montado no próprio aparelho a partir do que você lê, e a sua leitura nunca sai dele.

![Duas traças, uma alimentada com ficção científica e outra com sátira](media/two-readers.png)

## O que ela faz

- **Come o que você lê.** Cada página lida por alguns segundos vira comida; folhear não conta. Se você para de ler, ela fica com fome, depois ranzinza, e acaba se escondendo na lombada até você voltar.
- **Cresce.** Ovo, ninfa, jovem, adulta, anciã. Depois de umas 2.000 páginas ela bota um ovo e começa uma nova geração, e a antiga entra para a **linhagem**.
- **Vira o que você lê.** Ela absorve o mundo dos seus livros: são 16 influências literárias, de ficção científica, sátira e horror a romance, mistério, poesia e filosofia. A personalidade também segue os seus hábitos: ler de madrugada faz uma notívaga, livro triste a deixa amarga, aventura a deixa corajosa.
- **Percebe o livro.** Conhece os personagens, as palavras, os lugares e o que acontece em cada capítulo. Comenta o capítulo, lembra o que os personagens disseram e faz uma resenha de cada livro que você termina.
- **Escreve um diário** dos seus dias de leitura e guarda um **caderno** com os seus destaques.
- **Sonha.** Ligue a tela de descanso dela e, quando o aparelho dormir, você vai vê-la dormindo, sonhando com o que você leu. Cada fase tem o seu desenho dormindo.
- **Conquistas e uma estante** com todos os livros que vocês terminaram juntos.
- **Português e inglês.** Ela segue o idioma do KOReader, ou você escolhe.

![A mesma ideia, livros diferentes](media/same-thought.png)

## Instalar

1. Baixe o `silverfish-v1.0.0.zip` em [Releases](../../releases) e descompacte. Dentro há uma pasta chamada `silverfish.koplugin`.
2. Conecte o aparelho ao computador e copie `silverfish.koplugin` para a pasta `plugins` do KOReader:
   - **Kindle:** `koreader/plugins/`
   - **Kobo:** `.adds/koreader/plugins/`
   - **Android:** `koreader/plugins/`, na memória interna
   - **Outros aparelhos:** a pasta `plugins` dentro da pasta do KOReader
3. Feche e abra o KOReader.

**Se você testou o beta** (uma pasta chamada `traca.koplugin`), apague essa pasta antes de copiar a nova, e nunca deixe as duas. A sua traça continua a mesma, porque o progresso dela fica em outro arquivo.

## Usar

- **Só leia.** O ovo choca depois de algumas páginas.
- **Para vê-la:** abra o menu de ferramentas e toque em **Traça**. Na tela de boas-vindas você também pode escolher abri-la quando o KOReader iniciar, ou segurando o dedo no canto superior direito.
- **Na tela dela** há um menu com o diário, o caderno, as conquistas e a linhagem.
- **Toque nela** para fazer carinho. **Segure o dedo nela** para as opções: tela de descanso ligada ou desligada, e idioma.
- **Opcional:** com o plugin Simple UI instalado, ela aparece num cartão na tela inicial.

![Quando o aparelho dorme, ela sonha](media/dreams.png)

## Os seus dados

Tudo fica no seu aparelho, em `koreader/settings/traca.lua`: os títulos e autores dos livros que você leu, as páginas e os horários de leitura, o diário dela, algumas falas de personagens que ela guardou e o caminho do último livro que você abriu. A Traça nunca se conecta à internet e nunca manda nada para lugar nenhum.

## Atualizar

Troque a pasta `silverfish.koplugin` pela nova. A sua traça e o diário dela continuam.

## Desinstalar

1. Se a tela de descanso dela estiver ligada, desligue antes: segure o dedo na Traça e escolha **Tela de descanso: desligada**.
2. Apague `koreader/plugins/silverfish.koplugin`.
3. Para apagar também a Traça e o diário dela, apague o arquivo `koreader/settings/traca.lua` e a pasta `koreader/traca`.

## Compatibilidade

Testada no KOReader 2026.07.1, num Kindle Paperwhite 11. Deve funcionar em qualquer aparelho com KOReader (Kobo, PocketBook, Android), mas eles ainda não foram testados. Se você usar num deles, conte como foi em [Issues](../../issues).

A Traça nunca trava a sua leitura. Se algo der errado, ela avisa que tropeçou e fica quieta até você reiniciar o KOReader. Nesse caso, abra uma issue e mande junto o arquivo `koreader/crash.log`.

## Limites conhecidos

- Em livros sem sumário, ela conta um capítulo a cada 25 páginas.
- Ela percebe o livro pelas palavras; não entende a história como uma pessoa. Às vezes um comentário sobre o capítulo erra o assunto.

## Licença

- **Código:** [GPL-3.0](LICENSE).
- **A personagem Traça, os desenhos em pixel e as falas escritas** (os arquivos de sprites, os ícones e os bancos de frases em `traca_banco/`): [CC BY-NC-SA 4.0](LICENSE-ART.md). Você pode compartilhar e adaptar dando crédito e mantendo a mesma licença, mas não para uso comercial.
- Os dados de terceiros e a fonte Silkscreen têm as próprias licenças: veja [CREDITS.md](CREDITS.md).

## Créditos

Feito por Matheus Oliveira, com o Claude como parceiro de programação.
