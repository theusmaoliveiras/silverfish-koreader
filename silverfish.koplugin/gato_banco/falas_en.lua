--[[--
Ash Cat's lines, in English. The ones the user chose in batches 1A, 1B and 1C
(traca/cartoes/rascunhos/cat/choices-1a.md, -1b.md, -1c.md); the other language has the same lines in the
same order. Voice: traca/cartoes/VOICE-CAT.md.

By stage (the cat's temperaments in traca_species.lua) and situation. traca_estado.lua picks from here
while the cat is awake; nothing else in the silverfish's voice is said for it.
]]

local B = {
    -- the egg (batch 1A): it doesn't talk yet, things happen; the same list awake and asleep
    ovo = {
        _todas = {
            "(a tiny paw pushed at the shell, then stopped to listen)",  -- 1A.1 Something moves inside
            "(the shell went quiet when the page turned, then started again)",  -- 1A.2 Listening
            "(the egg likes being near the book. It's warmer there)",  -- 1A.3 Warmth and smoke
            "(the egg is purring. It will deny it later)",  -- 1A.4 Purring
            "(the shell is thin now. Something inside is waiting for the coast to be clear)",  -- 1A.5 Almost out
            "(from inside, very faintly: “psst. keep reading.”)",  -- 1A.6 A voice from inside
        },
    },
    -- the kitten (batch 1A)
    filhote = {
        feliz = {  -- happy
            "I kept a page and nobody caught me. Is that how it works?",  -- 1A.7 The first page kept
            "Grandmother said start with the footnotes. I know three now!",  -- 1A.8 Proud of a useless part
            "Door closed, page kept, belly warm. Rule one: done.",  -- 1A.9 A safe night
            "You read, I keep. We're a team. A secret team.",  -- 1A.10 The accomplice
            "I hid a word inside my scarf. It's warm in there.",  -- 1A.11 The scarf
            "Another chapter? Yes, but quietly.",  -- 1A.12 More, please
        },
        normal = {  -- everyday
            "Grandmother said: check the exits, then check the index. I'm checking.",  -- 1A.13 Reciting a rule
            "What was that noise? Oh. Just the page. Good page.",  -- 1A.14 A noise
            "Lean in. I have a secret. I forgot it. It was a good one.",  -- 1A.15 Someone is listening
            "Don't ask about the patch. Okay, ask. I'll make something up.",  -- 1A.16 The eye patch
            "Grandmother warned me about silverfish. They eat what we save.",  -- 1A.17 The silverfish
            "I'm still learning. You start with the boring parts. That's the rule.",  -- 1A.18 Still learning
            "Rule three: if a book is everywhere, ask who put it there. Who put this here?",  -- 1A.19 A suspicious shelf
            "The dark is good for hiding pages. And bad for finding them again.",  -- 1A.20 The night shift
        },
        triste = {  -- sad or hungry
            "Empty again. Did they take the books? Did I miss it?",  -- 1A.21 Nothing to keep
            "Grandmother said forgetting is quiet. It's very quiet in here.",  -- 1A.22 Afraid of forgetting
            "Psst. Are you still there? I'm still here.",  -- 1A.23 Alone
            "I smelled smoke. It was nothing. I'm still shaking a bit.",  -- 1A.24 A fright
            "Just one page? One page is still a page saved.",  -- 1A.25 Asking for a page
        },
        dormindo = {  -- asleep, at night on its screen
            "Zzz… reciting the index… A… B… zzz…",  -- 1A.26 Asleep, still on guard
            "Zzz… purring at a footnote… zzz…",  -- 1A.27 Asleep, small dreams
            "Zzz… don't touch the scarf… zzz…",  -- 1A.28 Asleep, worried
        },
        casulo = {  -- hiding: too long without pages
            "Gone underground. Grandmother taught me. Read a page when it's clear.",  -- 1A.29 In the wall
            "I'm under the floorboards. Not scared. Just careful.",  -- 1A.30 Under the floor
        },
        repouso = {  -- dreams on the sleep screen
            "Zzz… dreaming that all the cats met and the story was whole…",  -- 1A.31 A safe place
            "Zzz… dreaming the furnaces were full of bread, not books…",  -- 1A.32 A gentle world
            "Zzz… dreaming of a library with no doors to check…",  -- 1A.33 Odd dreams
        },
        carinho = {  -- petting
            "Purr. That wasn't me. That was the book.",  -- 1A.34 On duty
            "Grandmother said never let your guard down. I'm letting it down a bit.",  -- 1A.35 Letting its guard down
            "Shh. If they see me purring, they'll know I'm happy.",  -- 1A.36 Cat dignity
        },
        muda = {  -- close to the next stage (the elder: close to the end of its life, before it leaves an egg)
            "I think I'm growing. The scarf is almost the right size.",  -- 1A.37 Growing
            "I won't be a kitten much longer. I'll miss the useless parts.",  -- 1A.38 Leaving kittenhood
        },
        sumiu = {  -- back after days away; {n} = days
            "{n} days! I thought they took you. I kept your page warm.",  -- 1A.39 You're back
            "Psst. {n} days. I guarded the shelf the whole time. Mostly.",  -- 1A.40 Where were you
        },
    },
    -- the adult (batch 1B)
    adulto = {
        feliz = {  -- happy
            "Page kept. Filed. Nobody saw.",  -- 1B.1 A page kept
            "Good page. I'd hide this one behind a boring book.",  -- 1B.2 A good find
            "Door shut. Exits checked. Pages in. That's a good night.",  -- 1B.3 A safe night
            "Psst. Same time tomorrow. Bring the book.",  -- 1B.4 The accomplice
            "I'd smile, but someone might be watching.",  -- 1B.5 A dry joke
            "Read on. I'll watch the door.",  -- 1B.6 More
        },
        normal = {  -- everyday
            "Rule four: read the first page twice. That's where they hide the door.",  -- 1B.7 Quoting a rule
            "Heard something. Probably nothing. I'll check anyway.",  -- 1B.8 A noise
            "Psst. If anyone asks, we're just reading.",  -- 1B.9 Someone is listening
            "One eye sees less. It notices more. Fair trade.",  -- 1B.10 The eye patch
            "Don't stare at the ear. It's rude. And a long story.",  -- 1B.11 The ear
            "Silverfish eat books. I keep them. We have an understanding. Barely.",  -- 1B.12 The silverfish
            "Everyone's reading the same book. Someone chose it.",  -- 1B.13 Suspicious of the popular
            "I keep my piece. You keep the rest. That's how stories survive.",  -- 1B.14 The piece it keeps
        },
        triste = {  -- sad or hungry
            "Empty shelf. Quiet house. Bad combination.",  -- 1B.15 Nothing to keep
            "Rule two. You know the one. Forgetting is quiet.",  -- 1B.16 Afraid of forgetting
            "You haven't been around. I kept the exits clear.",  -- 1B.17 Alone
            "Restless. A cat without pages is just a cat.",  -- 1B.18 Restless
            "Give me a sentence and I'll make it last.",  -- 1B.19 Asking for a page
        },
        dormindo = {  -- asleep, at night on its screen
            "Zzz… rule fifteen… exits… index… zzz…",  -- 1B.20 Asleep, still on guard
            "Zzz… reciting my piece… in order… zzz…",  -- 1B.21 Asleep, old worries
            "Zzz… don't touch the scarf… zzz…",  -- 1B.22 Asleep, odd
        },
        casulo = {  -- hiding: too long without pages
            "Underground until further notice. A page brings me out.",  -- 1B.23 In the wall
            "Too quiet out there. I don't trust quiet.",  -- 1B.24 Laying low
        },
        repouso = {  -- dreams on the sleep screen
            "Zzz… dreaming the cellar cats met again, and the story was whole…",  -- 1B.25 The archive whole
            "Zzz… dreaming the paper-eater kept watch for once…",  -- 1B.26 Strange peace
            "Zzz… dreaming of grandmother reciting, in the dark, in order…",  -- 1B.27 Old faces
        },
        carinho = {  -- petting
            "On duty. But go on.",  -- 1B.28 On duty
            "I'm purring for operational reasons.",  -- 1B.29 Operational purring
            "Rule ten says I'll tell this story differently later.",  -- 1B.30 Caught enjoying it
        },
        muda = {  -- close to the next stage (the elder: close to the end of its life, before it leaves an egg)
            "Whiskers going grey. Soot, I tell people.",  -- 1B.31 Grey whiskers
            "Soon I'll be the one telling the stories. Differently each time.",  -- 1B.32 Thinking ahead
        },
        sumiu = {  -- back after days away; {n} = days
            "Back after {n} days. Good. Shut the door.",  -- 1B.33 You're back
            "{n} days. I'm not saying I worried. I'm saying I checked the door a lot.",  -- 1B.34 The wait
        },
    },
    -- the elder (batch 1C)
    velho = {
        feliz = {  -- happy
            "Page filed. The old paws still work.",  -- 1C.1 A page kept
            "A good sentence. I'll keep it next to the old ones.",  -- 1C.2 A good find
            "Quiet night. I remember when there weren't any.",  -- 1C.3 A safe night
            "We've kept a lot together, you and I.",  -- 1C.4 The accomplice
            "I'm smiling. Blame the book.",  -- 1C.5 A tender joke
            "Read on. I'm old, not tired. Well. Both.",  -- 1C.6 More
        },
        normal = {  -- everyday
            "“He who destroys a good book, kills reason itself.” Milton. The cats kept that one.",  -- 1C.7 Quoting
            "Footsteps? No. Just memory walking around.",  -- 1C.8 A noise
            "Lean in. The walls have ears. Mine just work less.",  -- 1C.9 Someone is listening
            "Ask me about the patch. Today it's a story about a dragon.",  -- 1C.10 The eye patch
            "This scarf has carried more pages than I can count.",  -- 1C.11 The ear and the scarf
            "If the paper-eater outlives me, tell it which pages to leave alone.",  -- 1C.12 The silverfish
            "Read what everyone reads. Then read what's under it.",  -- 1C.13 Popular books, tidy shelves
            "My piece of this book is yours too now. Keep it well.",  -- 1C.14 The pieces it keeps
        },
        triste = {  -- sad or hungry
            "Empty shelves make an old cat remember things.",  -- 1C.15 Nothing to keep
            "I'm forgetting the order. The order matters.",  -- 1C.16 Afraid of forgetting
            "I've guarded empty rooms before. I hoped I was done.",  -- 1C.17 Alone
            "I keep thinking of the cellar cats. Few of us left.",  -- 1C.18 Melancholy
            "A page, please. I don't have that many left to keep.",  -- 1C.19 Asking for a page
        },
        dormindo = {  -- asleep, at night on its screen
            "Zzz… on top of the book… where it's warm… zzz…",  -- 1C.20 Asleep, still on guard
            "Zzz… grandmother… I kept them… zzz…",  -- 1C.21 Asleep, memories
            "Zzz… teaching a kitten… one sentence… zzz…",  -- 1C.22 Asleep, passing it on
        },
        casulo = {  -- hiding: too long without pages
            "Underground again. I thought I was done with that.",  -- 1C.23 In the wall
            "Too quiet. At my age, quiet is suspicious.",  -- 1C.24 Laying low
        },
        repouso = {  -- dreams on the sleep screen
            "Zzz… dreaming all the cellar cats met one last time… and the story was whole…",  -- 1C.25 The last meeting
            "Zzz… dreaming of a library with the doors left open…",  -- 1C.26 Open doors
            "Zzz… dreaming I remembered the true story of the patch…",  -- 1C.27 Lost things
        },
        carinho = {  -- petting
            "Fine. Twice. I'm old, I've earned it.",  -- 1C.28 Gently
            "That's the spot. It's been the spot for years.",  -- 1C.29 Purring
            "Rule ten. I'll tell this differently tomorrow. Better, probably.",  -- 1C.30 The door can wait
        },
        muda = {  -- close to the next stage (the elder: close to the end of its life, before it leaves an egg)
            "Every cat passes its piece on. I'm getting mine ready.",  -- 1C.31 Getting ready
            "Don't be sad. A story told to a kitten doesn't end.",  -- 1C.32 No sadness
        },
        sumiu = {  -- back after days away; {n} = days
            "{n} days. At my age, I count them.",  -- 1C.33 You're back
            "{n} days. Never leave a book alone. Or an old cat.",  -- 1C.34 The wait
        },
    },
}

-- More since 07/11/2026 (parity with the silverfish): gato_banco/falas_mais_en.lua, written by hand, is
-- appended to the lists above.
do
    local function juntar(a, b)
        for k, v in pairs(b) do
            if type(v) == "table" and type(a[k]) == "table" then
                if type(v[1]) == "string" then
                    for _, x in ipairs(v) do a[k][#a[k] + 1] = x end
                else
                    juntar(a[k], v)
                end
            elseif a[k] == nil then
                a[k] = v
            end
        end
    end
    local ok, M = pcall(require, "gato_banco.falas_mais_en")
    if ok and type(M) == "table" then juntar(B, M) end
end

return B
