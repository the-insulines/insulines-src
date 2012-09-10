--==============================================================
-- The Insulines
-- Copyright (c) 2010-2012 quov.is
-- All Rights Reserved. 
-- http://quov.is // http://theinsulines.com
--==============================================================

module ( "dialog", package.seeall )

objects = {}

layer = MOAILayer2D.new ()

dialogTextBox = MOAITextBox.new ()

opened = false

currentAction = nil

function initialize ( self )
  if DEBUG then
    print ( "dialog.lua:20: Initializing dialog..." )
  end
  
  -- Initialize HUD
  self:initializeHUD ()
  
end

function initializeHUD ( self )
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
  self.dialogTextBox:setTextSize ( 80 )
  self.dialogTextBox:setYFlip( true )
  self.dialogTextBox:setColor ( unpack ( DEFAULT_DIALOG_COLOR ))
  self.dialogTextBox:setRect ( -self.window_background.half_width + 100, -self.window_background.half_height + 90, self.window_background.half_width - 100, self.window_background.half_height - 100)
  self.dialogTextBox:setAlignment(MOAITextBox.CENTER_JUSTIFY, MOAITextBox.CENTER_JUSTIFY)

  -- Options
  self.options = {}
  self.options.half_width = 1540 / 2
  self.options.half_height = 130 / 2
  self.options.buttons = {}
  local padding = 200
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
  option.textBox:setTextSize ( 70 )
  option.textBox:setYFlip( true )
  option.textBox:setColor ( unpack ( DEFAULT_OPTION_COLOR ))
  option.textBox:setRect ( 0, 0, self.options.half_width * 2, self.options.half_height * 2)
  option.textBox:setLoc(-self.window_background.half_width + 100, self.window_background.half_height - 200 - yOffset)
  option.textBox:setAlignment( MOAITextBox.LEFT_JUSTIFY, MOAITextBox.CENTER_JUSTIFY)
  option.rendering = false

  function option:show ()
    -- dialog.layer:insertProp ( option.prop )
    dialog.layer:insertProp ( option.textBox )
    self.rendering = true
  end
  
  function option:hide ()
    -- dialog.layer:removeProp ( option.prop )
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

  self.opened = false
end

function dialog:show ( dialogText, character, options )
  game.currentScene.inputEnabled = false
  self.layer:moveColor ( 1, 1, 1, 1, 0.5, MOAIEaseType.LINEAR)

  self.background.prop:setColor ( 1, 1, 1, 0.7, 0.5, MOAIEaseType.LINEAR)
  
  self.window_background.prop:setScl( 0.001, 0.001 )
  self.window_background.prop:setColor(1,1,1,0.8)
  
  self.dialogTextBox:setColor ( DIALOG_COLOR_FOR_CHARACTER[character].r, DIALOG_COLOR_FOR_CHARACTER[character].g, DIALOG_COLOR_FOR_CHARACTER[character].b,0.8)
  
  self.background.prop:setScl( 2, 2 )
  self.background.prop:seekScl( 1.12, 1.12, 1)

  MOAICoroutine.blockOnAction ( self.window_background.prop:seekScl( 1.1, 1.1, 0.7) )
  MOAICoroutine.blockOnAction ( self.window_background.prop:seekScl( 1, 1, 0.1, MOAIEaseType.LINEAR ) )

  self.dialogTextBox:setString(dialogText)
  
  self:clearOptions ()
  
  -- oneTime is used for dialogs that are displayed once
  -- It should change dialog options
  if self.currentNode and self.currentNode.oneTime then
    self.currentNode.options[self.currentNode.change.hide].hidden = true
    self.currentNode.options[self.currentNode.change.show].hidden = false
  end
  
  for i, option in pairs ( options ) do
    if not option.hidden then
      self:setOption ( option )
    end
  end

  self:hideOptions ()
  self.opened = true
  game.currentScene.inputEnabled = true
  
  
end

function dialog:clearOptions ()
  for i, option in pairs( self.options.buttons ) do
    option.definition = nil
    option.textBox:setString ('')
    option:hide ()
  end
end

function dialog:setOption ( optionDefinition )
  for i, button in pairs( self.options.buttons ) do
    if not button.definition then
      button:setString ( optionDefinition.label[LOCALE] )
      button.definition = optionDefinition
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
  self.dialogTextBox:setString('')
  
  for i, option in pairs ( self.options.buttons ) do
    if option then option:show () end
  end
  
  self.displayingOptions = true
end

function dialog:load ( dialogName )
  local dialogNode = dialogTree[dialogName]
  local options = {}
  if dialogNode.options then options = dialogNode.options end
  
  if dialogNode then
    self.currentNode = dialogNode
    self.hasOptions = #options > 0
    self:show (dialogNode.text[LOCALE], dialogNode.character, options )
  else
    if dialogName then
      print ( "DIALOG TODO: " .. dialogName )
    else
      print ( "DIALOG NIL!!!" )
    end
  end
end

function dialog:onInput ( )
  
  if self.showOptionsTapped and not input_manager.isDown () then
    self.showOptionsTapped = false
  end
  
  if input_manager.down () then
    if not self.hasOptions then
      self:hide()
    elseif not self.displayingOptions then
      self:showOptions ()
      self.showOptionsTapped = true
    end
    
    -- Check default action
    if self.currentNode and self.currentNode.defaultAction then
      if self.currentNode.defaultAction == DIALOG_ACTION_REDIRECT then
        self:load ( self.currentNode.dialogName )
      end
    end

    if self.displayingOptions and not self.showOptionsTapped then
      local x, y = input_manager.getTouch ()
      x, y = self.layer:wndToWorld ( x, y )
      local button = self:objectAt ( x, y )
      
      if button then
        if button.definition.action == DIALOG_ACTION_CLOSE then
          self:hide ()
          self.displayingOptions = false
        elseif button.definition.action == DIALOG_ACTION_REDIRECT then
          self:hide ()
          self.displayingOptions = false
          self:load ( button.definition.dialogName )
        end
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
