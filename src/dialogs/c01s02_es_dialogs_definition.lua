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
            "¡Bobby! ¡Me dejaste plantada anoche, imbécil!",
            "Juro por Dios, tomaré un kilo de azúcar y lo usaré como lo haría Tony Montana, pedazo de -",
            "Oh, sólo eres tú.",
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
            "Buenos días tengas tú también, Nancy.",
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
            "¿Qué estás haciendo aquí? Esta ya no es tu casa, ¿recuerdas?",
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
            "Por favor, ahórrame el drama.",
            "Sólo estoy buscando a Bobby.",
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
            "Bueno, pues no está aquí.",
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
            "¿De qué se trata todo esto?",
            "Pensé que tú y Bob tenían una actuación a la que ir anoche.",
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
            "No es que sea de tu incumbencia ahora, pero sí, así fue.",
            "Al menos hasta que ese insulinodependiente espalda mojada amigo tuyo me dejó plantada en medio del concierto.",
            "Oh, no sabe lo que le espera cuando le ponga las manos encima...",
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
            "Con razón huyó...",
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
            "¡Escuché eso!",
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
            "¿Entonces simplemente vas a esperarlo? ¿Aquí?",
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
            "Supongo.",
          },
          conditionsString = '',
          userScript = function()
            stateManager.dialogs.userVariables["SkipLoop"]= true
          end,
          links = {
            {
              originConversationId = 1,
              destinationConversationId = 1,
              originDialogId = 12,
              destinationDialogId = 13,
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
            "Desde ya, siéntete como en tu casa.",
            "Hay café recién hecho en la cocina.",
          },
          conditionsString = 'stateManager.dialogs.userVariables["SkipLoop"]== true',
          links = {
          },
        },
        dialog14 = {
          isRoot = false,
          isGroup = false,
          actor = 'josh',
          conversant = 'nancy',
          menuText = "Looking good, as usual.",
          dialogueText = {
            "Te ves bien, como de costumbre.",
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
            "Oh, eso es muy dulce de tu parte, Josh. ¡Gracias!",
            "Tú también te ves como la mierda.",
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
            "Ay, gracias.",
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
            "Bueno, me encantaría quedarme y charlar, pero prefiero arriesgarme a que me atropelle un autobús.",
            "Adiós.",
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
            "Oye, ¿qué es esto?",
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
            "Este es un mensaje para el Sr. Sanchez de la oficina del Dr. Porta.",
            "El Sr. Sanchez una vez más no ha asistido a la cita para su revisión esta mañana.",
            "Por favor, que nos llame tan pronto como le sea posible para reprogramar la cita.",
            "No necesito enfatizar cuán importantes son los controles regulares para un individuo con su condición,",
            "así que por favor póngase en contacto con el Dr. Porta de inmediato.",
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
            "Caramba, suena bastante alterada.",
            "Por otra parte, Bobby rara vez se molesta en verificar su nivel de glucosa antes de inyectarse...",
            "Así que ¿por qué habría yo de esperar que mantenga una cita con el doctor?",
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
            "En fin...",
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
            "Esto me recuerda a una postal de Siberia que vi una vez. Pero más lúgubre.",
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
            "Puede que no sea un experto, pero no creo que esto es lo que quieren decir con “insulinodependencia”.",
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
            "La nevera más vacía y triste que he visto alguna vez.",
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
            "Un yermo helado y desierto.",
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
            "El más selecto y menos costoso café de la tienda más cercana.",
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
            "Ah, la confiable Caffeinator 3000.",
            "Un maravilloso artefacto que mágicamente transforma agua común y granos molidos en energía líquida.",
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
            "Una olla de fango con sabor a bilis.",
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
            "Es la taza de café más asquerosa que he probado.",
            "Y he estado en Europa.",
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
            "Créeme, no querrías haber visto el interior de eso.",
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
            "Tendré que hablar severamente con Bobby acerca de la etiqueta apropiada en el cuarto de baño.",
            "Otra vez.",
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
            "“Feria de ventas en la plaza mayor - nuestra basura podría ser tu tesoro.”",
            "Debo de haber dejado esto aquí para recordar... algo.",
            "¡Oh, es cierto!",
            "El tipo de los vinilos... ¿Cuál era su nombre?",
            "Bah, supongo que lo encontraré aquí.",
            "¡Eh! ¡Hasta tiene un pequeño mapa del pueblo con la feria marcada!",
          },
          conditionsString = '',
          links = {
          },
        },
    },
  },
  
  locked = {
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
              originConversationId = 11,
              destinationConversationId = 11,
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
            "Está cerrada con llave.",
          },
          conditionsString = '',
          links = {
          },
        },
    },
  },
  
  tv = {
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
              originConversationId = 12,
              destinationConversationId = 12,
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
            "57 canales y nada para ver.",
          },
          conditionsString = '',
          links = {
          },
        },
    },
  },
  
  left_bathroom = {
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
              originConversationId = 13,
              destinationConversationId = 13,
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
            "Créeme, no querrías haber visto el interior de eso.",
          },
          conditionsString = '',
          links = {
          },
        },
    },
  },
  
  bathroom_1 = {
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
              originConversationId = 14,
              destinationConversationId = 14,
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
            "Con una vez sobra, gracias.",
          },
          conditionsString = '',
          links = {
          },
        },
    },
  },
  
  bathroom_2 = {
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
              originConversationId = 15,
              destinationConversationId = 15,
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
            "Tendré que hablar severamente con Bobby acerca de la etiqueta apropiada en el cuarto de baño. Otra vez.",
          },
          conditionsString = '',
          links = {
          },
        },
    },
  },
  
  coffee_pot_with_water = {
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
              originConversationId = 16,
              destinationConversationId = 16,
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
            "Ya he llenado la jarra de café.",
          },
          conditionsString = '',
          links = {
          },
        },
    },
  },
  
  fill_coffee_pot_first = {
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
              originConversationId = 17,
              destinationConversationId = 17,
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
            "Debería llenar la jarra de café antes.",
          },
          conditionsString = '',
          links = {
          },
        },
    },
  },
  
  stole_mug = {
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
              originConversationId = 18,
              destinationConversationId = 18,
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
            "Como que robé esa taza de un estudio de desarrollo de juegos al azar.",
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
              originConversationId = 19,
              destinationConversationId = 19,
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
            "No estoy dispuesto a comenzar mi día con aliento de zombi. Nadie se merece algo así de malo.",
          },
          conditionsString = '',
          links = {
          },
        },
    },
  },
  
  coffee = {
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
              originConversationId = 20,
              destinationConversationId = 20,
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
            "No creo estar verdaderamente listo para enfrentar a la humanidad a menos que haya ingerido algo para despertar por completo.",
          },
          conditionsString = '',
          links = {
          },
        },
    },
  },
  
  bathroom_and_coffee = {
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
              originConversationId = 21,
              destinationConversationId = 21,
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
            "Sin cepillo de dientes y sin café no hay mañana. Así son las cosas.",
          },
          conditionsString = '',
          links = {
          },
        },
    },
  },
  
}
