--==============================================================
-- The Insulines
-- Copyright (c) 2010-2012 quov.is
-- All Rights Reserved. 
-- http://quov.is // http://theinsulines.com
--==============================================================

module ( "dialog", package.seeall )

objects = {}

dialogLayer = MOAILayer2D.new ()

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
  
  -- Dialog
  if not self.background then
    self.background = {}
    self.background.gfx = resource_cache.get ( "dialog_background" )
    self.background.half_width = 940
    self.background.half_height = 498.5
    self.background.gfx:setRect ( - self.background.half_width, - self.background.half_height, self.background.half_width, self.background.half_height)

    -- Create prop
    self.background.prop = MOAIProp2D.new ()
    self.background.prop:setDeck ( self.background.gfx )
    self.background.prop:setLoc( 0, 120)

    -- TextBox
    self.dialogTextBox:setFont ( game.defaultFont )
    self.dialogTextBox:setTextSize ( 60 )
    self.dialogTextBox:setYFlip( true )
    self.dialogTextBox:setColor ( unpack ( DEFAULT_DIALOG_COLOR ))
    self.dialogTextBox:setRect ( (-WORLD_RESOLUTION_X/2) + 70, (-WORLD_RESOLUTION_Y/2) + 250 , WORLD_RESOLUTION_X/2 - 70, WORLD_RESOLUTION_Y/2 - 40 )


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
    
  end
  -- End Dialog

  -- Add props in order
  self.dialogLayer:insertProp ( self.background.prop )
  self.dialogLayer:insertProp ( self.dialogTextBox )
  
  
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
    dialog.dialogLayer:insertProp ( option.prop )
    dialog.dialogLayer:insertProp ( option.textBox )
    self.rendering = true
  end
  
  function option:hide ()
    dialog.dialogLayer:removeProp ( option.prop )
    dialog.dialogLayer:removeProp ( option.textBox )
    self.rendering = false
  end
  
  function option:setString ( string )
    self.textBox:setString ( string )
  end
  
  return option
end


function dialog:hide ( time )
  if not time then time = 0.5 end
  self.dialogLayer:seekColor ( 0, 0, 0, 0, time, MOAIEaseType.LINEAR )
  self.opened = false
end

function dialog:show ( dialogText, option1, option2, option3, option4 )
  self.dialogTextBox:setString ( dialogText )

  self:setOption ( option1, self.options.buttons.option1 )
  self:setOption ( option2, self.options.buttons.option2 )
  self:setOption ( option3, self.options.buttons.option3 )
  self:setOption ( option4, self.options.buttons.option4 )

  self.dialogLayer:moveColor ( 1, 1, 1, 1, 0.5, MOAIEaseType.LINEAR)
  
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
    local x, y = input_manager.getTouch ()
    x, y = self.dialogLayer:wndToWorld ( x, y )  
    local button = self:objectAt ( x, y )
    
    if button then
      if button.action == DIALOG_ACTION_CLOSE then
        self:hide ()
      end
    end
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
