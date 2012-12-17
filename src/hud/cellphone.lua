--==============================================================
-- The Insulines
-- Copyright (c) 2010-2012 quov.is
-- All Rights Reserved. 
-- http://quov.is // http://theinsulines.com
--==============================================================

module ( "cellphoneHUD", package.seeall )

layer = MOAILayer2D.new ()
hidden = true

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


  -- We want to have the messages received icon
  self.messagesIcon = {}
  self.messagesIcon.gfx = resource_cache.get( 'hud_cellphone_message_received')
  self.messagesIcon.half_width = 35 / 2
  self.messagesIcon.half_height = 35 / 2
  self.messagesIcon.gfx:setRect ( - self.messagesIcon.half_width, - self.messagesIcon.half_height, self.messagesIcon.half_width, self.messagesIcon.half_height)

  -- Create prop
  self.messagesIcon.prop = MOAIProp2D.new ()
  self.messagesIcon.prop:setDeck ( self.messagesIcon.gfx )
  self.messagesIcon.prop:setLoc ( self.cellphoneAsset.x + self.cellphoneAsset.half_width/2, self.cellphoneAsset.y - self.cellphoneAsset.half_height )
  self.messagesIcon.prop:setPriority(100)
  if stateManager.cellphonePicked then
    self:show ()
  end
end

function cellphoneHUD:hide()
  if not self.hidden then
    self.hidden = true
    self.layer:removeProp ( self.messagesIcon.prop )
    self.layer:removeProp ( self.cellphoneAsset.prop )
  end
end

function cellphoneHUD:show()
  if self.hidden then
    self.hidden = false
    self:showMessages ()
    self.layer:insertProp ( self.cellphoneAsset.prop )
  end
end

function cellphoneHUD:showMessages ()
  if stateManager.hasMessages then
    self.layer:insertProp ( self.messagesIcon.prop )
  else
    self.layer:removeProp ( self.messagesIcon.prop )
  end
end

function cellphoneHUD:messageArrived (method, parent)
  stateManager.hasMessages = true
  self.message = { method = method, parent = parent }
  self:showMessages ()
end

function cellphoneHUD:onInput ()
  local x, y = input_manager.getTouch ()
    
  if x and y then
    x, y = self.layer:wndToWorld ( x, y )
  end

  if input_manager.down () then
    -- If cellphone was clicled call callback
    local cellphoneX, cellphoneY = self.cellphoneAsset.prop:worldToModel ( x, y )

    if (cellphoneX >= -self.cellphoneAsset.half_width) and (cellphoneX <= self.cellphoneAsset.half_width) and (cellphoneY >= -self.cellphoneAsset.half_height) and (cellphoneY <= self.cellphoneAsset.half_height) then
      if stateManager.hasMessages then
        stateManager.hasMessages = false
        self:showMessages ()
        self.message.method (self.message.parent)
        self.message = nil
      end
      return true
    end
  end
end