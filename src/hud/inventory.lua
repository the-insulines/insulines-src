--==============================================================
-- The Insulines
-- Copyright (c) 2010-2012 quov.is
-- All Rights Reserved. 
-- http://quov.is // http://theinsulines.com
--==============================================================

module ( "inventory", package.seeall )

items = {}

layer = MOAILayer2D.new ()

opened = false 

currentAction = nil

newObject = false

currentItem = nil

hidden = true

highlightingInteractions = false

function inventory:initialize ( elements )
  
  if DEBUG then
    print ( "inventory.lua:21: Initializing inventory..." )
  end
  
  if elements then
    self.elements = elements
  end
  
  -- Initialize HUD
  self:initializeHud ()
end

function inventory:initializeHud ()

  if DEBUG then
    print ( "inventory.lua:31: TODO: Move to resource cache..." )
  end
  
  -- ICON
  if not self.icon then
    self.icon = {}
    self.icon.gfx = resource_cache.get ( 'inventory_backpack' )
    self.icon.half_width = INVENTORY_BACKPACK_HALF_WIDTH
    self.icon.half_height = INVENTORY_BACKPACK_HALF_HEIGHT
    self.icon.gfx:setRect ( - self.icon.half_width, - self.icon.half_height, self.icon.half_width, self.icon.half_height)
  
    -- Create prop
    self.icon.prop = MOAIProp2D.new ()
    self.icon.prop:setDeck ( self.icon.gfx )
    self.icon.prop:setIndex ( 2 )
    
    -- We want to locate the icon 20px away top right corner, 64 is half the width of the icon.
    self.icon.x = INVENTORY_BACKPACK_POSITION_X
    self.icon.y = INVENTORY_BACKPACK_POSITION_Y

    self.icon.prop:setLoc ( self.icon.x, self.icon.y )

  end
  -- End ICON
  
  -- Inventory
  if not self.background then
    self.background = {}
    self.background.gfx = resource_cache.get ( 'inventory_background' )
    self.background.half_width = INVENTORY_HALF_WIDTH
    self.background.half_height = INVENTORY_HALF_HEIGHT
    self.background.gfx:setRect ( - self.background.half_width, - self.background.half_height, self.background.half_width, self.background.half_height)

    -- Create prop
    self.background.prop = MOAIProp2D.new ()
    self.background.prop:setDeck ( self.background.gfx )
  
    -- We want to locate the icon 20px away top right corner, 64 is half the width of the icon.
    self.background.prop:setLoc ( INVENTORY_CLOSED_X, INVENTORY_CLOSED_Y )
  end
  -- End Inventory

  -- Add props in order
  self.layer:insertProp ( self.background.prop )
  self.layer:insertProp ( self.icon.prop )
  
  -- setup gfx for inventory items
  self.intentoryItemBackground = {}
  -- self.intentoryItemBackground.gfx = resource_cache.get ( 'inventory_item_background' )
  self.intentoryItemBackground.half_width = INVENTORY_ITEM_HALF_WIDTH
  self.intentoryItemBackground.half_height = INVENTORY_ITEM_HALF_HEIGHT
  -- self.intentoryItemBackground.gfx:setRect ( - self.intentoryItemBackground.half_width, - self.intentoryItemBackground.half_height, self.intentoryItemBackground.half_width, self.intentoryItemBackground.half_height)

  self.openAction = self.background.prop:moveLoc( INVENTORY_OPEN_DELTA_X, INVENTORY_OPEN_DELTA_Y, INVENTORY_ANIMATION_LENGTH )
  self.openAction:stop ()

  self.closeAction = self.background.prop:moveLoc( -INVENTORY_OPEN_DELTA_X, -INVENTORY_OPEN_DELTA_Y, INVENTORY_ANIMATION_LENGTH )
  self.closeAction:stop ()
  
end

function inventory:show ()
end

function inventory:onInput ()
    local x, y = input_manager.getTouch ()
    if x and y then
      x, y = self.layer:wndToWorld ( x, y )
    end
    

    if input_manager.down () then
      -- If backpack was clicled toggle inventory
      local iconX, iconY = self.icon.prop:worldToModel ( x, y )
      if (iconX >= -self.icon.half_width) and (iconX <= self.icon.half_width) and (iconY >= -self.icon.half_height) and (iconY <= self.icon.half_height) then
        self:toggleInventory ()
        return true
      end

      -- If item was clicked, select it
      local item = self:itemAt (x, y)
      if item then
        self:clickedOrDraggedItem ( item )
        return true
      end
    end
        
    if self.currentItem then
      if input_manager.isDown () then
        self:clickedOrDraggedItem ( self.currentItem )
      else
        self:droppedCurrentItem ()
      end
      return true
    end

end

function inventory:clickedOrDraggedItem ( item )
  if self.currentItem == item then
    -- move item through screen
    self:moveItem ( self.currentItem )
  else
    self:selectItem ( item )
  end
end

function inventory:moveItem ( item )
  local x, y = input_manager.getTouch ()
  local invX, invY = self.layer:wndToWorld ( x, y )
  item.backProp:setLoc(invX, invY)
  item.backProp:setPriority ( 10 )
  
  -- check if there is a possible interaction in this position
  if game.currentScene:interactionForPosition (self.currentItem, x, y) or self:interactionForPosition ( invX, invY ) then
    self.currentItem.backProp:setColor(0,1,0)
    -- self.currentItem.backProp:setIndex ( 3 )
  else
    self.currentItem.backProp:setColor(1,0,0)
    -- self.currentItem.backProp:setIndex ( 2 )
  end
  
end

function inventory:interactionForPosition ( x, y )
  local target = self:itemAt(x, y)

  if target and target.object.interactsWith then
    for k, targetInteraction in pairs ( target.object.interactsWith ) do
      if targetInteraction == self.currentItem.key then
        return target
      end
    end
  end
end

function inventory:unselectCurrentItem ()
  if self.currentItem then
    self.currentItem.backProp:setColor(1,1,1,1)
    self.currentItem.backProp:setPriority ()
    self.currentItem = nil
    
    self:updateItemsPosition ()
    
  end
end

function inventory:selectItem ( item )
  self:unselectCurrentItem ()
  
  self.currentItem = item
  self.currentItem.backProp:setIndex ( 2 )
end

function inventory:droppedCurrentItem ()
  local x, y = input_manager.getTouch ()
  local invX, invY = self.layer:wndToWorld ( x, y )
  
  local target = game.currentScene:interactionForPosition (self.currentItem, x, y)
  local invTarget = self:interactionForPosition (invX, invY)

  if not target and invTarget then
    target = invTarget.object
    target.invTarget = invTarget
  end

  if target then
    game.currentScene:interact (self.currentItem, target)
  end
  
  self:unselectCurrentItem ()
  
end


function inventory:toggleInventory ()

  if self.currentAction then
    self.currentAction:stop ()
  end

  if self.opened then
    self:closeInventory ()
  else
    self:openInventory ()
  end
end

function inventory:openInventory ()
  if self.currentAction then self.currentAction:stop () end

  self:updateItemsPosition ()
  
  self.opened = true

  self.currentAction = self.openAction
  MOAICoroutine.blockOnAction ( self.currentAction:start () )
  
  if self.newObject then
    self.newObject = false
    self.icon.prop:setIndex ( 2 )
  end
  
end

function inventory:closeInventory ()
  if self.opened then
    if self.currentAction then self.currentAction:stop () end
    self.currentAction = self.closeAction
  
    game.currentScene.inputEnabled = false
    MOAICoroutine.blockOnAction ( self.currentAction:start () )
    game.currentScene.inputEnabled = true
    
    self.opened = false
  end
end

function inventory:addItem ( key, object )

  local item = { key = key, object = object, backProp = MOAIProp2D.new () }

  -- Create prop
  item.backProp:setDeck ( resource_cache.get(object.inventory_resource_name) )
  table.insert ( self.items, item)

  self.newObject = true
  
  function update ()
    inventory.layer:insertProp ( item.backProp )
    inventory:updateItemsPosition ()
  end

  if self.currentAction and self.currentAction:isBusy() then
    self.currentAction:setListener ( MOAIAction.EVENT_STOP, update )
  else
    update ()
  end
  
end


function inventory:removeItem (item)
  for i, inventoryItem in pairs ( self.items ) do
    if item.key == inventoryItem.key and item.object == inventoryItem.object then
      self.layer:removeProp( item.backProp )
      table.remove(self.items, i)
      self:updateItemsPosition ()
      return true
    end
  end
end

function inventory:findAndRemoveItem (key)
  for i, item in pairs ( self.items ) do
    if item.key == key then
      self:removeItem(item)
      return true
    end
  end
end

function inventory:updateItemsPosition ()
  self.openAction:clear ()
  self.closeAction:clear ()
  for i, item in pairs ( self.items ) do
    local itemTop = INVENTORY_ITEMS_TOP - math.floor((i-1)/2) * INVENTORY_ITEM_HEIGHT / SCREEN_TO_WORLD_RATIO - math.floor((i-1)/2) * INVENTORY_ITEM_MARGIN / SCREEN_TO_WORLD_RATIO
    
    local xPosition = 0
    
    if i % 2 == 1 then
      xPosition = INVENTORY_CLOSED_X - INVENTORY_ITEM_HALF_WIDTH + INVENTORY_ITEM_VERTICAL_MARGIN / 2 
    else
      xPosition = INVENTORY_CLOSED_X + INVENTORY_ITEM_HALF_WIDTH + 2 * INVENTORY_ITEM_VERTICAL_MARGIN
    end
    
    if self.opened then xPosition = xPosition + INVENTORY_OPEN_DELTA_X end
    item.backProp:setLoc ( xPosition,  itemTop )
    self.openAction:addChild ( item.backProp:moveLoc( INVENTORY_OPEN_DELTA_X, INVENTORY_OPEN_DELTA_Y, INVENTORY_ANIMATION_LENGTH  ) )
    self.closeAction:addChild ( item.backProp:moveLoc( -INVENTORY_OPEN_DELTA_X, -INVENTORY_OPEN_DELTA_Y, INVENTORY_ANIMATION_LENGTH  ) )
  end
end

function inventory:itemAt ( x, y )
  for i, item in pairs ( self.items ) do
    
    local itemX, itemY = item.backProp:worldToModel ( x, y )
    
    if (itemX >= -self.intentoryItemBackground.half_width) and (itemX <= self.intentoryItemBackground.half_width) and (itemY >= -self.intentoryItemBackground.half_height) and (itemY <= self.intentoryItemBackground.half_height) then
      if not (item == self.currentItem) then 
        return item 
      end
    end
  end
end

