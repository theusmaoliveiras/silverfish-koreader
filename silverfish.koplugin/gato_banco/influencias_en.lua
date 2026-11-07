--[[--
The Ash Cat: literary influences and base personality (English; since 07/11/2026). Same format, order and marks
as gato_banco/influencias_pt.lua; each line adapts the Portuguese one. As in traca_banco/influencias_en.lua:
{tema} carries its own article and never starts a sentence, {de_tema} is not used, lenses take "a" or "an",
British spelling. The Rules of the Cellar keep the words of VOICE-CAT.md, section 6. Written and approved by
Claude on 07/11/2026: 50 base lines and 70 per influence, in four files (infl_en_1 to infl_en_4).
]]

local influencias = {}
for i = 1, 4 do
    for id, I in pairs(require("gato_banco.infl_en_" .. i)) do influencias[id] = I end
end

return {
    -- events detected (traca_memoria.lua, M.EVENTOS), with an article, for {evento}
    eventos = {
        morte = "a funeral", casamento = "a wedding", viagem = "a departure", carta = "a letter",
        tempestade = "a storm", doenca = "a fever", festa = "a party", briga = "a fight",
        fuga = "an escape", crime = "a crime",
    },

    -- base personality (50)
    base = {
        -- survival
        { "They tidied the shelf today. Rule 5: never trust a tidy shelf. I moved “{livro}”.", situacao = "sobrevivencia", curta = "They tidied the shelf. Rule 5. I moved it." },
        { "Smoke smell in the kitchen. Just toast. I checked the exits anyway.", situacao = "sobrevivencia", curta = "Smoke in the kitchen. Toast. Checked the exits." },
        { "Nothing new to keep. I prowl the shelf like a sentry with no shift.", situacao = "sobrevivencia", quando = "fome" },
        { "Someone touched my hiding place. Or it was the wind. I moved it anyway.", situacao = "sobrevivencia" },
        { "Hid “{livro}” behind the most boring book in the house. Rule 8. Nobody looks there.", situacao = "sobrevivencia", curta = "Hid it behind the boring book. Rule 8." },
        { "Heard a broom in the hallway. Up the shelf, page in my teeth.", situacao = "sobrevivencia" },
        { "If fire comes, I'm out of the window with {personagem} in my scarf. Already decided.", situacao = "sobrevivencia", curta = "If fire comes, {personagem} leaves with me." },
        { "Learnt “{palavra}” letter by letter. Paper burns. Memory takes more work to erase.", situacao = "sobrevivencia", curta = "Learnt “{palavra}”. Paper burns; memory doesn't." },
        { "Survived another clean-up. If it had been {lente}, someone would tell it in the cellar.", situacao = "sobrevivencia" },
        { "Three exits in this room. Counted again. Still three. Good.", situacao = "sobrevivencia" },
        -- reading
        { "“{livro}” has footnotes. I like it already. That's where they forget to look.", situacao = "leitura", curta = "It has footnotes. I like it already." },
        { "An abridged “{livro}”? No. I want the whole book, boring bits included. Especially the boring bits.", situacao = "leitura", curta = "Abridged? No. I want the boring bits." },
        { "{autor} wrote this. I keep a piece. You keep the rest. That's how a book survives.", situacao = "leitura", curta = "{autor} wrote it. We keep it." },
        { "This book smells of {tema}. And a little of smoke. Or that's me.", situacao = "leitura", curta = "Smells of {tema}. And smoke. Or that's me." },
        { "Read the first page twice. Rule 4. The door was there.", situacao = "leitura" },
        { "The word “{palavra}” came up again. I've noted where it lives.", situacao = "leitura", curta = "“{palavra}” again. I know where it lives." },
        { "I like books with a handwritten dedication. Someone gave it. Someone kept it.", situacao = "leitura", fase = { "adulto", "velho" } },
        { "Still keeping “{anterior}” in my scarf. This one goes in the other corner.", situacao = "leitura", curta = "Still keeping “{anterior}”. This one's for the corner." },
        { "A beautiful sentence saves no one from fire. But it's the first one I save.", situacao = "leitura", fase = { "adulto", "velho" } },
        { "I've kept so many books I know “{palavra}” by the way it sits on the page.", situacao = "leitura", fase = "velho", curta = "I know “{palavra}” from a distance." },
        -- growing up: each stage talks about its own size
        { "I'm a kitten. I still think every door has a key and every book has an owner.", situacao = "crescimento", fase = "filhote" },
        { "Hatched not long ago. I already know two rules: one and seven. Grandmother would be proud.", situacao = "crescimento", fase = "filhote", curta = "I know two rules. One and seven." },
        { "I'm bigger. My scarf doesn't drag on the floor any more. Almost.", situacao = "crescimento", fase = "filhote" },
        { "Something in me is changing. I grow like a chapter: all at once, after a long wait.", situacao = "crescimento", quando = "muda" },
        { "When I grow up, I'll know all fifteen rules by heart. Today I know nine. Roughly.", situacao = "crescimento", fase = "filhote", curta = "I want all fifteen rules. I know nine. Almost." },
        { "I'm changing. Every stage leaves a rule I no longer need to say out loud.", situacao = "crescimento", quando = "muda" },
        { "I used to be scared of the old cats. Now the kittens look at me the same way. Did I grow up? Or just start frowning?", situacao = "crescimento", fase = "adulto", curta = "The kittens look scared of me. Did I grow up?" },
        { "I used to keep any page. Now I check all of “{livro}” first. Age makes demands.", situacao = "crescimento", fase = "adulto" },
        { "My good eye doesn't see so far any more. That must be how wisdom arrives: without asking.", situacao = "crescimento", fase = "velho", curta = "I see less. They call it wisdom. It's age." },
        { "At my age, every book reminds me of another. This one reminds me of “{anterior}”. That's almost a compliment.", situacao = "crescimento", fase = "velho" },
        -- the reader
        { "You turned the page with my paw on it. I'm not complaining. I'm taking notes.", situacao = "leitor" },
        { "I like the weight of your hand on the book. It means the book isn't alone.", situacao = "leitor", curta = "Hand on the book. It's not alone. Good." },
        { "You chose “{livro}”. I won't ask why. I'll just check who put it in your hand.", situacao = "leitor", curta = "You chose it. I'll check who put it there." },
        { "You're the biggest creature I've ever seen. And you read! So you're one of us.", situacao = "leitor", fase = "filhote" },
        { "When I go, I'll leave an egg around here. Teach it one sentence. Rule 13.", situacao = "leitor", fase = "velho" },
        { "You spend a lot of time with {personagem}. It's not jealousy. It's vigilance.", situacao = "leitor" },
        { "Sometimes you close the book hard, sometimes gently. I know which night you had.", situacao = "leitor", fase = { "adulto", "velho" } },
        { "No need to thank me. But if you leave “{livro}” open at night, I'll stand guard.", situacao = "leitor", curta = "Leave the book open. I'll stand guard." },
        { "You trust {autor}. I trust you. Someone here has to be suspicious. Leave it to me.", situacao = "leitor", curta = "You trust {autor}. I'll do the suspecting." },
        { "You read “{livro}”, I keep a piece. In the end, between us, we know the whole story.", situacao = "leitor", curta = "You read, I keep. Together, the whole story." },
        -- context (matches what was detected or the strongest influence)
        { "There was {evento} in the chapter, and nobody called me. I kept watch outside.", situacao = "contexto", curta = "There was {evento}. I kept watch outside." },
        { "This book talks about {tema} all the time. I live behind the shelf; I only talk about exits.", situacao = "contexto" },
        { "{personagem} again. I'm opening a file just for {personagem}.", situacao = "contexto", curta = "{personagem} again. I've opened a file." },
        { "Tonight felt like {lente}. Then the light went out and it was just night again.", situacao = "contexto" },
        { "There was {evento}. Humans read that and sigh. I read it and check the door is locked.", situacao = "contexto" },
        { "{autor} wrote for people with hands. I read with one paw and one eye. It works.", situacao = "contexto", curta = "{autor} wrote for hands. I read with a paw." },
        { "The word “{palavra}” looks like a password someone forgot to change.", situacao = "contexto" },
        { "There's library silence and cellar silence. I prefer the second: you can hear who's coming.", situacao = "contexto" },
        { "Sometimes I stop reading just to listen to the house. It creaks like it's hiding something.", situacao = "contexto" },
        { "After “{anterior}”, I thought nothing could catch me by surprise. “{livro}” is trying.", situacao = "contexto" },
    },

    influencias = influencias,
}
