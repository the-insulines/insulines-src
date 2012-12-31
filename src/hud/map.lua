--==============================================================
-- The Insulines
-- Copyright (c) 2010-2012 quov.is
-- All Rights Reserved. 
-- http://quov.is // http://theinsulines.com
--==============================================================

module ( "mapHUD", package.seeall )

layer = MOAILayer2D.new ()
hidden = true
function mapHUD:initialize ( elements )
  self.mapAsset = {} 
  self.mapAsset.gfx = resource_cache.get ( 'hud_map' )
  self.mapAsset.half_width = INVENTORY_BACKPACK_HALF_WIDTH
  self.mapAsset.half_height = INVENTORY_BACKPACK_HALF_HEIGHT
  self.mapAsset.gfx:setRect ( - self.mapAsset.half_width, - self.mapAsset.half_height, self.mapAsset.half_width, self.mapAsset.half_height)

  -- Create prop
  self.mapAsset.prop = MOAIProp2D.new ()
  self.mapAsset.prop:setDeck ( self.mapAsset.gfx )
  self.mapAsset.prop:setIndex ( 2 )
  
  -- We want to locate the icon 20px away top right corner, 64 is half the width of the icon.
  self.mapAsset.x = INVENTORY_BACKPACK_POSITION_X - 3 * INVENTORY_BACKPACK_WIDTH - 60
  self.mapAsset.y = INVENTORY_BACKPACK_POSITION_Y

  self.mapAsset.prop:setLoc ( self.mapAsset.x, self.mapAsset.y )

  if stateManager.state.c01s02.pickedFlyer then
    self:show ()
  end
end

function mapHUD:hide()
  if not self.hidden then
    self.visible = false
    self.layer:removeProp ( self.mapAsset.prop )
  end
end

function mapHUD:show()
  if self.hidden then
    self.visible = true
    self.layer:insertProp ( self.mapAsset.prop )
  end
end

function mapHUD:onInput ()
  if  self.visible then
    local x, y = input_manager.getTouch ()
      
    if x and y then
      x, y = self.layer:wndToWorld ( x, y )
    end

    if input_manager.down () then
      -- If map was clicled open map
      local mapX, mapY = self.mapAsset.prop:worldToModel ( x, y )
      if (mapX >= -self.mapAsset.half_width) and (mapX <= self.mapAsset.half_width) and (mapY >= -self.mapAsset.half_height) and (mapY <= self.mapAsset.half_height) then
        game:loadScene(map)
        return true
      end
    end
  end
end