--==============================================================
-- The Insulines.
-- Copyright (c) 2010-2012 quov.is
-- All Rights Reserved.
-- http://quov.is // http://theinsulines.com
--==============================================================
dialogTree = {}

dialogTree.c01s01_laundry = {
  text = {
    en_US = "I gave the Laundry Lady the Year Off",
    es_AR = ""
  },
  character =  "main_character"
}

dialogTree.c01s01_never_sleeps = {
  text = {
    en_US = "This City Never Sleeps. It just lingers in a perpetual drowsiness",
    es_AR = ""
  },
  character =  "main_character"
}

dialogTree.c01s01_barbarullo = {
  text = {
    en_US = "That’s a promotional poster for “Barbarulo”, based on the original 1967 script. An Italian space opera about a heavily mustachioed amazon from the future in a mission to rekindle humanity’s sex drive. The plot was heavily revised after the French Co-Producers signed on.",
    es_AR = ""
  },
  character =  "main_character"
}

dialogTree.c01s01_floyd = {
  text = {
    en_US = "My signed print of the “Pink Side of the Space Station” cover art. A cult classic among synchronization enthusiasts everywhere. Much better than that Rainbow nonsense",
    es_AR = ""
  },
  character =  "main_character"
}

dialogTree.c01s01_duck = {
  text = {
    en_US = "I wonder if it’s still anatidaephobia if you know for a fact you are being watched by a creepy, albeit rubber, duck. It gives me the creeps",
    es_AR = ""
  },
  character =  "main_character"
}

dialogTree.c01s01_put_clothes_1 = {
  text = {
    en_US = "I should probably put some clothes on before that.",
    es_AR = ""
  },
  character =  "main_character"
}

dialogTree.c01s01_put_clothes_2 = {
  text = {
    en_US = "What would my mother say if she saw me like this?",
    es_AR = ""
  },
  character =  "main_character"
}

dialogTree.c01s01_put_clothes_3 = {
  text = {
    en_US = "I know I’ve looked worse off, but this attire is not very engaging",
    es_AR = ""
  },
  character =  "main_character"
}

dialogTree.c01s01_put_clothes_4 = {
  text = {
    en_US = "I think “Sleepy, Wife-Beating Bum” went out of style this season. I should probably get changed",
    es_AR = ""
  },
  character =  "main_character"
}

dialogTree.c01s02_tv = {
  text = {
    en_US = "57 Channels and Nothing On",
    es_AR = ""
  },
  character =  "main_character"
}


dialogTree.c01s02_answering_machine_message = {
  text = {
    en_US = "This is a message for Mr. Sanchez from Dr. Porta's office. Mr. Sanchez has once again missed his appointment for his check-up this morning.",
    es_AR = ""
  },
  defaultAction = DIALOG_ACTION_REDIRECT,
  dialogName = 'c01s02_answering_machine_message_2',
  character =  "answering"
}

dialogTree.c01s02_answering_machine_message_2 = {
  text = {
    en_US = "Please have him call us at his earliest convenince to reschedule. I shouldn't have to stress how important regular controls are for a person of his condition.",
    es_AR = ""
  },
  defaultAction = DIALOG_ACTION_REDIRECT,
  dialogName = 'c01s02_answering_machine_message_3',
  character =  "answering"
}

dialogTree.c01s02_answering_machine_message_3 = {
  text = {
    en_US = "So please, contact Dr. Porta immediately.",
    es_AR = ""
  },
  defaultAction = DIALOG_ACTION_REDIRECT,
  dialogName = 'c01s02_answering_machine_message_4',
  character =  "answering"
}

dialogTree.c01s02_answering_machine_message_4 = {
  text = {
    en_US = "Wow, she sounds pretty steamed. Then again, Bobby rarely bother to check his glucose levels before shooting up, so why would I expect him to keep a doctor’s appointment?",
    es_AR = ""
  },
  character =  "main_character"  
}

dialogTree.c01s02_coffee_maker = {
  text = {
    en_US = "The Trusty Caffeinator 3000. A wondrous device that magically transforms plain water and ground beans into liquid energy.",
    es_AR = ""
  },
  character =  "main_character"
}

dialogTree.c01s02_coffee_pot_with_water = {
  text = {
    en_US = "I already filled the coffee pot.",
    es_AR = ""
  },
  character =  "main_character"
}

dialogTree.c01s02_fill_coffee_pot_first = {
  text = {
    en_US = "I should fill the coffee pot first.",
    es_AR = ""
  },
  character =  "main_character"
}

dialogTree.c01s02_mug_full = {
  text = {
    en_US = "That’s the nastiest Cup of Joe I’ve ever tasted. And I’ve been to Europe.",
    es_AR = ""
  },
  character =  "main_character"
}

dialogTree.c01s02_stole_mug = {
  text = {
    en_US = "I sort of stole that mug from a random game development studio.",
    es_AR = ""
  },
  character =  "main_character"
}

dialogTree.c01s02_coffee_pot_full = {
  text = {
    en_US = "A Pot of Bile-Tasting Sludge",
    es_AR = ""
  },
  character =  "main_character"
}

dialogTree.c01s02_flyer = {
  text = {
    en_US = "'Yard Sale Fair at Town Square - Our junk could be your Treasure'. I must have left this here to remember... Something.",
    es_AR = ""
  },
  
  defaultAction = DIALOG_ACTION_REDIRECT,
  dialogName = 'c01s02_flyer_2',  
  character =  "main_character"
}

dialogTree.c01s02_flyer_2 = {
  text = {
    en_US = "Oh, that’s right! The LPs Guy... What was his name? Bah, I’ll find him here I guess.",
    es_AR = ""
  },
  
  defaultAction = DIALOG_ACTION_REDIRECT,
  dialogName = 'c01s02_flyer_3',
  character =  "main_character"
}

dialogTree.c01s02_flyer_3 = {
  text = {
    en_US = "Hey! It even has a small map of town with the Fair marked down!",
    es_AR = ""
  },
  character =  "main_character"
}


-- NANCY DIALOG

nancyOptions = {
  { id = 1, label = {en_US = "What are you doing here?", es_AR = ""}, action = DIALOG_ACTION_REDIRECT, dialogName = "c01s02_nancy_1" },
  { id = 2, label = {en_US = "What’s this all about?", es_AR = ""}, action = DIALOG_ACTION_REDIRECT, dialogName = "c01s02_nancy_2a" },
  { id = 3, label = {en_US = "So you are just going to wait him out?", es_AR = ""}, action = DIALOG_ACTION_REDIRECT, dialogName = "c01s02_nancy_2b", hidden = true },
  { id = 4, label = {en_US = "Looking good, as usual.", es_AR = ""}, action = DIALOG_ACTION_REDIRECT, dialogName = "c01s02_nancy_3" },
}

dialogTree.c01s02_nancy_intro = {
  text = {
    en_US = "Bobby! You stood me up last night, you Jerk! \nI swear to God, I’m going to grab a pound of sugar and go all Tony Montana on your ass, you - Oh, it’s just you.",
    es_AR = ""
  },
  defaultAction = DIALOG_ACTION_REDIRECT,
  dialogName = 'c01s02_nancy_intro_answer',
  character =  "nancy"
}

dialogTree.c01s02_nancy_intro_answer = {
  text = {
    en_US = "Good Morning to you too, Nancy.",
    es_AR = ""
  },
  
  options = nancyOptions,
  character =  "main_character"
}

dialogTree.c01s02_nancy_1 = {
  text = {
    en_US = "What are you doing here? This isn’t your home anymore, remember?",
    es_AR = ""
  },
  defaultAction = DIALOG_ACTION_REDIRECT,
  dialogName = 'c01s02_nancy_1_1',
  character =  "main_character"
}

dialogTree.c01s02_nancy_1_1 = {
  text = {
    en_US = "Please, spare me the drama. I’m only looking for Bobby.",
    es_AR = ""
  },
  defaultAction = DIALOG_ACTION_REDIRECT,
  dialogName = 'c01s02_nancy_1_2',
  character =  "nancy"
}
dialogTree.c01s02_nancy_1_2 = {
  text = {
    en_US = "Well, he ain't here.",
    es_AR = ""
  },
  
  options = nancyOptions,
  character =  "main_character"
}

dialogTree.c01s02_nancy_2a = {
  text = {
    en_US = "What’s this all about? I thought you and Bob had a gig to go to last night.",
    es_AR = ""
  },
  defaultAction = DIALOG_ACTION_REDIRECT,
  dialogName = 'c01s02_nancy_2a_1',
  character =  "main_character",
}

dialogTree.c01s02_nancy_2a_1 = {
  text = {
    en_US = "Not that it’s any of your business anymore, but yeah, we did.",
    es_AR = ""
  },
  defaultAction = DIALOG_ACTION_REDIRECT,
  dialogName = 'c01s02_nancy_2a_2',
  character =  "nancy"
}

dialogTree.c01s02_nancy_2a_2 = {
  text = {
    en_US = "At least until that insulin-dependant wetback friend of yours left me hangin mid concert.",
    es_AR = ""
  },
  defaultAction = DIALOG_ACTION_REDIRECT,
  dialogName = 'c01s02_nancy_2a_3',
  character =  "nancy"
}

dialogTree.c01s02_nancy_2a_3 = {
  text = {
    en_US = "Oh, he’s got another thing coming when I get my hands on him...",
    es_AR = ""
  },
  defaultAction = DIALOG_ACTION_REDIRECT,
  dialogName = 'c01s02_nancy_2a_4',
  character =  "nancy"
}

dialogTree.c01s02_nancy_2a_4 = {
  text = {
    en_US = "No wonder he bailed...",
    es_AR = ""
  },
  defaultAction = DIALOG_ACTION_REDIRECT,
  dialogName = 'c01s02_nancy_2a_5',
  character =  "main_character"
}

dialogTree.c01s02_nancy_2a_5 = {
  text = {
    en_US = "I heard that!",
    es_AR = ""
  },
  
  options = nancyOptions,
  character =  "nancy",
  oneTime = true,
  change = { hide = 2, show = 3 }
}

dialogTree.c01s02_nancy_2b = {
  text = {
    en_US = "So you are just going to wait him out? Here?",
    es_AR = ""
  },
  defaultAction = DIALOG_ACTION_REDIRECT,
  dialogName = 'c01s02_nancy_2b_1',
  character =  "main_character"
}

dialogTree.c01s02_nancy_2b_1 = {
  text = {
    en_US = "I guess",
    es_AR = ""
  },
  defaultAction = DIALOG_ACTION_REDIRECT,
  dialogName = 'c01s02_nancy_2b_2',
  character =  "nancy" 
}

dialogTree.c01s02_nancy_2b_2 = {
  text = {
    en_US = "By all means, make yourself at home. There’s fresh coffee in the kitchen.",
    es_AR = ""
  },
  options = {
    { label = {en_US = "One more thing...", es_AR = ""}, action = DIALOG_ACTION_REDIRECT, dialogName = "c01s02_nancy_one_more" },
    { label = {en_US = "Well, I’d love to stay and chat, but ...", es_AR = ""}, action = DIALOG_ACTION_REDIRECT, dialogName = "c01s02_nancy_leave" },
  },
  character =  "main_character"
}

dialogTree.c01s02_nancy_one_more = {
  text = {
    en_US = "One more thing...",
    es_AR = ""
  },
  
  options = nancyOptions,
  character =  "main_character"
}

dialogTree.c01s02_nancy_leave = {
  text = {
    en_US = "Well, I’d love to stay and chat, but I’d rather chance I get run over by a bus.",
    es_AR = ""
  },
  character =  "main_character"
}

dialogTree.c01s02_nancy_3 = {
  text = {
    en_US = "Looking good, as usual.",
    es_AR = ""
  },
  defaultAction = DIALOG_ACTION_REDIRECT,
  dialogName = 'c01s02_nancy_3_1',
  character =  "main_character"
}

dialogTree.c01s02_nancy_3_1 = {
  text = {
    en_US = "Oh, that’s so sweet of you Josh. Thanks! You look like shit yourself, too.",
    es_AR = ""
  },
  defaultAction = DIALOG_ACTION_REDIRECT,
  dialogName = 'c01s02_nancy_3_2',
  character =  "nancy"
}

dialogTree.c01s02_nancy_3_2 = {
  text = {
    en_US = "Gee, thanks.",
    es_AR = ""
  },
  
  options = nancyOptions,
  character =  "main_character",
}

-- End NANCY

dialogTree.c01s02_leave_bathroom = {
  text = {
    en_US = "Believe me, you didn’t want to see the inside of that",
    es_AR = ""
  },
  character =  "main_character"
}

dialogTree.c01s02_bathroom_1 = {
  text = {
    en_US = "Once is plenty, thanks",
    es_AR = ""
  },
  character =  "main_character"
}

dialogTree.c01s02_bathroom_2 = {
  text = {
    en_US = "I’ll have to give a stern talk to Bobby about Toilet Etiquette. Again",
    es_AR = ""
  },
  character =  "main_character"
}

dialogTree.c01s02_bathroom = {
  text = {
    en_US = "I'm not about to start my day with Zombie Breath. Nobody deserves something that bad.",
    es_AR = ""
  },
  character =  "main_character"
}

dialogTree.c01s02_coffee = {
  text = {
    en_US = "I don't think I'm truly ready to face Humanity unless I've had something to wake up fully",
    es_AR = ""
  },
  character =  "main_character"
}

dialogTree.c01s02_bathroom_and_coffee = {
  text = {
    en_US = "No Toothbrush, No Coffee... No Morning. That's the way it is.",
    es_AR = ""
  },
  character =  "main_character"
}

dialogTree.locked = {
  text = {
    en_US = "It's locked",
    es_AR = ""
  },
  character =  "main_character"
}


-- DEMO END SCENE

dialogTree.demo = {
  text = {
    en_US = "What secret past ties this mysterious woman to our Hero?",
    es_AR = ""
  },
  defaultAction = DIALOG_ACTION_REDIRECT,
  dialogName = 'demo_1',
  character =  "main_character"
}

dialogTree.demo_1 = {
  text = {
    en_US = "Who is the Anonymous Salesman at the Fair?",
    es_AR = ""
  },
  defaultAction = DIALOG_ACTION_REDIRECT,
  dialogName = 'demo_2',
  character =  "main_character"
}

dialogTree.demo_2 = {
  text = {
    en_US = "And where in the World is Bobby?",
    es_AR = ""
  },
  defaultAction = DIALOG_ACTION_REDIRECT,
  dialogName = 'demo_3',
  character =  "nancy"
}

dialogTree.demo_3 = {
  text = {
    en_US = "Find out all this and more in the upcoming debut of The Insulines, a sugar-free point-and-click adventure coming to an internet near you!",
    es_AR = ""
  },
  character =  "main_character"
}



