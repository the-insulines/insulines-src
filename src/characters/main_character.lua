--==============================================================
-- The Insulines
-- Copyright (c) 2010-2012 quov.is
-- All Rights Reserved. 
-- http://quov.is // http://theinsulines.com
--==============================================================

function main_character ()
  local main_character = {}

  -- Load character images
  main_character.gfx = resource_cache.loadImage("Main Character", "../insulines-gfx/dummy_character.png", -109, -314, 109, 314)

  -- Create prop
  prop = MOAIProp2D.new ()
  prop:setDeck ( main_character.gfx )
  main_character.prop = prop

  -- Movement function
  main_character.moveTo = function(self, x, y)

    -- Stop current movement
    if self.currentAction then
      self.currentAction:stop()
    end
  
    local curX, curY = self.prop:getLoc ()
    local delta_x = x - curX
    local delta_y = y - curY
  
    self.currentAction = self.prop:moveLoc(delta_x, delta_y, 2, MOAIEaseType.LINEAR)
    return self.currentAction
  end
  return main_character
end