--==============================================================
-- Three in a row.
-- Copyright (c) 2010-2012 Francisco Tufró
-- All Rights Reserved. 
-- http://franciscotufro.com.ar // http://quov.is
--==============================================================
module ( "debugHUD", package.seeall )

local layer = MOAILayer2D.new()
local font =  MOAIFont.new ()
local mouseWorldPositionTextbox = MOAITextBox.new ()
local mouseWindowPositionTextbox = MOAITextBox.new ()
local dialogViewport = MOAIViewport.new ()

function initialize(self)
  -- dialog layer
  dialogViewport:setSize ( SCREEN_RESOLUTION_X, SCREEN_RESOLUTION_Y )
  dialogViewport:setScale ( SCREEN_RESOLUTION_X, SCREEN_RESOLUTION_Y )
  layer:setViewport ( dialogViewport )
  MOAIRenderMgr.pushRenderPass ( layer )
  
  -- load font
  font = resource_cache.get ( "debug_font" )

  -- setup
  self:setupMousePosition ()
end


function setupMousePosition ( self )
  mouseWorldPositionTextbox:setFont ( font )
  mouseWorldPositionTextbox:setTextSize ( 12 )
  mouseWorldPositionTextbox:setYFlip( true )
  mouseWorldPositionTextbox:setRect ( - SCREEN_RESOLUTION_X / 2 + 5 , SCREEN_RESOLUTION_Y / 2 + 10, - SCREEN_RESOLUTION_X / 2 + 120, SCREEN_RESOLUTION_Y / 2 + 10 - 14)
  layer:insertProp ( mouseWorldPositionTextbox )
  
  mouseWindowPositionTextbox:setFont ( font )
  mouseWindowPositionTextbox:setTextSize ( 12 )
  mouseWindowPositionTextbox:setYFlip( true )
  mouseWindowPositionTextbox:setRect ( - SCREEN_RESOLUTION_X / 2 + 5 , SCREEN_RESOLUTION_Y / 2 - 10, - SCREEN_RESOLUTION_X / 2 + 120, SCREEN_RESOLUTION_Y / 2 - 10 - 14)
  layer:insertProp ( mouseWindowPositionTextbox )
end

function clear ( self )
  self:displayText('')
end

function setMouseWorldPosition(self, x,y)
  mouseWorldPositionTextbox:setString ( "World: (" .. math.floor(x) .. "," .. math.floor(y) .. ")" )
end

function setMouseWindowPosition(self, x,y)
  mouseWindowPositionTextbox:setString ( "Window: (" .. x .. "," .. y .. ")" )
end

function displayText(self, text)
  textbox:setString ( text )
  textbox:spool ()
end

function getLayer ()
  return layer
end