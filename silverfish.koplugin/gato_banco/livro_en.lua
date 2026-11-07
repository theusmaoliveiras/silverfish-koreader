--[[--
The Ash Cat's lines about what you're reading (English), since 07/11/2026: phase 5 of the parity with the
silverfish. Same lists, order and marks as
gato_banco/livro_pt.lua.
]]

return {
    livro = {
        filhote = {
            "“%s” is big. I'll keep a piece a day.",
            "Still keeping “%s”. Slowly, so I don't miss anything.<dominio: It smells of {cheiro}.|>",
            "Does “%s” end well? Tell me without telling me.",
            "Dreamt about “%s” last night. <corajosa:I saved everyone.|romantica:It was lovely.|I got scared.>",
            "Does “%s” have footnotes? I hope so.",
            "Grandmother would have liked “%s”. I think.",
            "“%s” makes a noise when I turn the page. Is that good?",
        },
        adulto = {
            "“%s”. Spine checked, exits too.",
            "Still filing “%s”. <otimista:Light. Good sign.|Heavy. As expected.>",
            "Whoever wrote “%s” knew a cellar. You can tell.",
            "After “%s”, I need <romantica:a handkerchief|medrosa:a light on|a locked door> and some silence.",
            "“%s” won't change the world. But it keeps a piece of it.",
            "“%s”? Pretty cover. I'll check the insides.<dominio: Smells of {cheiro}, by the way.|>",
            "I kept my piece of “%s”. The rest is up to you.",
        },
        velho = {
            "“%s” reminds me of a book I pulled out of the ashes.",
            "I've kept worse books than “%s”. And better. This one stays.",
            "“%s” goes to the kittens. My way.",
            "At my age, “%s” is read slowly. Good.",
            "“%s” smells of an old edition. <erudita:I checked the colophon.|I liked it.>",
            "Still thinking about “%s”. <amarga:Ends badly, I bet.|otimista:It'll end well. I can feel it.|We'll see.>",
            "Kept “%s” in my scarf. Still fits.",
        },
    },
    personagem = {
        filhote = {
            "%s <corajosa:dares me. I like it|romantica:makes my heart go soft|scares me a bit>.",
            "I like %s. <romantica:A lot.|cinica:For now.|Is that allowed?>",
            "%s showed up again. I checked the exits.",
            "Does %s keep secrets? Looks like it.",
            "If %s needed a hiding place, I'd lend mine.",
            "%s talks nicely. Grandmother said to be suspicious of that.",
            "Every time %s shows up, I <medrosa:hide|corajosa:move closer|pay attention>.",
        },
        adulto = {
            "%s again. The file's getting fat.",
            "I know %s's type. <otimista:Ends well, believe it or not.|Ends badly.>",
            "%s talks like someone who's never checked a door.",
            "If I met %s, I'd <romantica:keep their letters|medrosa:leave by the window|ask a few questions>.",
            "%s is hiding something. So am I. We're colleagues.",
            "Noted: %s lies in the wrong chapter.",
            "%s is the sort who leaves a cup on top of a book. Under watch.",
        },
        velho = {
            "%s reminds me of a cellar cat. Good sort.",
            "I've seen plenty like %s. Some survived.",
            "%s goes on the list of the ones worth remembering.",
            "At my age, you forgive %s. Almost.",
            "%s carries more than they show. I know the weight.",
            "I'll tell the kittens about %s. My way.",
            "%s again. I like the ones who come back.",
        },
    },
    palavra = {
        filhote = "Kept the word “%s”. <otimista:It tastes of Sunday.|medrosa:I think it's someone's password.|erudita:I'll learn the dictionary entry.|It's mine now.>",
        adulto = "“%s”. Filed. <erudita:A noble word; nobody uses it.|popular:A dictionary word. It'll do.|Could be a password.>",
        velho = "“%s”. I'll teach that one to the kittens. <amarga:Before they forget.|otimista:They'll like it.|My way.>",
    },
}
