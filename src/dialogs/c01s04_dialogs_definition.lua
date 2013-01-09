c01s04_conversations = {
  
  userVariables = {
    password = {
      initialValue = 1,
    },
    ribbon = {
      initialValue = false,
    },
    backstage = {
      initialValue = false,
    },
  },
  
  moe = {
    actor = 'josh',
    conversant = 'maureen',
    dialogEntries = {
        dialog0 = {
          isRoot = true,
          isGroup = false,
          actor = 'josh',
          conversant = 'maureen',
          menuText = "",
          conditionsString = '',
          links = {
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 0,
              destinationDialogId = 1,
              isConnector = false,
            },
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 0,
              destinationDialogId = 3,
              isConnector = false,
            },
          },
        },
        dialog1 = {
          isRoot = false,
          isGroup = false,
          actor = 'josh',
          conversant = 'maureen',
          menuText = "",
          dialogueText = {
            "Hello, Moe",
          },
          conditionsString = 'dialog.currentConversation.dialogEntries.dialog1.SimStatus ~= "WasDisplayed"',
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
          actor = 'maureen',
          conversant = 'josh',
          menuText = "",
          dialogueText = {
            "Oh, Hi Josh. What's up?",
          },
          conditionsString = '',
          links = {
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 2,
              destinationDialogId = 6,
              isConnector = false,
            },
          },
        },
        dialog3 = {
          isRoot = false,
          isGroup = false,
          actor = 'josh',
          conversant = 'maureen',
          menuText = "",
          dialogueText = {
            "Hey, Moe...",
          },
          conditionsString = 'dialog.currentConversation.dialogEntries.dialog1.SimStatus == "WasDisplayed"',
          links = {
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 3,
              destinationDialogId = 4,
              isConnector = false,
            },
          },
        },
        dialog4 = {
          isRoot = false,
          isGroup = false,
          actor = 'maureen',
          conversant = 'josh',
          menuText = "",
          dialogueText = {
            "Yeah?",
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
          isGroup = true,
          actor = 'maureen',
          conversant = 'josh',
          menuText = "",
          conditionsString = '',
          links = {
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 5,
              destinationDialogId = 10,
              isConnector = false,
            },
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 5,
              destinationDialogId = 13,
              isConnector = false,
            },
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 5,
              destinationDialogId = 15,
              isConnector = false,
            },
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 5,
              destinationDialogId = 31,
              isConnector = false,
            },
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 5,
              destinationDialogId = 48,
              isConnector = false,
            },
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 5,
              destinationDialogId = 18,
              isConnector = false,
            },
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 5,
              destinationDialogId = 28,
              isConnector = false,
            },
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 5,
              destinationDialogId = 51,
              isConnector = false,
            },
          },
        },
        dialog6 = {
          isRoot = false,
          isGroup = false,
          actor = 'josh',
          conversant = 'maureen',
          menuText = "I got your message.",
          dialogueText = {
            "I got your message. What's going on?",
          },
          conditionsString = '',
          links = {
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 6,
              destinationDialogId = 7,
              isConnector = false,
            },
          },
        },
        dialog7 = {
          isRoot = false,
          isGroup = false,
          actor = 'maureen',
          conversant = 'josh',
          menuText = "",
          dialogueText = {
            "This is a bit silly, but... Have you seen Bobby around today?",
          },
          conditionsString = '',
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
          actor = 'josh',
          conversant = 'maureen',
          menuText = "",
          dialogueText = {
            "Not really.",
            " He wasn't home, so I figured he was down here.",
            " Setting up for tonight with you guys.",
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
          actor = 'maureen',
          conversant = 'josh',
          menuText = "",
          dialogueText = {
            "Well, he didn't show up here either.",
          },
          conditionsString = '',
          links = {
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 9,
              destinationDialogId = 5,
              isConnector = true,
            },
          },
        },
        dialog10 = {
          isRoot = false,
          isGroup = false,
          actor = 'josh',
          conversant = 'maureen',
          menuText = "That's Bobby for you.",
          dialogueText = {
            "That's Bobby for you. He misses a doctor appointment yesterday, misses his own sound check today...",
          },
          conditionsString = 'dialog.currentConversation.dialogEntries.dialog10.SimStatus ~= "WasDisplayed"',
          links = {
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 10,
              destinationDialogId = 11,
              isConnector = false,
            },
          },
        },
        dialog11 = {
          isRoot = false,
          isGroup = false,
          actor = 'maureen',
          conversant = 'josh',
          menuText = "",
          dialogueText = {
            "I saw him yesterday, he was going to some gig with the boys.",
            " He didn't seem sick, anyway. Is anything wrong?",
          },
          conditionsString = '',
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
          actor = 'josh',
          conversant = 'maureen',
          menuText = "",
          dialogueText = {
            "Nah, just a regular control I guess.",
            " If he took care of his glucose levels on his own without having half the city chasing after him it just wouldn't be the same.",
          },
          conditionsString = '',
          links = {
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 12,
              destinationDialogId = 5,
              isConnector = true,
            },
          },
        },
        dialog13 = {
          isRoot = false,
          isGroup = false,
          actor = 'josh',
          conversant = 'maureen',
          menuText = "Where was it you saw Bobby?",
          dialogueText = {
            "Where was it you saw Bobby last night?",
          },
          conditionsString = 'dialog.currentConversation.dialogEntries.dialog10.SimStatus == "WasDisplayed"',
          links = {
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 13,
              destinationDialogId = 14,
              isConnector = false,
            },
          },
        },
        dialog14 = {
          isRoot = false,
          isGroup = false,
          actor = 'maureen',
          conversant = 'josh',
          menuText = "",
          dialogueText = {
            "He went to check out some band with Ray, I don't quite remember where.",
            " Maybe you should ask him.",
          },
          conditionsString = '',
          links = {
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 14,
              destinationDialogId = 5,
              isConnector = true,
            },
          },
        },
        dialog15 = {
          isRoot = false,
          isGroup = false,
          actor = 'josh',
          conversant = 'maureen',
          menuText = "Nancy dropped by earlier today...",
          dialogueText = {
            "Hm... Nancy dropped by the appartment earlier today looking for Bob.",
            " She seemed pretty steamed, too.",
          },
          conditionsString = 'dialog.currentConversation.dialogEntries.dialog15.SimStatus ~= "WasDisplayed" and dialog.currentConversation.dialogEntries.dialog31.SimStatus ~= "WasDisplayed"',
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
          actor = 'maureen',
          conversant = 'josh',
          menuText = "",
          dialogueText = {
            "So, I guess he's not at his place either.",
          },
          conditionsString = '',
          links = {
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 16,
              destinationDialogId = 17,
              isConnector = false,
            },
          },
        },
        dialog17 = {
          isRoot = false,
          isGroup = false,
          actor = 'josh',
          conversant = 'maureen',
          menuText = "",
          dialogueText = {
            "The mood Nancy was in I guess that's all for the better.",
            " Unless you want to start auditioning for a new lead singer for tonight.",
          },
          conditionsString = '',
          links = {
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 17,
              destinationDialogId = 5,
              isConnector = true,
            },
          },
        },
        dialog18 = {
          isRoot = false,
          isGroup = false,
          actor = 'josh',
          conversant = 'maureen',
          menuText = "How's the Band doing?",
          dialogueText = {
            "How's the Band doing?",
          },
          conditionsString = 'dialog.currentConversation.dialogEntries.dialog18.SimStatus ~= "WasDisplayed"',
          links = {
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 18,
              destinationDialogId = 19,
              isConnector = false,
            },
          },
        },
        dialog19 = {
          isRoot = false,
          isGroup = false,
          actor = 'maureen',
          conversant = 'josh',
          menuText = "",
          dialogueText = {
            "We're doing OK, I guess. How about you?",
            " I've - I mean, the boys and I, we haven't heard much from you since... since...",
          },
          conditionsString = '',
          links = {
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 19,
              destinationDialogId = 20,
              isConnector = false,
            },
          },
        },
        dialog20 = {
          isRoot = false,
          isGroup = true,
          actor = 'maureen',
          conversant = 'josh',
          menuText = "",
          conditionsString = '',
          links = {
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 20,
              destinationDialogId = 21,
              isConnector = false,
            },
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 20,
              destinationDialogId = 22,
              isConnector = false,
            },
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 20,
              destinationDialogId = 23,
              isConnector = false,
            },
          },
        },
        dialog21 = {
          isRoot = false,
          isGroup = false,
          actor = 'josh',
          conversant = 'maureen',
          menuText = "Since my girlfriend hooked up with my best friend?",
          dialogueText = {
            "Yeah, it's been a while.",
            " I'm doing fine.",
          },
          conditionsString = '',
          links = {
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 21,
              destinationDialogId = 24,
              isConnector = true,
            },
          },
        },
        dialog22 = {
          isRoot = false,
          isGroup = false,
          actor = 'josh',
          conversant = 'maureen',
          menuText = "Since Bobby screwed me and my ex (literally)?",
          dialogueText = {
            "Yeah, it's been a while.",
            " I'm doing fine.",
          },
          conditionsString = '',
          links = {
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 22,
              destinationDialogId = 24,
              isConnector = true,
            },
          },
        },
        dialog23 = {
          isRoot = false,
          isGroup = false,
          actor = 'josh',
          conversant = 'maureen',
          menuText = "Yeah, it's been a while.",
          dialogueText = {
            "Yeah, it's been a while.",
            " I'm doing fine.",
          },
          conditionsString = '',
          links = {
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 23,
              destinationDialogId = 24,
              isConnector = false,
            },
          },
        },
        dialog24 = {
          isRoot = false,
          isGroup = false,
          actor = 'maureen',
          conversant = 'josh',
          menuText = "",
          dialogueText = {
            "You sure? You don't look so good.",
          },
          conditionsString = '',
          links = {
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 24,
              destinationDialogId = 25,
              isConnector = false,
            },
          },
        },
        dialog25 = {
          isRoot = false,
          isGroup = false,
          actor = 'josh',
          conversant = 'maureen',
          menuText = "",
          dialogueText = {
            "Gee, Thanks.",
            " You are the sencond person to notice that today.",
          },
          conditionsString = '',
          links = {
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 25,
              destinationDialogId = 26,
              isConnector = false,
            },
          },
        },
        dialog26 = {
          isRoot = false,
          isGroup = false,
          actor = 'maureen',
          conversant = 'josh',
          menuText = "",
          dialogueText = {
            "I mean, I've always thought you were good looking and all, I just-",
            " Oh my god, I didn't mean to come across like that, it's not like like I was hitting on you or anything.",
            " I mean, you are a cute guy, objectively speaking, but...",
            " I wasn't...",
            " ...",
            " You sure you are OK?",
            " Not that it's any of my business...",
          },
          conditionsString = '',
          links = {
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 26,
              destinationDialogId = 27,
              isConnector = false,
            },
          },
        },
        dialog27 = {
          isRoot = false,
          isGroup = false,
          actor = 'josh',
          conversant = 'maureen',
          menuText = "",
          dialogueText = {
            "It's OK, Moe. I'm alright.",
          },
          conditionsString = '',
          links = {
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 27,
              destinationDialogId = 5,
              isConnector = true,
            },
          },
        },
        dialog28 = {
          isRoot = false,
          isGroup = false,
          actor = 'josh',
          conversant = 'maureen',
          menuText = "You are looking good yourself, Moe.",
          dialogueText = {
            "You are looking good yourself, Moe. Is that shirt new?",
          },
          conditionsString = 'dialog.currentConversation.dialogEntries.dialog18.SimStatus == "WasDisplayed"',
          links = {
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 28,
              destinationDialogId = 29,
              isConnector = false,
            },
          },
        },
        dialog29 = {
          isRoot = false,
          isGroup = false,
          actor = 'maureen',
          conversant = 'josh',
          menuText = "",
          dialogueText = {
            "Oh, you noticed? I mean-",
            " Yeah. Well, not really.",
            " I picked it up a few days ago for tonight's show. 12 cents at the Salvation Army.",
            " A real steal.",
          },
          conditionsString = '',
          links = {
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 29,
              destinationDialogId = 30,
              isConnector = false,
            },
          },
        },
        dialog30 = {
          isRoot = false,
          isGroup = false,
          actor = 'josh',
          conversant = 'maureen',
          menuText = "",
          dialogueText = {
            "Well, it's worth every penny.",
          },
          conditionsString = '',
          links = {
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 30,
              destinationDialogId = 5,
              isConnector = true,
            },
          },
        },
        dialog31 = {
          isRoot = false,
          isGroup = false,
          actor = 'josh',
          conversant = 'maureen',
          menuText = "I guess he'll turn up eventually.",
          dialogueText = {
            "I guess he'll turn up eventually.",
            " He almost always does, anyway.",
          },
          conditionsString = 'dialog.currentConversation.dialogEntries.dialog12.SimStatus == "WasDisplayed" and dialog.currentConversation.dialogEntries.dialog31.SimStatus ~= "WasDisplayed"',
          userScript = function()
            stateManager.state.dialogs.userVariables["ribbon"]= true
          end,
          links = {
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 31,
              destinationDialogId = 32,
              isConnector = false,
            },
          },
        },
        dialog32 = {
          isRoot = false,
          isGroup = false,
          actor = 'maureen',
          conversant = 'josh',
          menuText = "",
          dialogueText = {
            "Yeah, I guess you are right, but...",
          },
          conditionsString = '',
          links = {
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 32,
              destinationDialogId = 33,
              isConnector = false,
            },
          },
        },
        dialog33 = {
          isRoot = false,
          isGroup = false,
          actor = 'josh',
          conversant = 'maureen',
          menuText = "",
          dialogueText = {
            "What is it?",
          },
          conditionsString = '',
          links = {
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 33,
              destinationDialogId = 34,
              isConnector = false,
            },
          },
        },
        dialog34 = {
          isRoot = false,
          isGroup = false,
          actor = 'maureen',
          conversant = 'josh',
          menuText = "",
          dialogueText = {
            "It's nothing, it's just...",
            " Well, this is a pretty big gig for us, and Bobby is a bit... Well, you know how he is.",
            " Could you please keep an eye out for him?",
          },
          conditionsString = '',
          links = {
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 34,
              destinationDialogId = 35,
              isConnector = false,
            },
          },
        },
        dialog35 = {
          isRoot = false,
          isGroup = true,
          actor = 'maureen',
          conversant = 'josh',
          menuText = "",
          conditionsString = '',
          links = {
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 35,
              destinationDialogId = 36,
              isConnector = false,
            },
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 35,
              destinationDialogId = 38,
              isConnector = false,
            },
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 35,
              destinationDialogId = 40,
              isConnector = false,
            },
          },
        },
        dialog36 = {
          isRoot = false,
          isGroup = false,
          actor = 'josh',
          conversant = 'maureen',
          menuText = "I'm not his mother, you know?",
          dialogueText = {
            "I'm not his mother, you know?",
          },
          conditionsString = '',
          links = {
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 36,
              destinationDialogId = 37,
              isConnector = false,
            },
          },
        },
        dialog37 = {
          isRoot = false,
          isGroup = false,
          actor = 'maureen',
          conversant = 'josh',
          menuText = "",
          dialogueText = {
            "Oh, I didn't mean to... Nevermind.",
            " Could you please just ask around?\n",
          },
          conditionsString = '',
          links = {
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 37,
              destinationDialogId = 42,
              isConnector = true,
            },
          },
        },
        dialog38 = {
          isRoot = false,
          isGroup = false,
          actor = 'josh',
          conversant = 'maureen',
          menuText = " I'm sure he'll show up.",
          dialogueText = {
            " I'm sure he'll show up, sooner or later.",
          },
          conditionsString = '',
          links = {
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 38,
              destinationDialogId = 39,
              isConnector = false,
            },
          },
        },
        dialog39 = {
          isRoot = false,
          isGroup = false,
          actor = 'maureen',
          conversant = 'josh',
          menuText = "",
          dialogueText = {
            " I suppose...",
            " I'd just feel better knowing you are looking for him.",
          },
          conditionsString = '',
          links = {
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 39,
              destinationDialogId = 42,
              isConnector = true,
            },
          },
        },
        dialog40 = {
          isRoot = false,
          isGroup = false,
          actor = 'josh',
          conversant = 'maureen',
          menuText = "It's really that important to you, uh?",
          dialogueText = {
            "It's really that important to you, uh?",
          },
          conditionsString = '',
          links = {
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 40,
              destinationDialogId = 41,
              isConnector = false,
            },
          },
        },
        dialog41 = {
          isRoot = false,
          isGroup = false,
          actor = 'maureen',
          conversant = 'josh',
          menuText = "",
          dialogueText = {
            "Of course it is!",
            " We've got a show tonight, man!",
          },
          conditionsString = '',
          links = {
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 41,
              destinationDialogId = 42,
              isConnector = false,
            },
          },
        },
        dialog42 = {
          isRoot = false,
          isGroup = false,
          actor = 'josh',
          conversant = 'maureen',
          menuText = "",
          dialogueText = {
            "Alright, Maureen. I'll see what I can do.",
            " Just for you, tho.",
          },
          conditionsString = '',
          links = {
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 42,
              destinationDialogId = 43,
              isConnector = false,
            },
          },
        },
        dialog43 = {
          isRoot = false,
          isGroup = false,
          actor = 'maureen',
          conversant = 'josh',
          menuText = "",
          dialogueText = {
            "Really? Thanks!",
            " Oh Josh, I could kiss you right now.",
          },
          conditionsString = '',
          links = {
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 43,
              destinationDialogId = 44,
              isConnector = false,
            },
          },
        },
        dialog44 = {
          isRoot = false,
          isGroup = false,
          actor = 'josh',
          conversant = 'maureen',
          menuText = "",
          dialogueText = {
            " Let us not get ahead of ourselves, OK?",
          },
          conditionsString = '',
          links = {
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 44,
              destinationDialogId = 45,
              isConnector = false,
            },
          },
        },
        dialog45 = {
          isRoot = false,
          isGroup = false,
          actor = 'maureen',
          conversant = 'josh',
          menuText = "",
          dialogueText = {
            "What do you mean, ahead?",
            " Oh. Oh! Right.",
            " Here, take this.",
          },
          conditionsString = '',
          links = {
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 45,
              destinationDialogId = 46,
              isConnector = false,
            },
          },
        },
        dialog46 = {
          isRoot = false,
          isGroup = false,
          actor = 'josh',
          conversant = 'maureen',
          menuText = "",
          dialogueText = {
            "A fluorescent paper wristband?",
            " How fashionable. Thanks.",
          },
          conditionsString = '',
          links = {
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 46,
              destinationDialogId = 47,
              isConnector = false,
            },
          },
        },
        dialog47 = {
          isRoot = false,
          isGroup = false,
          actor = 'maureen',
          conversant = 'josh',
          menuText = "",
          dialogueText = {
            "It's to access the backstage, doofus.",
            " Just show that to the bouncer and hell let you through.",
          },
          conditionsString = '',
          links = {
          },
        },
        dialog48 = {
          isRoot = false,
          isGroup = false,
          actor = 'josh',
          conversant = 'maureen',
          menuText = "Where should I start looking?",
          dialogueText = {
            "Where should I start looking?",
          },
          conditionsString = 'dialog.currentConversation.dialogEntries.dialog31.SimStatus == "WasDisplayed"',
          links = {
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 48,
              destinationDialogId = 49,
              isConnector = false,
            },
          },
        },
        dialog49 = {
          isRoot = false,
          isGroup = false,
          actor = 'maureen',
          conversant = 'josh',
          menuText = "",
          dialogueText = {
            "I think he was out last night with Ray.",
            " You can find him backstage.",
          },
          conditionsString = '',
          links = {
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 49,
              destinationDialogId = 50,
              isConnector = false,
            },
          },
        },
        dialog50 = {
          isRoot = false,
          isGroup = false,
          actor = 'josh',
          conversant = 'maureen',
          menuText = "",
          dialogueText = {
            "Right. Thanks.",
          },
          conditionsString = '',
          links = {
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 50,
              destinationDialogId = 5,
              isConnector = true,
            },
          },
        },
        dialog51 = {
          isRoot = false,
          isGroup = false,
          actor = 'josh',
          conversant = 'maureen',
          menuText = "Well, I'll see what I can do.",
          dialogueText = {
            "Well, I'll see what I can do.",
            " See you around.",
          },
          conditionsString = 'dialog.currentConversation.dialogEntries.dialog31.SimStatus == "WasDisplayed"',
          links = {
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 51,
              destinationDialogId = 52,
              isConnector = false,
            },
          },
        },
        dialog52 = {
          isRoot = false,
          isGroup = false,
          actor = 'maureen',
          conversant = 'josh',
          menuText = "",
          dialogueText = {
            "Later, Josh. And thanks.",
          },
          conditionsString = '',
          links = {
          },
        },
    },
  },
  
  door = {
    actor = 'josh',
    conversant = 'bouncer',
    dialogEntries = {
        dialog0 = {
          isRoot = true,
          isGroup = false,
          actor = 'josh',
          conversant = 'bouncer',
          menuText = "",
          conditionsString = '',
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
          actor = 'bouncer',
          conversant = 'josh',
          menuText = "",
          dialogueText = {
            "Yeah?",
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
          isGroup = true,
          actor = 'bouncer',
          conversant = 'josh',
          menuText = "",
          conditionsString = '',
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
              destinationDialogId = 5,
              isConnector = false,
            },
            {
              originConversationId = 2,
              destinationConversationId = 2,
              originDialogId = 2,
              destinationDialogId = 7,
              isConnector = false,
            },
          },
        },
        dialog3 = {
          isRoot = false,
          isGroup = false,
          actor = 'josh',
          conversant = 'bouncer',
          menuText = "I'm selling this fine leather jackets...",
          dialogueText = {
            "I'm selling this fine leather jackets...",
          },
          conditionsString = '',
          links = {
            {
              originConversationId = 2,
              destinationConversationId = 2,
              originDialogId = 3,
              destinationDialogId = 4,
              isConnector = false,
            },
          },
        },
        dialog4 = {
          isRoot = false,
          isGroup = false,
          actor = 'bouncer',
          conversant = 'josh',
          menuText = "",
          dialogueText = {
            "Get lost, Kid.",
          },
          conditionsString = '',
          links = {
          },
        },
        dialog5 = {
          isRoot = false,
          isGroup = false,
          actor = 'josh',
          conversant = 'bouncer',
          menuText = "May I use your restroom?",
          dialogueText = {
            "I was just wondering if I could use your restroom really quick.",
          },
          conditionsString = '',
          links = {
            {
              originConversationId = 2,
              destinationConversationId = 2,
              originDialogId = 5,
              destinationDialogId = 6,
              isConnector = false,
            },
          },
        },
        dialog6 = {
          isRoot = false,
          isGroup = false,
          actor = 'bouncer',
          conversant = 'josh',
          menuText = "",
          dialogueText = {
            "Get lost, Kid.",
          },
          conditionsString = '',
          links = {
          },
        },
        dialog7 = {
          isRoot = false,
          isGroup = false,
          actor = 'josh',
          conversant = 'bouncer',
          menuText = "I'm with the band.",
          dialogueText = {
            "I'm with the band.",
          },
          conditionsString = '',
          links = {
            {
              originConversationId = 2,
              destinationConversationId = 2,
              originDialogId = 7,
              destinationDialogId = 8,
              isConnector = false,
            },
          },
        },
        dialog8 = {
          isRoot = false,
          isGroup = false,
          actor = 'bouncer',
          conversant = 'josh',
          menuText = "",
          dialogueText = {
            "You don't say...",
            " You must know the password, then.",
          },
          conditionsString = '',
          links = {
            {
              originConversationId = 2,
              destinationConversationId = 2,
              originDialogId = 8,
              destinationDialogId = 9,
              isConnector = false,
            },
          },
        },
        dialog9 = {
          isRoot = false,
          isGroup = true,
          actor = 'bouncer',
          conversant = 'josh',
          menuText = "",
          conditionsString = '',
          links = {
            {
              originConversationId = 2,
              destinationConversationId = 2,
              originDialogId = 9,
              destinationDialogId = 10,
              isConnector = false,
            },
            {
              originConversationId = 2,
              destinationConversationId = 2,
              originDialogId = 9,
              destinationDialogId = 21,
              isConnector = false,
            },
            {
              originConversationId = 2,
              destinationConversationId = 2,
              originDialogId = 9,
              destinationDialogId = 23,
              isConnector = false,
            },
          },
        },
        dialog10 = {
          isRoot = false,
          isGroup = false,
          actor = 'josh',
          conversant = 'bouncer',
          menuText = "Of course I know the password!",
          dialogueText = {
            "Of course I know the password!",
          },
          conditionsString = '',
          userScript = function()
            stateManager.state.dialogs.userVariables["password"]= math.random(6)
          end,
          links = {
            {
              originConversationId = 2,
              destinationConversationId = 2,
              originDialogId = 10,
              destinationDialogId = 11,
              isConnector = false,
            },
          },
        },
        dialog11 = {
          isRoot = false,
          isGroup = true,
          actor = 'josh',
          conversant = 'bouncer',
          menuText = "",
          conditionsString = '',
          links = {
            {
              originConversationId = 2,
              destinationConversationId = 2,
              originDialogId = 11,
              destinationDialogId = 14,
              isConnector = false,
            },
            {
              originConversationId = 2,
              destinationConversationId = 2,
              originDialogId = 11,
              destinationDialogId = 16,
              isConnector = false,
            },
            {
              originConversationId = 2,
              destinationConversationId = 2,
              originDialogId = 11,
              destinationDialogId = 17,
              isConnector = false,
            },
            {
              originConversationId = 2,
              destinationConversationId = 2,
              originDialogId = 11,
              destinationDialogId = 18,
              isConnector = false,
            },
            {
              originConversationId = 2,
              destinationConversationId = 2,
              originDialogId = 11,
              destinationDialogId = 19,
              isConnector = false,
            },
            {
              originConversationId = 2,
              destinationConversationId = 2,
              originDialogId = 11,
              destinationDialogId = 20,
              isConnector = false,
            },
            {
              originConversationId = 2,
              destinationConversationId = 2,
              originDialogId = 11,
              destinationDialogId = 12,
              isConnector = false,
            },
          },
        },
        dialog12 = {
          isRoot = false,
          isGroup = false,
          actor = 'josh',
          conversant = 'bouncer',
          menuText = "I give up.",
          dialogueText = {
            "I was just kidding, I have no idea what's the password.",
          },
          conditionsString = '',
          links = {
            {
              originConversationId = 2,
              destinationConversationId = 2,
              originDialogId = 12,
              destinationDialogId = 13,
              isConnector = false,
            },
          },
        },
        dialog13 = {
          isRoot = false,
          isGroup = false,
          actor = 'bouncer',
          conversant = 'josh',
          menuText = "",
          dialogueText = {
            "Get lost, Kid.",
          },
          conditionsString = '',
          links = {
          },
        },
        dialog14 = {
          isRoot = false,
          isGroup = false,
          actor = 'josh',
          conversant = 'bouncer',
          menuText = "Forty-Two?",
          dialogueText = {
            "Forty-Two?",
          },
          conditionsString = 'stateManager.state.dialogs.userVariables["password"]== 1',
          userScript = function()
            stateManager.state.dialogs.userVariables["password"]= math.random(6)
          end,
          links = {
            {
              originConversationId = 2,
              destinationConversationId = 2,
              originDialogId = 14,
              destinationDialogId = 15,
              isConnector = false,
            },
          },
        },
        dialog15 = {
          isRoot = false,
          isGroup = false,
          actor = 'bouncer',
          conversant = 'josh',
          menuText = "",
          dialogueText = {
            "Nope.",
          },
          conditionsString = '',
          links = {
            {
              originConversationId = 2,
              destinationConversationId = 2,
              originDialogId = 15,
              destinationDialogId = 11,
              isConnector = true,
            },
          },
        },
        dialog16 = {
          isRoot = false,
          isGroup = false,
          actor = 'josh',
          conversant = 'bouncer',
          menuText = "Banana?",
          dialogueText = {
            "It's \"banana\", isn't it?",
          },
          conditionsString = 'stateManager.state.dialogs.userVariables["password"]== 2',
          userScript = function()
            stateManager.state.dialogs.userVariables["password"]= math.random(6)
          end,
          links = {
            {
              originConversationId = 2,
              destinationConversationId = 2,
              originDialogId = 16,
              destinationDialogId = 15,
              isConnector = true,
            },
          },
        },
        dialog17 = {
          isRoot = false,
          isGroup = false,
          actor = 'josh',
          conversant = 'bouncer',
          menuText = "Supercalifragilisticexpialidocious!",
          dialogueText = {
            "Supercalifragilisticexpialidocious!",
          },
          conditionsString = 'stateManager.state.dialogs.userVariables["password"]== 3',
          userScript = function()
            stateManager.state.dialogs.userVariables["password"]= math.random(6)
          end,
          links = {
            {
              originConversationId = 2,
              destinationConversationId = 2,
              originDialogId = 17,
              destinationDialogId = 15,
              isConnector = true,
            },
          },
        },
        dialog18 = {
          isRoot = false,
          isGroup = false,
          actor = 'josh',
          conversant = 'bouncer',
          menuText = "12345?",
          dialogueText = {
            "12345",
          },
          conditionsString = 'stateManager.state.dialogs.userVariables["password"]== 4',
          userScript = function()
            stateManager.state.dialogs.userVariables["password"]= math.random(6)
          end,
          links = {
            {
              originConversationId = 2,
              destinationConversationId = 2,
              originDialogId = 18,
              destinationDialogId = 15,
              isConnector = true,
            },
          },
        },
        dialog19 = {
          isRoot = false,
          isGroup = false,
          actor = 'josh',
          conversant = 'bouncer',
          menuText = "Open, Sesame!",
          dialogueText = {
            "Open, Sesame!",
          },
          conditionsString = 'stateManager.state.dialogs.userVariables["password"]== 5',
          userScript = function()
            stateManager.state.dialogs.userVariables["password"]= math.random(6)
          end,
          links = {
            {
              originConversationId = 2,
              destinationConversationId = 2,
              originDialogId = 19,
              destinationDialogId = 15,
              isConnector = true,
            },
          },
        },
        dialog20 = {
          isRoot = false,
          isGroup = false,
          actor = 'josh',
          conversant = 'bouncer',
          menuText = "JOSHUA",
          dialogueText = {
            "JOSHUA",
          },
          conditionsString = 'stateManager.state.dialogs.userVariables["password"]== 6',
          userScript = function()
            stateManager.state.dialogs.userVariables["password"]= math.random(6)
          end,
          links = {
            {
              originConversationId = 2,
              destinationConversationId = 2,
              originDialogId = 20,
              destinationDialogId = 15,
              isConnector = true,
            },
          },
        },
        dialog21 = {
          isRoot = false,
          isGroup = false,
          actor = 'josh',
          conversant = 'bouncer',
          menuText = "There is no password!",
          dialogueText = {
            "There is no password!",
            " You are not really the bouncer, are you? Let me through!",
            " I want to speak to the manager!",
          },
          conditionsString = '',
          links = {
            {
              originConversationId = 2,
              destinationConversationId = 2,
              originDialogId = 21,
              destinationDialogId = 22,
              isConnector = false,
            },
          },
        },
        dialog22 = {
          isRoot = false,
          isGroup = false,
          actor = 'bouncer',
          conversant = 'josh',
          menuText = "",
          dialogueText = {
            "Get lost, Kid.",
          },
          conditionsString = '',
          links = {
          },
        },
        dialog23 = {
          isRoot = false,
          isGroup = false,
          actor = 'josh',
          conversant = 'bouncer',
          menuText = "I have this paper wristband.",
          dialogueText = {
            "No, but I have this fancy-looking paper wristband. Good enough?",
          },
          conditionsString = 'stateManager.state.dialogs.userVariables["ribbon"]== true',
          userScript = function()
            stateManager.state.dialogs.userVariables["backstage"]= true
          end,
          links = {
            {
              originConversationId = 2,
              destinationConversationId = 2,
              originDialogId = 23,
              destinationDialogId = 24,
              isConnector = false,
            },
          },
        },
        dialog24 = {
          isRoot = false,
          isGroup = false,
          actor = 'bouncer',
          conversant = 'josh',
          menuText = "",
          dialogueText = {
            "Yeah... That's OK I guess.",
            " Come on in",
          },
          conditionsString = '',
          links = {
          },
        },
    },
  },
  
}
