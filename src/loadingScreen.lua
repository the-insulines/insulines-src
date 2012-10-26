--==============================================================
-- The Insulines
-- Copyright (c) 2010-2012 quov.is
-- All Rights Reserved. 
-- http://quov.is // http://theinsulines.com
--==============================================================

module ( "loadingScreen", package.seeall )

layer = MOAILayer2D.new ()


function loadingScreen:initialize ( )
  self:setupLayer ()
end

function loadingScreen:setupLayer ( )
  local viewport = MOAIViewport.new ()
  viewport:setSize ( SCREEN_RESOLUTION_X, SCREEN_RESOLUTION_Y )
  viewport:setScale ( WORLD_RESOLUTION_X, WORLD_RESOLUTION_Y )

  self.layer:setViewport ( viewport )
  -- Make background
  self.background = {}
  self.background.gfx = resource_cache.get ( 'loadingScreen_background' )
  self.background.prop = MOAIProp2D.new ()
  self.background.prop:setDeck ( self.background.gfx )
  self.layer:insertProp ( self.background.prop )

end

function loadingScreen:setup ( steps )
  self.steps = steps
  self.currentStep = 0
  self:show()
  coroutine.yield()
end

function loadingScreen:show()
  -- Get Render Table
  local currentRenderTable = {}
  
  -- Append layers to future render table
  table.insert ( currentRenderTable, self.layer )
  
  MOAIRenderMgr.setRenderTable ( currentRenderTable )
  MOAICoroutine.blockOnAction ( self.layer:seekColor ( 1, 1, 1, 1, 1) )
  coroutine.yield ()
end

function loadingScreen:step()
  self.currentStep = self.currentStep + 1
  print(self.currentStep, self.steps)
  coroutine.yield ()
end

function loadingScreen:hide()
  MOAICoroutine.blockOnAction ( self.layer:seekColor ( 0, 0, 0, 0, 1) )

  local currentRenderTable = MOAIRenderMgr.getRenderTable ()

  for k, layer in pairs(currentRenderTable) do
    if layer == self.layer then 
      table.remove(currentRenderTable, k)
    end
  end

  MOAIRenderMgr.setRenderTable(currentRenderTable)
end