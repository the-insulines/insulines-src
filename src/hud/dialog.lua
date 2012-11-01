--==============================================================
-- The Insulines
-- Copyright (c) 2010-2012 quov.is
-- All Rights Reserved. 
-- http://quov.is // http://theinsulines.com
--==============================================================

module ( "dialog", package.seeall )

conversations = {}

function dialog:loadConversations(conversations_definition)
  self.conversations = conversations_definition

  -- Load all user variables
  if self.conversations.userVariables then
    for name, info in pairs(self.conversations.userVariables) do
      stateManager.state.dialogs.userVariables[name] = info.initialValue 
    end
  end
end

layer = MOAILayer2D.new ()

dialogTextBox = MOAITextBox.new ()

opened = false

currentAction = nil

function initialize ( self )
  if DEBUG then
    print ( "dialog.lua:20: Initializing dialog..." )
  end
  
  -- If there is no dialogs table in state manager, create it
  if not stateManager.state.dialogs then
    stateManager.state.dialogs = {
      userVariables = {}
    }
  end
  
  -- Initialize HUD
  if not self.initializedHUD then
    self:initializeHUD ()
  end
  
end

function initializeHUD ( self )
  self.initializedHUD = true
  -- Background
  self.background = {}
  self.background.gfx = resource_cache.get ( "dialog_background" )
  self.background.half_width = DIALOG_BACKGROUND_HALF_WIDTH
  self.background.half_height = DIALOG_BACKGROUND_HALF_HEIGHT
  self.background.gfx:setRect ( - self.background.half_width, - self.background.half_height, self.background.half_width, self.background.half_height)
  self.background.prop = MOAIProp2D.new ()
  self.background.prop:setDeck ( self.background.gfx )
  self.background.prop:setLoc(0, 0)
  
  -- Window background
  self.window_background = {}
  self.window_background.gfx = resource_cache.get ( "dialog_window_background" )
  self.window_background.half_width = DIALOG_WINDOW_HALF_WIDTH
  self.window_background.half_height = DIALOG_WINDOW_HALF_HEIGHT
  self.window_background.gfx:setRect ( - self.window_background.half_width, - self.window_background.half_height, self.window_background.half_width, self.window_background.half_height)
  
  -- Create prop
  self.window_background.prop = MOAIProp2D.new ()
  self.window_background.prop:setDeck ( self.window_background.gfx )
  self.window_background.prop:setLoc( 0, 0)
  
  -- TextBox
  self.dialogTextBox:setFont ( game.defaultFont )
  self.dialogTextBox:setTextSize ( 80 / SCREEN_TO_WORLD_RATIO )
  self.dialogTextBox:setYFlip( true )
  self.dialogTextBox:setColor ( unpack ( DEFAULT_DIALOG_COLOR ))
  self.dialogTextBox:setRect ( -self.window_background.half_width + 100, -self.window_background.half_height + 90, self.window_background.half_width - 100, self.window_background.half_height - 100)
  self.dialogTextBox:setAlignment(MOAITextBox.CENTER_JUSTIFY, MOAITextBox.CENTER_JUSTIFY)

  -- Options
  self.options = {}
  self.options.half_width = 1540 / 2
  self.options.half_height = 130 / 2
  self.options.buttons = {}
  local padding = 200 / SCREEN_TO_WORLD_RATIO
  self.options.buttons = { 
    self:createOption( padding * 0 ), 
    self:createOption( padding * 1 ),
    self:createOption( padding * 2 ),
    self:createOption( padding * 3 ),
  }
  
   
  
  -- Add props in order
  self.layer:insertProp ( self.background.prop )
  self.layer:insertProp ( self.window_background.prop )
  self.layer:insertProp ( self.dialogTextBox )
  
  -- Make invisible
  self:hide(0)
  
end

function dialog:createOption(yOffset)
  local option = {}
  
  option.textBox = MOAITextBox.new ()
  option.textBox:setFont ( game.defaultFont )
  option.textBox:setTextSize ( 70 / SCREEN_TO_WORLD_RATIO )
  option.textBox:setYFlip( true )
  option.textBox:setColor ( unpack ( DEFAULT_OPTION_COLOR ))
  option.textBox:setRect ( 0, 0, self.options.half_width * 2, self.options.half_height * 2)
  option.textBox:setLoc(-self.window_background.half_width + 100, self.window_background.half_height - 200 - yOffset)
  option.textBox:setAlignment( MOAITextBox.LEFT_JUSTIFY, MOAITextBox.CENTER_JUSTIFY)
  option.rendering = false
  
  function option:show ()
    dialog.layer:insertProp ( option.textBox )
    self.rendering = true
  end
  
  function option:hide ()
    dialog.layer:removeProp ( option.textBox )
    self.rendering = false
  end
  
  function option:setString ( string )
    self.textBox:setString ( string )
  end
  
  return option
end

function dialog:hide ( time )
  if not time then time = 0.5 end
  
  self.background.prop:seekScl( 2, 2, 0.3)
  self.dialogTextBox:setString( '' )
  self:hideOptions ()
  MOAICoroutine.blockOnAction ( self.window_background.prop:seekScl( 0.001, 0.001, 0.7 ) )
  self.layer:seekColor ( 0, 0, 0, 0, time, MOAIEaseType.LINEAR )
  
  game.currentScene.inputEnabled = true
  self.opened = false
end

function dialog:appear()
  game.currentScene.inputEnabled = false
  
  self.layer:moveColor ( 1, 1, 1, 1, 0.5, MOAIEaseType.LINEAR)
  
  self.background.prop:setColor ( 1, 1, 1, 0.7, 0.5, MOAIEaseType.LINEAR)

  self.window_background.prop:setScl( 0.001, 0.001 )
  self.window_background.prop:setColor(1,1,1,0.8)
  
  self.background.prop:setScl( 2, 2 )
  self.background.prop:seekScl( 1.12, 1.12, 1)

  MOAICoroutine.blockOnAction ( self.window_background.prop:seekScl( 1.1, 1.1, 0.7) )
  MOAICoroutine.blockOnAction ( self.window_background.prop:seekScl( 1, 1, 0.1, MOAIEaseType.LINEAR ) )
  
  self.opened = true
  
end

function dialog:showCurrentDialogEntry ( )
  if not self.opened then self:appear() end

  local character = self.currentDialogEntry.actor
  self.dialogTextBox:setColor ( DIALOG_COLOR_FOR_CHARACTER[character].r, DIALOG_COLOR_FOR_CHARACTER[character].g, DIALOG_COLOR_FOR_CHARACTER[character].b,0.8)

  if self.currentDialogEntry.dialogueText then
    self.dialogTextBox:setString(self.currentDialogEntry.dialogueText[self.currentDialogEntryTextIndex])
  end
end

function dialog:clearOptions ()
  for i, option in pairs( self.options.buttons ) do
    option.definition = nil
    option.textBox:setString ('')
    option:hide ()
  end
end

function dialog:setOption ( optionDefinition, dialogEntryId )
  for i, button in pairs( self.options.buttons ) do
    if not button.definition then

      if not optionDefinition.menuText == '' then
        button:setString ( optionDefinition.menuText )
      else
        button:setString ( optionDefinition.dialogueText[1] )
      end
      
      button.definition = optionDefinition
      button.definition.id = dialogEntryId
      button:show ()
      return
    end
  end
end

function dialog:hideOptions ()
  for i, option in pairs ( self.options.buttons ) do
    option:hide ()
  end
  self.displayingOptions = false
end

function dialog:showOptions ()
  dialog:clearOptions ()

  for i, link in pairs(self.currentDialogEntry.links) do
    local option = self:getDialogEntry(link.destinationDialogId)
    local condition = true
    if option.conditionsString ~= '' then condition = loadstring("return " .. option.conditionsString)() end
    if condition then dialog:setOption(option, link.destinationDialogId) end
  end
  
  self.displayingOptions = true
end

function dialog:load ( conversationName )
  self.currentConversation = self.conversations[conversationName]
  
  -- If state manager didn't have the namespace for this conversation, create it.
  if not stateManager.state.dialogs[conversationName] then
    stateManager.state.dialogs[conversationName] = {}
  end

  if self.currentConversation then
    self:loadDialogEntry(0)
  else
    print ("DIALOG MISSING: " .. conversationName)
  end
end


function dialog:getDialogEntry(id)
  return self.currentConversation.dialogEntries['dialog' .. id]
end

function dialog:loadDialogEntry(id)
  self.currentDialogEntryId = id
  self.currentDialogEntryTextIndex = 1
  self:processCurrentDialogEntry()
end

function dialog:processCurrentDialogEntry()
  
  self.currentDialogEntry = self:getDialogEntry(self.currentDialogEntryId)
  
  if self.currentDialogEntry.dialogueText then
    -- Show text
    self:showCurrentDialogEntry()
  else
    -- Since there is no text, we have to redirect to another dialog 
    -- or show options if it's a group
    if self.currentDialogEntry.isGroup then

      -- show options
      self:showOptions()
    else
      -- redirect
      self:redirect()
    end
  end
end

function dialog:redirect()
  local links = self.currentDialogEntry.links
  
  for i, link in pairs(links) do
    local linkNodeEntry = self:getDialogEntry(link.destinationDialogId)
  
    -- We have to check that the condition is met in order to redirect to that link
    local condition = true
    
    if linkNodeEntry.conditionsString ~= '' then
      condition = loadstring("return " .. linkNodeEntry.conditionsString)()
    end
    
    if condition then
      self:loadDialogEntry(link.destinationDialogId)
      break
    end

  end
end


function dialog:onInput ( )
  if self.showOptionsTapped and not input_manager.isDown () then
    self.showOptionsTapped = false
  end
  
  if input_manager.down () then
    if not self.currentDialogEntry.isGroup then
      self.currentDialogEntry.SimStatus = "WasDisplayed"
      
      if #self.currentDialogEntry.dialogueText > self.currentDialogEntryTextIndex then
        self.currentDialogEntryTextIndex = self.currentDialogEntryTextIndex + 1
        self:showCurrentDialogEntry()
        return
      end

      if self.currentDialogEntry and self.currentDialogEntry.userScript then
        self.currentDialogEntry.userScript()
      end

      if self.currentDialogEntry.links[1] then
        self.dialogTextBox:setString('')
        self:redirect()
        return
      else
        self:hide()
        return
      end
    elseif not self.displayingOptions then
      self:showOptions ()
      self.showOptionsTapped = true
    end
    
    if self.displayingOptions and not self.showOptionsTapped then
      local x, y = input_manager.getTouch ()
      x, y = self.layer:wndToWorld ( x, y )
      local button = self:objectAt ( x, y )

      if button then
        self:hideOptions()
        self:loadDialogEntry(button.definition.id)
      end
    end
    return true
  end
end

function dialog:objectAt ( x, y )

  for k, object in pairs( self.options.buttons ) do

    local objX, objY = object.textBox:worldToModel ( x, y )

    -- For some reason that I can't see at 5:13 AM this box is a little bit higher. 
    -- Fixing this with a magic number.
    --                                          Francisco.
    objY = objY - 50
    
    if (objX >= -self.options.half_width) and (objX <= self.options.half_width) and (objY >= -self.options.half_height) and (objY <= self.options.half_height) and object.rendering then
      return object
    end

  end
  return nil
  
end
