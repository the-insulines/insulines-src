--==============================================================
-- The Insulines
-- Copyright (c) 2010-2012 quov.is
-- All Rights Reserved. 
-- http://quov.is // http://theinsulines.com
--==============================================================

module ( "stateManager", package.seeall )

stateManager.state = {
  c01s01 = {
    cellphoneClicks = 0,
    woke = false,
    cellphonePicked = false,
    dressed = false
  },

  c01s02 = {
    bathroom = false,

    coffeePickedUp = false,
    hasCoffee = false,
    hasWater = false,
    madeCoffee = false,
    hadCoffee = false,

    answered = false,
    pickedFlyer = false,
    talkedToNancy = false
  },

  map = {
    fair = false,
    venue = false
  },
}

stateManager.saveDirectory = MOAIEnvironment.documentDirectory
-- if iOS
if stateManager.saveDirectory then
  stateManager.saveDirectory = stateManager.saveDirectory .. '/'
-- else (if OSX)
else
  stateManager.saveDirectory = MOAIFileSystem.getWorkingDirectory ()
end

stateManager.saveFile = stateManager.saveDirectory .. 'game.save'


function stateManager:startAutoSave ()
  performWithDelay ( 400, self.autoSave, 0, self )
end


function stateManager:autoSave ()
  stateManager:saveState ()
end


function stateManager:saveState ()
  -- update the inventory items to be stored as part of the state
  self.state.inventoryItems = inventory.items
  
  local stream = MOAIFileStream.new ()
  if stream:open ( self.saveFile, MOAIFileStream.READ_WRITE_AFFIRM ) then
    print ( 'saving game state on ' .. self.saveFile .. '...' )
    stream:write ( MOAIJsonParser.encode ( self.state ) )
    stream:flush ()
    
    stream:close ()
    
  else
    print ( 'failed to save game state on ' .. self.saveFile )
  end
end


function stateManager:loadState ()
  local stream = MOAIFileStream.new ()
  if stream:open ( self.saveFile, MOAIFileStream.READ ) then
    print ( 'loading game state on ' .. self.saveFile .. '...' )
    local json_encoded_state = stream:read ()
    self.state = MOAIJsonParser.decode ( json_encoded_state )
    
    stream:close ()
    
    -- load the inventory from the state
    inventory:loadFromState ( self.state.inventoryItems )
    
  else
    print ( 'failed to load game state on ' .. self.saveFile )
  end
end


function stateManager:savedStateExists ()
  return MOAIFileSystem.checkFileExists ( self.saveFile )
end

