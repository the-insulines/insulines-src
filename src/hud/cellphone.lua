--==============================================================
-- The Insulines
-- Copyright (c) 2010-2012 quov.is
-- All Rights Reserved. 
-- http://quov.is // http://theinsulines.com
--==============================================================

module ( "cellphoneHUD", package.seeall )

layer = MOAILayer2D.new ()

function cellphoneHUD:initialize ( elements )
  self.cellphoneAsset = {} 
  self.cellphoneAsset.gfx = resource_cache.get ( 'hud_cellphone' )
  self.cellphoneAsset.half_width = INVENTORY_BACKPACK_HALF_WIDTH
  self.cellphoneAsset.half_height = INVENTORY_BACKPACK_HALF_HEIGHT
  self.cellphoneAsset.gfx:setRect ( - self.cellphoneAsset.half_width, - self.cellphoneAsset.half_height, self.cellphoneAsset.half_width, self.cellphoneAsset.half_height)

  -- Create prop
  self.cellphoneAsset.prop = MOAIProp2D.new ()
  self.cellphoneAsset.prop:setDeck ( self.cellphoneAsset.gfx )
  self.cellphoneAsset.prop:setIndex ( 2 )
  
  -- We want to locate the icon 20px away top right corner, 64 is half the width of the icon.
  self.cellphoneAsset.x = INVENTORY_BACKPACK_POSITION_X - 2 * INVENTORY_BACKPACK_WIDTH - 40
  self.cellphoneAsset.y = INVENTORY_BACKPACK_POSITION_Y

  self.cellphoneAsset.prop:setLoc ( self.cellphoneAsset.x, self.cellphoneAsset.y )

  if stateManager.cellphonePicked then
    self:show ()
  end
end

function cellphoneHUD:hide()
  self.layer:removeProp ( self.cellphoneAsset.prop )
end

function cellphoneHUD:show()
  self.layer:insertProp ( self.cellphoneAsset.prop )
end

function cellphoneHUD:onInput ()
  local x, y = input_manager.getTouch ()
    
  if x and y then
    x, y = self.layer:wndToWorld ( x, y )
  end

  if input_manager.down () then
    -- If cellphone was clicled open cellphone
    local cellphoneX, cellphoneY = self.cellphoneAsset.prop:worldToModel ( x, y )
    if (cellphoneX >= -self.cellphoneAsset.half_width) and (cellphoneX <= self.cellphoneAsset.half_width) and (cellphoneY >= -self.cellphoneAsset.half_height) and (cellphoneY <= self.cellphoneAsset.half_height) then
      --game:loadScene(map())
      return true
    end
  end
end