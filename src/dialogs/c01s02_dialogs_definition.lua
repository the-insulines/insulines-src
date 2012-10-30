conversations = {
  
  userVariables = {
    MessagePlayed = {
      initialValue = false,
    },
    SkipLoop = {
      initialValue = false,
    },
    FreezerOptions = {
      initialValue = 1,
    },
  },
  
  nancy = {
    actor = 'josh',
    conversant = 'nancy',
    dialogEntries = {
        dialog0 = {
          isRoot = true,
          isGroup = false,
          actor = 'josh',
          conversant = 'nancy',
          menuText = "",
          conditionsString = '',
          links = {
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 0,
              destinationDialogId = 13,
              isConnector = true,
            },
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 0,
              destinationDialogId = 1,
              isConnector = false,
            },
          },
        },
        dialog1 = {
          isRoot = false,
          isGroup = false,
          actor = 'nancy',
          conversant = 'josh',
          menuText = "",
          dialogueText = {
            "Bobby! You stood me up last night, you Jerk!",
            " I swear to God, I’m going to grab a pound of sugar and go all Tony Montana on your ass, you -",
            " Oh, it’s just you.",
          },
          conditionsString = 'stateManager.dialogs.userVariables["SkipLoop"]== false',
          links = {
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 1,
              destinationDialogId = 2,
              isConnector = false,
            },
          },
        },
        dialog2 = {
          isRoot = false,
          isGroup = false,
          actor = 'josh',
          conversant = 'nancy',
          menuText = "",
          dialogueText = {
            "Good Morning to you too, Nancy.",
          },
          conditionsString = '',
          links = {
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 2,
              destinationDialogId = 3,
              isConnector = false,
            },
          },
        },
        dialog3 = {
          isRoot = false,
          isGroup = true,
          actor = 'josh',
          conversant = 'nancy',
          menuText = "",
          conditionsString = '',
          links = {
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 3,
              destinationDialogId = 4,
              isConnector = false,
            },
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 3,
              destinationDialogId = 7,
              isConnector = false,
            },
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 3,
              destinationDialogId = 11,
              isConnector = false,
            },
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 3,
              destinationDialogId = 14,
              isConnector = false,
            },
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 3,
              destinationDialogId = 17,
              isConnector = false,
            },
          },
        },
        dialog4 = {
          isRoot = false,
          isGroup = false,
          actor = 'josh',
          conversant = 'nancy',
          menuText = "What are you doing here?",
          dialogueText = {
            "What are you doing here? This isn’t your place anymore, remember?",
          },
          conditionsString = '',
          links = {
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 4,
              destinationDialogId = 5,
              isConnector = false,
            },
          },
        },
        dialog5 = {
          isRoot = false,
          isGroup = false,
          actor = 'nancy',
          conversant = 'josh',
          menuText = "",
          dialogueText = {
            "Please, spare me the drama.",
            " I’m only looking for Bobby.",
          },
          conditionsString = '',
          links = {
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 5,
              destinationDialogId = 6,
              isConnector = false,
            },
          },
        },
        dialog6 = {
          isRoot = false,
          isGroup = false,
          actor = 'josh',
          conversant = 'nancy',
          menuText = "",
          dialogueText = {
            "Well, he ain't here.",
          },
          conditionsString = '',
          links = {
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 6,
              destinationDialogId = 3,
              isConnector = true,
            },
          },
        },
        dialog7 = {
          isRoot = false,
          isGroup = false,
          actor = 'josh',
          conversant = 'nancy',
          menuText = "What’s this all about?",
          dialogueText = {
            "What’s this all about?",
            " I thought you and Bob had a gig to go to last night.",
          },
          conditionsString = 'dialog.currentConversation.dialogEntries.dialog7.SimStatus ~= "WasDisplayed"',
          links = {
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 7,
              destinationDialogId = 8,
              isConnector = false,
            },
          },
        },
        dialog8 = {
          isRoot = false,
          isGroup = false,
          actor = 'nancy',
          conversant = 'josh',
          menuText = "",
          dialogueText = {
            "Not that it’s any of your business anymore, but yeah, we did.",
            " At least until that insulin-dependant wetback friend of yours left me hangin mid concert.",
            " Oh, he’s got another thing coming when I get my hands on him...",
          },
          conditionsString = '',
          links = {
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 8,
              destinationDialogId = 9,
              isConnector = false,
            },
          },
        },
        dialog9 = {
          isRoot = false,
          isGroup = false,
          actor = 'josh',
          conversant = 'josh',
          menuText = "",
          dialogueText = {
            "No wonder he bailed...",
          },
          conditionsString = '',
          links = {
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 9,
              destinationDialogId = 10,
              isConnector = false,
            },
          },
        },
        dialog10 = {
          isRoot = false,
          isGroup = false,
          actor = 'nancy',
          conversant = 'josh',
          menuText = "",
          dialogueText = {
            "I heard that!",
          },
          conditionsString = '',
          links = {
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 10,
              destinationDialogId = 3,
              isConnector = true,
            },
          },
        },
        dialog11 = {
          isRoot = false,
          isGroup = false,
          actor = 'josh',
          conversant = 'nancy',
          menuText = "So you are just going to wait?",
          dialogueText = {
            "So you are just going to wait him out? Here?",
          },
          conditionsString = 'dialog.currentConversation.dialogEntries.dialog7.SimStatus == "WasDisplayed"',
          links = {
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 11,
              destinationDialogId = 12,
              isConnector = false,
            },
          },
        },
        dialog12 = {
          isRoot = false,
          isGroup = false,
          actor = 'nancy',
          conversant = 'josh',
          menuText = "",
          dialogueText = {
            "I guess.",
          },
          conditionsString = '',
          links = {
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 12,
              destinationDialogId = 13,
              isConnector = false,
            },
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 12,
              destinationDialogId = 18,
              isConnector = false,
            },
          },
        },
        dialog13 = {
          isRoot = false,
          isGroup = false,
          actor = 'josh',
          conversant = 'nancy',
          menuText = "",
          dialogueText = {
            "By all means, make yourself at home.",
            " There’s fresh coffee in the kitchen.",
          },
          conditionsString = 'stateManager.dialogs.userVariables["SkipLoop"]== true',
          links = {
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 13,
              destinationDialogId = 3,
              isConnector = true,
            },
          },
        },
        dialog14 = {
          isRoot = false,
          isGroup = false,
          actor = 'josh',
          conversant = 'nancy',
          menuText = "Looking good, as usual.",
          dialogueText = {
            "Looking good, as usual.",
          },
          conditionsString = 'dialog.currentConversation.dialogEntries.dialog14.SimStatus ~= "WasDisplayed"',
          links = {
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 14,
              destinationDialogId = 15,
              isConnector = false,
            },
          },
        },
        dialog15 = {
          isRoot = false,
          isGroup = false,
          actor = 'nancy',
          conversant = 'josh',
          menuText = "",
          dialogueText = {
            "Oh, that’s so sweet of you Josh. Thanks!",
            " You look like shit yourself, too.",
          },
          conditionsString = '',
          links = {
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 15,
              destinationDialogId = 16,
              isConnector = false,
            },
          },
        },
        dialog16 = {
          isRoot = false,
          isGroup = false,
          actor = 'josh',
          conversant = 'nancy',
          menuText = "",
          dialogueText = {
            "Gee, thanks.",
          },
          conditionsString = '',
          links = {
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 16,
              destinationDialogId = 3,
              isConnector = true,
            },
          },
        },
        dialog17 = {
          isRoot = false,
          isGroup = false,
          actor = 'josh',
          conversant = 'nancy',
          menuText = "I'd love to stay, but...",
          dialogueText = {
            "Well, I’d love to stay and chat, but I’d rather chance I get run over by a bus.",
            " Bye.",
          },
          conditionsString = 'dialog.currentConversation.dialogEntries.dialog11.SimStatus == "WasDisplayed"',
          links = {
          },
        },
        dialog18 = {
          isRoot = false,
          isGroup = false,
          actor = 'nancy',
          conversant = 'josh',
          menuText = "",
          dialogueText = {
            "Hey, what's this?",
          },
          conditionsString = 'stateManager.dialogs.userVariables["MessagePlayed"]== false',
          userScript = function()
            stateManager.dialogs.userVariables["SkipLoop"]= true
          end,
          links = {
            {
              originConversationId = 1,
              destinationConversationId = 2,
              originDialogId = 18,
              destinationDialogId = 0,
              isConnector = true,
            },
          },
        },
    },
  },
  
  message = {
    actor = 'ansaphone',
    conversant = 'josh',
    dialogEntries = {
        dialog0 = {
          isRoot = true,
          isGroup = false,
          actor = 'ansaphone',
          conversant = 'josh',
          menuText = "",
          conditionsString = 'stateManager.dialogs.userVariables["MessagePlayed"]== false',
          userScript = function()
            stateManager.dialogs.userVariables["SkipLoop"]= true
          end,
          links = {
            {
              originConversationId = 2,
              destinationConversationId = 2,
              originDialogId = 0,
              destinationDialogId = 1,
              isConnector = false,
            },
          },
        },
        dialog1 = {
          isRoot = false,
          isGroup = false,
          actor = 'ansaphone',
          conversant = 'josh',
          menuText = "",
          dialogueText = {
            "This is a message for Mr. Sanchez from Dr. Porta’s office.",
            " Mr. Sanchez has once again missed his appointment for his check-up this morning.",
            " Please have him call us at his earliest convenience to reschedule.",
            " I shouldn’t have to stress how important regular controls are for an individual with his condition,",
            " so please contact Dr. Porta immediately.",
          },
          conditionsString = '',
          links = {
            {
              originConversationId = 2,
              destinationConversationId = 2,
              originDialogId = 1,
              destinationDialogId = 2,
              isConnector = false,
            },
          },
        },
        dialog2 = {
          isRoot = false,
          isGroup = false,
          actor = 'josh',
          conversant = 'josh',
          menuText = "",
          dialogueText = {
            "Wow, she sounds pretty steamed.",
            " Then again, Bobby rarely bother to check his glucose levels before shooting up...",
            " So why would I expect him to keep a doctor’s appointment?",
          },
          conditionsString = '',
          userScript = function()
            stateManager.dialogs.userVariables["MessagePlayed"]= true
          end,
          links = {
            {
              originConversationId = 2,
              destinationConversationId = 2,
              originDialogId = 2,
              destinationDialogId = 3,
              isConnector = false,
            },
            {
              originConversationId = 2,
              destinationConversationId = 2,
              originDialogId = 2,
              destinationDialogId = 4,
              isConnector = false,
            },
          },
        },
        dialog3 = {
          isRoot = false,
          isGroup = false,
          actor = 'josh',
          conversant = 'josh',
          menuText = "",
          dialogueText = {
            "Hmm...",
          },
          conditionsString = 'stateManager.dialogs.userVariables["SkipLoop"]== false',
          links = {
          },
        },
        dialog4 = {
          isRoot = false,
          isGroup = false,
          actor = 'josh',
          conversant = 'josh',
          menuText = "",
          dialogueText = {
            "Anyway...",
          },
          conditionsString = 'stateManager.dialogs.userVariables["SkipLoop"]== true',
          links = {
            {
              originConversationId = 2,
              destinationConversationId = 1,
              originDialogId = 4,
              destinationDialogId = 0,
              isConnector = true,
            },
          },
        },
    },
  },
  
  fridge = {
    actor = 'josh',
    conversant = 'josh',
    dialogEntries = {
        dialog0 = {
          isRoot = true,
          isGroup = false,
          actor = 'josh',
          conversant = 'josh',
          menuText = "",
          conditionsString = '',
          links = {
            {
              originConversationId = 3,
              destinationConversationId = 3,
              originDialogId = 0,
              destinationDialogId = 1,
              isConnector = false,
            },
          },
        },
        dialog1 = {
          isRoot = false,
          isGroup = false,
          actor = 'josh',
          conversant = 'josh',
          menuText = "",
          dialogueText = {
            "Hmm...",
          },
          conditionsString = '',
          userScript = function()
            stateManager.dialogs.userVariables["FreezerOptions"]= math.random(3)
          end,
          links = {
            {
              originConversationId = 3,
              destinationConversationId = 3,
              originDialogId = 1,
              destinationDialogId = 2,
              isConnector = false,
            },
          },
        },
        dialog2 = {
          isRoot = false,
          isGroup = true,
          actor = 'josh',
          conversant = 'josh',
          menuText = "",
          conditionsString = '',
          links = {
            {
              originConversationId = 3,
              destinationConversationId = 3,
              originDialogId = 2,
              destinationDialogId = 3,
              isConnector = false,
            },
            {
              originConversationId = 3,
              destinationConversationId = 3,
              originDialogId = 2,
              destinationDialogId = 4,
              isConnector = false,
            },
            {
              originConversationId = 3,
              destinationConversationId = 3,
              originDialogId = 2,
              destinationDialogId = 5,
              isConnector = false,
            },
          },
        },
        dialog3 = {
          isRoot = false,
          isGroup = false,
          actor = 'josh',
          conversant = 'josh',
          menuText = "",
          dialogueText = {
            "This reminds me of a postcard from Siberia I saw once. But bleaker.",
          },
          conditionsString = 'stateManager.dialogs.userVariables["FreezerOptions"]== 1',
          links = {
          },
        },
        dialog4 = {
          isRoot = false,
          isGroup = false,
          actor = 'josh',
          conversant = 'josh',
          menuText = "",
          dialogueText = {
            "I may not be an expert, but I don’t think this is what they mean by “Insulin Dependency”.",
          },
          conditionsString = 'stateManager.dialogs.userVariables["FreezerOptions"]== 2',
          links = {
          },
        },
        dialog5 = {
          isRoot = false,
          isGroup = false,
          actor = 'josh',
          conversant = 'josh',
          menuText = "",
          dialogueText = {
            "The emptiest, saddest fridge I ever did see.",
          },
          conditionsString = 'stateManager.dialogs.userVariables["FreezerOptions"]== 3',
          links = {
          },
        },
    },
  },
  
  freezer = {
    actor = 'josh',
    conversant = 'josh',
    dialogEntries = {
        dialog0 = {
          isRoot = true,
          isGroup = false,
          actor = 'josh',
          conversant = 'josh',
          menuText = "",
          conditionsString = '',
          links = {
            {
              originConversationId = 4,
              destinationConversationId = 4,
              originDialogId = 0,
              destinationDialogId = 1,
              isConnector = false,
            },
          },
        },
        dialog1 = {
          isRoot = false,
          isGroup = false,
          actor = 'josh',
          conversant = 'josh',
          menuText = "",
          dialogueText = {
            "A Frozen, Barren Wasteland.",
          },
          conditionsString = '',
          links = {
          },
        },
    },
  },
  
  coffeebag = {
    actor = 'josh',
    conversant = 'josh',
    dialogEntries = {
        dialog0 = {
          isRoot = true,
          isGroup = false,
          actor = 'josh',
          conversant = 'josh',
          menuText = "",
          conditionsString = '',
          links = {
            {
              originConversationId = 5,
              destinationConversationId = 5,
              originDialogId = 0,
              destinationDialogId = 1,
              isConnector = false,
            },
          },
        },
        dialog1 = {
          isRoot = false,
          isGroup = false,
          actor = 'josh',
          conversant = 'josh',
          menuText = "",
          dialogueText = {
            "The Finest and Least Expensive Coffee from the Nearest Convenience Store.",
          },
          conditionsString = '',
          links = {
          },
        },
    },
  },
  
  coffeemaker = {
    actor = 'josh',
    conversant = 'josh',
    dialogEntries = {
        dialog0 = {
          isRoot = true,
          isGroup = false,
          actor = 'josh',
          conversant = 'josh',
          menuText = "",
          conditionsString = '',
          links = {
            {
              originConversationId = 6,
              destinationConversationId = 6,
              originDialogId = 0,
              destinationDialogId = 1,
              isConnector = false,
            },
          },
        },
        dialog1 = {
          isRoot = false,
          isGroup = false,
          actor = 'josh',
          conversant = 'josh',
          menuText = "",
          dialogueText = {
            "Ah, The Trusty Caffeinator 3000.",
            " A wondrous device that magically transforms plain water and ground beans into liquid energy.",
          },
          conditionsString = '',
          links = {
          },
        },
    },
  },
  
  cofeepot = {
    actor = 'josh',
    conversant = 'josh',
    dialogEntries = {
        dialog0 = {
          isRoot = true,
          isGroup = false,
          actor = 'josh',
          conversant = 'josh',
          menuText = "",
          conditionsString = '',
          links = {
            {
              originConversationId = 7,
              destinationConversationId = 7,
              originDialogId = 0,
              destinationDialogId = 1,
              isConnector = false,
            },
          },
        },
        dialog1 = {
          isRoot = false,
          isGroup = false,
          actor = 'josh',
          conversant = 'josh',
          menuText = "",
          dialogueText = {
            "A Pot of Bile-Tasting Sludge.",
          },
          conditionsString = '',
          links = {
          },
        },
    },
  },
  
  coffeemug = {
    actor = 'josh',
    conversant = 'josh',
    dialogEntries = {
        dialog0 = {
          isRoot = true,
          isGroup = false,
          actor = 'josh',
          conversant = 'josh',
          menuText = "",
          conditionsString = '',
          links = {
            {
              originConversationId = 8,
              destinationConversationId = 8,
              originDialogId = 0,
              destinationDialogId = 1,
              isConnector = false,
            },
          },
        },
        dialog1 = {
          isRoot = false,
          isGroup = false,
          actor = 'josh',
          conversant = 'josh',
          menuText = "",
          dialogueText = {
            "That’s the nastiest Cup of Joe I’ve ever tasted.",
            " And I’ve been to Europe.",
          },
          conditionsString = '',
          links = {
          },
        },
    },
  },
  
  bathroom = {
    actor = 'josh',
    conversant = 'josh',
    dialogEntries = {
        dialog0 = {
          isRoot = true,
          isGroup = false,
          actor = 'josh',
          conversant = 'josh',
          menuText = "",
          conditionsString = '',
          links = {
            {
              originConversationId = 9,
              destinationConversationId = 9,
              originDialogId = 0,
              destinationDialogId = 1,
              isConnector = false,
            },
            {
              originConversationId = 9,
              destinationConversationId = 9,
              originDialogId = 0,
              destinationDialogId = 2,
              isConnector = false,
            },
          },
        },
        dialog1 = {
          isRoot = false,
          isGroup = false,
          actor = 'josh',
          conversant = 'josh',
          menuText = "",
          dialogueText = {
            "Believe me, you didn’t want to see the inside of that.",
          },
          conditionsString = 'dialog.currentConversation.dialogEntries.dialog1.SimStatus ~= "WasDisplayed"',
          links = {
          },
        },
        dialog2 = {
          isRoot = false,
          isGroup = false,
          actor = 'josh',
          conversant = 'josh',
          menuText = "",
          dialogueText = {
            "I’ll have to give a stern talk to Bobby about proper Toilet Etiquette.",
            " Again.",
          },
          conditionsString = 'dialog.currentConversation.dialogEntries.dialog1.SimStatus == "WasDisplayed"',
          links = {
          },
        },
    },
  },
  
  flyer = {
    actor = 'josh',
    conversant = 'josh',
    dialogEntries = {
        dialog0 = {
          isRoot = true,
          isGroup = false,
          actor = 'josh',
          conversant = 'josh',
          menuText = "",
          conditionsString = '',
          links = {
            {
              originConversationId = 10,
              destinationConversationId = 10,
              originDialogId = 0,
              destinationDialogId = 1,
              isConnector = false,
            },
          },
        },
        dialog1 = {
          isRoot = false,
          isGroup = false,
          actor = 'josh',
          conversant = 'josh',
          menuText = "",
          dialogueText = {
            "“Yard Sale Fair at Town Square - Our junk could be your Treasure”.",
            " I must have left this here to remember... Something.",
            " Oh, that’s right!",
            " The LPs Guy... What was his name?",
            " Bah, I’ll find him here I guess.",
            " Hey! It even has a small map of town with the Fair marked down!",
          },
          conditionsString = '',
          links = {
          },
        },
    },
  },
  
}
