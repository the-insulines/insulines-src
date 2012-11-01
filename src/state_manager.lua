--==============================================================
-- The Insulines
-- Copyright (c) 2010-2012 quov.is
-- All Rights Reserved. 
-- http://quov.is // http://theinsulines.com
--==============================================================

module ( "stateManager", package.seeall )

-- pickedFlyer = false


print ( 'docs = ', MOAIEnvironment.documentDirectory )
print ( 'resources = ', MOAIEnvironment.resourceDirectory )
print ( 'cache = ', MOAIEnvironment.cacheDirectory )
print ( 'current = ', MOAIFileSystem.getWorkingDirectory() )

stateManager.state = {}
stateManager.saveDirectory = MOAIFileSystem.getWorkingDirectory()
stateManager.saveFile = stateManager.saveDirectory .. 'game.save'


function stateManager:newState ()
  self.state = {}
end


function stateManager:saveState ()
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
    
  else
    print ( 'failed to load game state on ' .. self.saveFile )
  end
end


function stateManager:savedStateExists ()
  return MOAIFileSystem.checkFileExists ( self.saveFile )
end

