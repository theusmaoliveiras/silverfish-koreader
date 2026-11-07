--[[--
Ash Cat: lines with data from your reading (English). The same layout and triggers as traca_contexto.lua (the
silverfish), by the cat's stage: kitten, adult, elder. Written and approved by Claude on 07/11/2026, at the
user's request, in the silverfish's volume. Voice: traca/cartoes/VOICE-CAT.md. Same order as contexto_pt.lua.

Slots: {hora} ("2:13 a.m."), {n} (pages or days), {livro}, {pct} ("93%"); <pole:…|…> picks by temper;
{cheiro|…} is a word from the book's world (traca_voz.lua). No gendered words for the reader or the cat.
]]

return {
    madrugada = {
        filhote = {
            "It's {hora}. Grandmother said it's the safest hour. She also said to sleep.",
            "{hora}! Psst. The whole house asleep and us here. Exciting.",
            "At {hora} the dark gets bigger. Stay close.",
            "{hora}. <noturna:My favourite hour!|I'm sleepy, but I won't miss this chapter.>",
            "Reading at {hora}. If anyone asks, we were counting stars.",
        },
        adulto = {
            "{hora}. Fewer eyes. Good shift.",
            "It's {hora}. Door locked, lamp low. Go on.",
            "{hora}. The hour the cellars used to work.",
            "Reading at {hora}. <medrosa:I check every creak.|noturna:That's how it's done.|Nobody saw. Good.>",
            "{hora} and an open book. Nothing more underground than that.",
        },
        velho = {
            "{hora}. Grandmother recited at this hour. Now I'm the one listening.",
            "It's {hora}. I've lost count of the late nights. This one I'll keep.",
            "{hora}. Grey whiskers and you reading. Good pair.",
            "{hora}. At this hour books speak more softly. So do I.",
            "At {hora} I remember the cellars. No smoke, for once.",
        },
    },
    recorde = {
        filhote = {
            "{n} pages today! A record! Grandmother would tell the whole cellar.",
            "Never kept this much in a day: {n} pages. My scarf won't close.",
            "A record of {n} pages! My paws are shaking.",
            "{n} pages! Is that a lot? It feels like a lot. So proud.",
            "{n} pages in a day. I'll recite them all. In order. Maybe tomorrow.",
        },
        adulto = {
            "{n} pages. A record. Filed with date and time.",
            "New record: {n} pages. Someone's in a hurry. Or running.",
            "{n} pages today. We've never carried this much in one day.",
            "A record of {n}. Don't celebrate out loud. Walls.",
            "{n} pages. Big operation. Nobody noticed.",
        },
        velho = {
            "{n} pages. A record. At my age, that's an event.",
            "{n} pages today. More than many cellars kept in a week.",
            "Record: {n}. I'll tell the kittens. My way, which changes.",
            "{n} pages. I've seen many nights. None like this.",
            "New record of {n} pages. The paws complain; the rest is grateful.",
        },
    },
    maratona = {
        filhote = {
            "{n} pages today! Don't you get tired? I get tired just keeping them.",
            "{n} pages already. My hiding place is overflowing.",
            "{n} pages… <corajosa:One more chapter!|can I rest in the scarf a little?>",
            "{n} pages! Grandmother said one at a time. We did lots at a time.",
            "So many pages today: {n}. I'll have to sleep on top of them.",
        },
        adulto = {
            "{n} pages. A good day's work.",
            "{n} pages today. Blink. Then go on.",
            "{n} already. Rule 12 is watching us.",
            "{n} pages. <erudita:Even a dictionary would ask for a break.|That's not reading, that's moving house.>",
            "{n} pages and counting. The archive thanks you. My back doesn't.",
        },
        velho = {
            "{n} pages today. The old paws protest. I ignore them.",
            "{n} pages. I remember nights like this. They were more dangerous.",
            "{n} already. Drink some water. I'll wait.",
            "{n} pages. Leave a little for tomorrow. Tomorrow needs some too.",
            "{n} pages today. That's a rescue, not a read.",
        },
    },
    sumiu = {
        filhote = {
            "{n} days! I thought they'd taken you. I checked the door a thousand times.",
            "You were gone {n} days. I kept your place. And the page.",
            "{n} days without you. <medrosa:I heard every sound in the house.|I recited the index to pass the time.>",
            "You're back! {n} days. I didn't cry. Almost.",
            "{n} days. Grandmother said good people always come back. She was right.",
        },
        adulto = {
            "{n} days. I won't ask where. Just shut the door.",
            "{n} days away. The cellar got too quiet.",
            "You were gone {n} days. I kept the exits clear.",
            "{n} days. <romantica:I missed you. There, I said it.|Noted. No questions.>",
            "Back after {n} days. Good. What's the password?",
        },
        velho = {
            "{n} days. At my age, you count every one.",
            "{n} days. I kept everything in order. Almost everything.",
            "You came back after {n} days. I knew you would. I waited anyway.",
            "{n} days without reading. The books noticed. So did I.",
            "{n} days. I've guarded empty rooms before. I prefer them with you.",
        },
    },
    tarde = {
        filhote = {
            "It's {hora} already. Just one more chapter? Grandmother said that too.",
            "{hora}. <noturna:Not sleepy at all!|My eyes are heavy, but keep going.>",
            "Reading at {hora} is like a secret. Quietly.",
            "{hora}. The house turned the lights off. We didn't.",
            "It's {hora}. Will you tuck me in with the scarf?",
        },
        adulto = {
            "{hora}. A good hour for quiet work.",
            "It's {hora}. One more chapter, then we check the door.",
            "{hora}. The best pages come after ten.",
            "{hora}. You read, I keep watch. Deal.",
            "It's {hora}. <medrosa:I can hear the clock.|Good silence.>",
        },
        velho = {
            "{hora}. The night is long. I've had longer.",
            "It's {hora}. The old cellars woke up about now.",
            "{hora}. Read. I'll doze with my eye open.",
            "{hora}. Open book, low lamp. The old way.",
            "It's {hora}. Tell me the chapter tomorrow. Tonight I'll listen.",
        },
    },
    cedo = {
        filhote = {
            "{hora}! The sun woke up and so did you. I almost did.",
            "Good morning! At {hora} the pages smell like bread.",
            "{hora}. Reading early! Grandmother never let me. Shh.",
            "It's {hora}. <diurna:My hour!|Still sleepy, but fine.>",
            "{hora}. Nobody up. Just us and the book.",
        },
        adulto = {
            "{hora}. Day shift. The door's easier to watch.",
            "It's {hora}. Reading before the world starts talking.",
            "{hora}. Too early for trouble. Or not.",
            "{hora}. Coffee for you, a page for me.",
            "Good morning. {hora}. Nothing to hide, for now.",
        },
        velho = {
            "{hora}. Old eyes like morning light.",
            "It's {hora}. We used to read only in the dark.",
            "{hora}. How good to read without hiding.",
            "Good morning. {hora}. The shelf is still cold.",
            "{hora}. A morning with a book. Grandmother wouldn't believe it.",
        },
    },
    sessao = {
        filhote = {
            "{n} pages without stopping! Are your paws all right?",
            "{n} in a row! My head is spinning.",
            "{n} pages at once. I didn't even check the door.",
            "{n} without a break. Grandmother would say drink some water.",
            "{n} pages in a row. I'm keeping them as fast as I can.",
        },
        adulto = {
            "{n} pages without a break. Good book or a getaway?",
            "{n} in a row. Respect. Now blink.",
            "{n} pages in one sitting. Clean operation.",
            "{n} pages without getting up. I'd get up. For safety.",
            "{n} in a row. <corajosa:Keep going.|Short break. Check the door. Come back.>",
        },
        velho = {
            "{n} pages without stopping. I used to do that. Long ago.",
            "{n} in a row. Get up, stretch. The book will wait.",
            "{n} pages at once. I remember that hunger.",
            "{n} pages. Slowly works for keeping too.",
            "{n} without a break. Good. But breathe.",
        },
    },
    sequencia = {
        filhote = {
            "{n} days in a row! I know what time you arrive now.",
            "Day {n} in a row! Grandmother would call it discipline.",
            "{n} days! <romantica:We're a real team now.|It's a routine. I like routines.>",
            "{n} days without missing one. My scarf is full.",
            "Day {n}. I'm counting every one.",
        },
        adulto = {
            "{n} days in a row. Cellar discipline.",
            "Day {n}. Nobody breaks the chain.",
            "{n} days. Keeping at it is the best defence.",
            "Day {n} in a row. Noted.",
            "{n} days. That's how books survive.",
        },
        velho = {
            "{n} days in a row. That's passing it on.",
            "Day {n}. The cellar would be proud.",
            "{n} days. I've seen plenty give up on the third.",
            "{n} days in a row. Good. Memory likes habits.",
            "Day {n}. Keeping every day. That's how we did it.",
        },
    },
    bom_dia = {
        filhote = {
            "{n} pages today! I'm growing, I can feel it.",
            "{n} pages kept today and there's still room.",
            "{n} pages! Grandmother would have liked this day.",
            "{n} pages today. A good pile.",
            "{n} today. My hiding place says thanks.",
        },
        adulto = {
            "{n} pages today. Decent.",
            "{n}. Not a wasted day.",
            "{n} pages today. Archive up to date.",
            "{n} pages. Nothing burned. Good day.",
            "Today: {n} pages. Positive report.",
        },
        velho = {
            "{n} pages today. A good day for keeping.",
            "{n} pages. That's plenty, for someone who remembers the ashes.",
            "{n} today. Good. No hurry.",
            "{n} pages. The kittens would like this piece.",
            "{n} pages today. Enough for a cat to sleep in peace.",
        },
    },
    nada_hoje = {
        filhote = {
            "Nothing yet today. Not a line. I'm watching the book.",
            "No pages today… are you all right?",
            "Nothing today yet. Grandmother said forgetting is quiet.",
            "The book's been shut all day. Is it all right?",
            "Zero today. I'll keep a memory in its place.",
        },
        adulto = {
            "No pages today. The shelf noticed.",
            "Today: zero. I don't like silence.",
            "Nothing today. Forgetting makes no noise. Remember.",
            "An empty day. I'm keeping watch anyway.",
            "No pages today. I won't push. Much.",
        },
        velho = {
            "Nothing today. At my age, every day counts.",
            "No pages today. I've seen it start like this.",
            "Not today. That's fine. I'll wait for tomorrow.",
            "The book slept all day. So did I, almost.",
            "Zero today. Save me a paragraph for tomorrow.",
        },
    },
    reta_final = {
        filhote = {
            "{pct} of “{livro}”! Almost the end. My heart's in my mouth.",
            "Not much left of “{livro}”. I'll keep it slowly.",
            "{pct}! The end of “{livro}” is right there. Don't tell me!",
            "The home stretch of “{livro}”. Hold my paw.",
            "{pct} of “{livro}”. What if it ends badly? What if it ends well?",
        },
        adulto = {
            "{pct} of “{livro}”. The author can't get away now.",
            "The home stretch of “{livro}”. Exits checked.",
            "{pct}. “{livro}” almost got through whole.",
            "The last pages of “{livro}”. Twice the attention.",
            "{pct} of “{livro}”. This is where they hide the surprises.",
        },
        velho = {
            "{pct} of “{livro}”. Endings always get me.",
            "Almost the end of “{livro}”. Read slowly. Endings don't come back.",
            "{pct}. Soon “{livro}” becomes a memory.",
            "The home stretch of “{livro}”. I've kept many endings. This one too.",
            "{pct} of “{livro}”. Get the hanky ready. Mine's in the scarf.",
        },
    },
    metade = {
        filhote = {
            "Halfway through “{livro}”! Now it gets good, right?",
            "Half of “{livro}” kept. The other half is staring at me.",
            "The middle of “{livro}”! Grandmother said the middle is where the secret lives.",
        },
        adulto = {
            "Halfway through “{livro}”. This is where they show their cards.",
            "The middle of “{livro}”. Checkpoint.",
            "Half of “{livro}”. Half kept, half to keep.",
        },
        velho = {
            "Halfway through “{livro}”. The middle is where books stumble. Or fly.",
            "The middle of “{livro}”. I've learned not to judge too early.",
            "Half of “{livro}”. A good place to breathe.",
        },
    },
    comeco = {
        filhote = {
            "Starting “{livro}”! It smells of {cheiro|new paper}.",
            "The first pages of “{livro}”. I'm watching everyone.",
            "“{livro}” has begun! Who do I like? I don't know yet.",
        },
        adulto = {
            "The start of “{livro}”. First page twice, as Rule 4 says.",
            "The first pages of “{livro}”. Mapping the exits.",
            "“{livro}”, just begun. Nobody can be trusted yet.",
        },
        velho = {
            "The start of “{livro}”. Every new book reminds me of the first one.",
            "The first pages of “{livro}”. No hurry. It'll show itself.",
            "“{livro}”. A beginning. I like beginnings.",
        },
    },
    fim_de_semana = {
        filhote = {
            "The weekend! A whole day of book?",
            "A reading weekend. The best kind.",
            "A weekend with no hurry. Just paper and the scarf.",
        },
        adulto = {
            "The weekend. The world goes out; we keep.",
            "The world's day off. The cellar's on duty.",
            "Reading on the weekend. The right choice.",
        },
        velho = {
            "The weekend. That used to be when they burned the most. Today we read.",
            "A day off with a book. The way it should be.",
            "A weekend with a book. The kittens should learn this.",
        },
    },
}
