--==============================================================
-- The Insulines
-- Copyright (c) 2010-2012 quov.is
-- All Rights Reserved. 
-- http://quov.is // http://theinsulines.com
--==============================================================

module ( "highlight", package.seeall )

layer = MOAILayer2D.new ()
highlightingInteractions = false

function highlight:initialize ( elements )
  self.eye = {} 
  self.eye.gfx = resource_cache.get ( 'highlight_duck' )
  self.eye.half_width = INVENTORY_BACKPACK_HALF_WIDTH
  self.eye.half_height = INVENTORY_BACKPACK_HALF_HEIGHT
  self.eye.gfx:setRect ( - self.eye.half_width, - self.eye.half_height, self.eye.half_width, self.eye.half_height)

  -- Create prop
  self.eye.prop = MOAIProp2D.new ()
  self.eye.prop:setDeck ( self.eye.gfx )
  self.eye.prop:setIndex ( 2 )
  
  -- We want to locate the icon 20px away top right corner, 64 is half the width of the icon.
  self.eye.x = INVENTORY_BACKPACK_POSITION_X - INVENTORY_BACKPACK_WIDTH - 20
  self.eye.y = INVENTORY_BACKPACK_POSITION_Y

  self.eye.prop:setLoc ( self.eye.x, self.eye.y )
  
  self.layer:insertProp ( self.eye.prop )
end

function highlight:onInput ()
    local x, y = input_manager.getTouch ()
    
    if x and y then
      x, y = self.layer:wndToWorld ( x, y )
    end
    

    if input_manager.down () then
      -- If eye was clicled highlight objects
      local eyeX, eyeY = self.eye.prop:worldToModel ( x, y )
      if (eyeX >= -self.eye.half_width) and (eyeX <= self.eye.half_width) and (eyeY >= -self.eye.half_height) and (eyeY <= self.eye.half_height) then
        self:highlightInteractions ()
        return true
      end
    end
    
    if self.highlightingInteractions then
      if not input_manager.isDown () then
        self:stopHighlightingInteractions ()
        return true
      end
    end

end

function highlight:highlightInteractions ()
  self.highlightingInteractions = true
  game.currentScene:startHighlightingInteractions ()
end

function highlight:stopHighlightingInteractions ()
  self.highlightingInteractions = false
  game.currentScene:stoptHighlightingInteractions ()
end
