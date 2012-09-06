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
  options = {
    {
      label = "OK",
      action = DIALOG_ACTION_CLOSE
    }
  }
}

dialogTree.c01s01_never_sleeps = {
  text = {
    en_US = "This City Never Sleeps. It just lingers in a perpetual drowsiness",
    es_AR = ""
  },
  options = {
    {
      label = "OK",
      action = DIALOG_ACTION_CLOSE
    }
  }
}

dialogTree.c01s02_answering_machine_message = {
  text = {
    en_US = "This is a message for Mr. Sanchez from Dr. Porta's office. Mr. Sanchez has once again missed his appointment for his check-up this morning.",
    es_AR = ""
  },
  defaultAction = DIALOG_ACTION_REDIRECT,
  dialogName = 'c01s02_answering_machine_message_2'
}

dialogTree.c01s02_answering_machine_message_2 = {
  text = {
    en_US = "Please have him call us at his earliest convenince to reschedule. I shouldn't have to stress how important regular controls are for a person of his condition.",
    es_AR = ""
  },
  defaultAction = DIALOG_ACTION_REDIRECT,
  dialogName = 'c01s02_answering_machine_message_3'
}

dialogTree.c01s02_answering_machine_message_3 = {
  text = {
    en_US = "So please, contact Dr. Porta immediately.",
    es_AR = ""
  },
  defaultAction = DIALOG_ACTION_REDIRECT,
  dialogName = 'c01s02_answering_machine_message_4'
}

dialogTree.c01s02_answering_machine_message_4 = {
  text = {
    en_US = "Wow, she sounds pretty steamed. Then again, Bobby rarely bother to check his glucose levels before shooting up, so why would I expect him to keep a doctor’s appointment?",
    es_AR = ""
  },
}

dialogTree.c01s02_coffee_pot_with_water = {
  text = {
    en_US = "I already filled the coffee pot.",
    es_AR = ""
  },
  options = {
    {
      label = "OK",
      action = DIALOG_ACTION_CLOSE
    }
  }
}

dialogTree.c01s02_fill_coffee_pot_first = {
  text = {
    en_US = "I should fill the coffee pot first.",
    es_AR = ""
  },
  options = {
    {
      label = "OK",
      action = DIALOG_ACTION_CLOSE
    }
  }
}

dialogTree.c01s02_mug_full = {
  text = {
    en_US = "That’s the nastiest Cup of Joe I’ve ever tasted. And I’ve been to Europe.",
    es_AR = ""
  },
  options = {
    {
      label = "OK",
      action = DIALOG_ACTION_CLOSE
    }
  }
}

dialogTree.c01s02_stole_mug = {
  text = {
    en_US = "I sort of stole that mug from a random game development studio.",
    es_AR = ""
  },
  options = {
    {
      label = "OK",
      action = DIALOG_ACTION_CLOSE
    }
  }
}

dialogTree.c01s02_coffee_pot_full = {
  text = {
    en_US = "A Pot of Bile-Tasting Sludge",
    es_AR = ""
  },
  options = {
    {
      label = "OK",
      action = DIALOG_ACTION_CLOSE
    }
  }
}


dialogTree.locked = {
  text = {
    en_US = "It's locked",
    es_AR = ""
  },
  options = {
    {
      label = "OK",
      action = DIALOG_ACTION_CLOSE
    }
  }
}


