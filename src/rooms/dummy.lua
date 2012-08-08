--==============================================================
-- The Insulines
-- Copyright (c) 2010-2012 quov.is
-- All Rights Reserved. 
-- http://quov.is // http://theinsulines.com
--==============================================================

dummy_room = room.new ("Dummy")

<<<<<<< HEAD
dummy_room.initialize = function ()
  dummy_room:setupBackground("Dummy", "../insulines-gfx/background.jpeg", 3146, 960)
  game.camera:setLoc(600,0)
=======
dummy_room.before_initialize = function ()
  -- Setup background
  dummy_room:addBackground("outside", "../insulines-gfx/dummy_background_parallax_0.png", 1734, 960, 1.2, 1.2, 1)
  dummy_room:addBackground("inside", "../insulines-gfx/dummy_background_parallax_1.png", 1734, 960, 1, 1, 1)

  -- Setup character
  dummy_room:setupCharacter(main_character())

  -- Setup objects
  dummy_room:addObject("window", "../insulines-gfx/dummy_background_parallax_window.png", 1734, 960, 1, 1, 1)
  
  -- Setup walkbehinds
  dummy_room:addWalkBehind("table", "../insulines-gfx/dummy_background_parallax_walk_behind.png", 1734, 960, 0.8, 1, 1)
  
end


dummy_room.start = function (self)
  MOAICoroutine.blockOnAction ( self.characters.main:moveTo ( 300, 100 ) )
  MOAICoroutine.blockOnAction ( self:step2() ) 
  MOAICoroutine.blockOnAction ( self:step3() ) 
  MOAICoroutine.blockOnAction ( self:step4() ) 
  MOAICoroutine.blockOnAction ( self:step5() ) 
  MOAICoroutine.blockOnAction ( self:step6() )
  MOAICoroutine.blockOnAction ( self:step7() )
  MOAICoroutine.blockOnAction ( self:step8() )
end

dummy_room.step2 = function (self) 
  game.camera:moveLoc(-240, 0, 1, MOAIEaseType.LINEAR)
  return self.characters.main:moveTo ( -500, 100 ) 
end

dummy_room.step3 = function (self) 
  game.camera:moveScl(-0.30, -0.30, 0.5, MOAIEaseType.LINEAR)
  return game.camera:moveLoc(-200, 200, 1, MOAIEaseType.LINEAR)
end

dummy_room.step4 = function (self) 
  self.objects['window'].layer:seekColor (0, 0, 0, 0, 1)
  return self.objects['window'].layer:moveLoc(0, -200, 1, MOAIEaseType.LINEAR)
end

dummy_room.step5 = function (self) 
  self.characters.main:moveTo ( -160, 200 )
  self.characters.main.prop:moveScl(-0.55, -0.55, 2, MOAIEaseType.LINEAR)
  return game.camera:moveLoc(60, 10, 1, MOAIEaseType.LINEAR)
end

dummy_room.step6 = function (self) 
  return self.characters.main.layer:seekColor (0, 0, 0, 0, 1)
end

dummy_room.step7 = function (self) 
  game.camera:moveScl(0.30, 0.30, 2, MOAIEaseType.LINEAR)
  return game.camera:moveLoc(380, -210, 2, MOAIEaseType.LINEAR)
end

dummy_room.step8 = function (self) 
  local result 
  for k, layer in pairs( self:layers() ) do 
    result = layer:seekColor (0, 0, 0, 0, 1)
  end
  return result
>>>>>>> e5803ca3b4874c5490e2449ffefff249ce685a15
end

