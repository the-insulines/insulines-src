--==============================================================
-- The Insulines
-- Copyright (c) 2010-2012 quov.is
-- All Rights Reserved. 
-- http://quov.is // http://theinsulines.com
--==============================================================

module ( "inventory", package.seeall )

objects = {}

inventory_layer = MOAILayer2D.new ()

opened = false 

currentAction = nil

function initialize ( self, elements )
  
  if DEBUG then
    print ( "inventory.lua:21: Initializing inventory..." )
  end
  
  if elements then
    self.elements = elements
  end

  -- Initialize HUD
  self:initialize_hud ()
end

function initialize_hud ( self )

  if DEBUG then
    print ( "inventory.lua:31: TODO: Move to resource cache..." )
  end
  
  -- ICON
  if not self.icon then
    self.icon = {} 
    self.icon.gfx = resource_cache.get ( "inventory_backpack" )
    self.icon.half_width = 64
    self.icon.half_height = 64
    self.icon.gfx:setRect ( - self.icon.half_width, - self.icon.half_height, self.icon.half_width, self.icon.half_height)
  
    -- Create prop
    self.icon.prop = MOAIProp2D.new ()
    self.icon.prop:setDeck ( self.icon.gfx )
    self.icon.prop:setIndex ( 2 )
    
    -- We want to locate the icon 20px away top right corner, 64 is half the width of the icon.
    self.icon.x = ( WORLD_RESOLUTION_X / 2 ) - ( self.icon.half_width ) - 20
    self.icon.y = ( WORLD_RESOLUTION_Y / 2 ) - ( self.icon.half_height) - 20

    self.icon.prop:setLoc ( self.icon.x, self.icon.y )
  end
  -- End ICON
  
  -- Inventory
  if not self.background then
    self.background = {}
    self.background.gfx = resource_cache.get ( "inventory_background" )
    self.background.half_width = 200
    self.background.half_height = 540
    self.background.gfx:setRect ( - self.background.half_width, - self.background.half_height, self.background.half_width, self.background.half_height)

    -- Create prop
    self.background.prop = MOAIProp2D.new ()
    self.background.prop:setDeck ( self.background.gfx )
  
    -- We want to locate the icon 20px away top right corner, 64 is half the width of the icon.
    self.background.prop:setLoc ( INVENTORY_CLOSED_X, INVENTORY_CLOSED_Y )
  end
  -- End Inventory

  -- Add props in order
  self.inventory_layer:insertProp ( self.background.prop )
  self.inventory_layer:insertProp ( self.icon.prop )

end
function show ( self )
end

function onInput ( self )

  if input_manager.down () then
    local x, y = input_manager.getTouch ()
    x, y = self.inventory_layer:wndToWorld ( x, y )
    
    -- If backpack was clicled toggle inventory
    local iconX, iconY = self.icon.prop:worldToModel ( x, y )
    if (iconX >= -self.icon.half_width) and (iconX <= self.icon.half_width) and (iconY >= -self.icon.half_height) and (iconY <= self.icon.half_height) then
      self:toggleInventory ()
    end

  end
end

function toggleInventory ( self )

  if self.currentAction then
    self.currentAction:stop ()
  end

  if self.opened then
    self:closeInventory ()
  else
    self:openInventory ()
  end
end

function openInventory ( self )
  self.currentAction = self.background.prop:seekLoc( INVENTORY_OPEN_X, INVENTORY_OPEN_Y, INVENTORY_ANIMATION_LENGTH )
  self.opened = true
end

function closeInventory ( self )
  self.currentAction = self.background.prop:seekLoc( INVENTORY_CLOSED_X, INVENTORY_CLOSED_Y, INVENTORY_ANIMATION_LENGTH )
  self.opened = false
end

function addObject ( self, key, object )
  self.objects[key] = object
end
