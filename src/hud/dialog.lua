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

option1TextBox = MOAITextBox.new ()

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
  self.options.gfx = resource_cache.get ( "dialog_option_background")
  self.options.half_width = 227.5
  self.options.half_height = 91
  self.options.gfx:setRect ( - self.options.half_width, - self.options.half_height, self.options.half_width, self.options.half_height)

  self.options.buttons = {}
  self.options.buttons.option1 = self:createOption( -710 )
  self.options.buttons.option2 = self:createOption( -235 )
  self.options.buttons.option3 = self:createOption( 240 )
  self.options.buttons.option4 = self:createOption( 715 )
  
  -- Add props in order
  self.layer:insertProp ( self.background.prop )
  self.layer:insertProp ( self.window_background.prop )
  self.layer:insertProp ( self.dialogTextBox )
  
  -- Make invisible
  self:hide(0)
  
end

function dialog:createOption(x)
  local option = {}
  
  option.prop = MOAIProp2D.new ()
  option.prop:setDeck ( self.options.gfx )
  option.prop:setLoc( x , -500)
  
  
  option.textBox = MOAITextBox.new ()
  option.textBox:setFont ( game.defaultFont )
  option.textBox:setTextSize ( 60 )
  option.textBox:setYFlip( true )
  option.textBox:setColor ( unpack ( DEFAULT_OPTION_COLOR ))
  option.textBox:setRect ( -self.options.half_width, -self.options.half_height, self.options.half_width, self.options.half_height)
  option.textBox:setLoc(x, -500)
  option.textBox:setAlignment( MOAITextBox.CENTER_JUSTIFY, MOAITextBox.CENTER_JUSTIFY)
  option.rendering = false

  function option:show ()
    dialog.layer:insertProp ( option.prop )
    dialog.layer:insertProp ( option.textBox )
    self.rendering = true
  end
  
  function option:hide ()
    dialog.layer:removeProp ( option.prop )
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
  MOAICoroutine.blockOnAction ( self.window_background.prop:seekScl( 0.001, 0.001, 0.7 ) )
  self.layer:seekColor ( 0, 0, 0, 0, time, MOAIEaseType.LINEAR )
  
  self.opened = false
end

function dialog:show ( dialogText, option1, option2, option3, option4 )
  -- self.textBox:clear ()
  self.layer:moveColor ( 1, 1, 1, 1, 0.5, MOAIEaseType.LINEAR)

  self.background.prop:setColor ( 1, 1, 1, 0.7, 0.5, MOAIEaseType.LINEAR)
  
  self.window_background.prop:setScl( 0.1, 0.1 )
  self.window_background.prop:setColor(1,1,1,0.8)
  self.dialogTextBox:setColor(1,1,1,0.8)

  self.background.prop:setScl( 2, 2 )
  self.background.prop:seekScl( 1.12, 1.12, 1)

  MOAICoroutine.blockOnAction ( self.window_background.prop:seekScl( 1.1, 1.1, 0.7) )
  MOAICoroutine.blockOnAction ( self.window_background.prop:seekScl( 1, 1, 0.1, MOAIEaseType.LINEAR ) )
  

  -- self:setOption ( option1, self.options.buttons.option1 )
  -- self:setOption ( option2, self.options.buttons.option2 )
  -- self:setOption ( option3, self.options.buttons.option3 )
  -- self:setOption ( option4, self.options.buttons.option4 )

  self.opened = true
end

function dialog:setOption ( optionDefinition, option )

  if optionDefinition then
    option:setString ( optionDefinition.label )
    option.action = optionDefinition.action
    option:show ()
  else
    option.action = nil
    option:hide ()
  end
  
end

function dialog:load ( dialogName )
  local dialogNode = dialogTree[dialogName]
  if dialogNode then
    self:show (dialogNode.text[LOCALE], unpack(dialogNode.options))
  else
    if dialogName then
      print ( "DIALOG TODO: " .. dialogName )
    else
      print ( "DIALOG NIL!!!" )
    end
  end
end

function dialog:onInput ( )
  if input_manager.down () then
    self:hide()
    return true
    -- local x, y = input_manager.getTouch ()
    -- x, y = self.layer:wndToWorld ( x, y )  
    -- local button = self:objectAt ( x, y )
    -- 
    -- if button then
    --   if button.action == DIALOG_ACTION_CLOSE then
    --     self:hide ()
    --   end
    -- end
  end
end

function dialog:objectAt ( x, y )

  for k, object in pairs( self.options.buttons ) do

    local objX, objY = object.prop:worldToModel ( x, y )

    if (objX >= -self.options.half_width) and (objX <= self.options.half_width) and (objY >= -self.options.half_height) and (objY <= self.options.half_height) and object.rendering then
      return object
    end

  end
  return nil
  
end
