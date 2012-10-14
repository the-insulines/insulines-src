--==============================================================
-- The Insulines
-- Copyright (c) 2010-2012 quov.is
-- All Rights Reserved. 
-- http://quov.is // http://theinsulines.com
--==============================================================

module ( "hud", package.seeall )

layers = {}

initialized = false

function hud:initialize ( )
  if not self.initialized then
    inventory:initialize ()
    highlight:initialize ()
    dialog:initialize ()
    -- menu:initialize ()

    if DEBUG then debugHUD:initialize () end
  
    if game.currentScene.useInventory then
      table.insert ( self.layers, inventory.layer )
    end
  
    if game.currentScene.useHighlights then
      table.insert ( self.layers, highlight.layer )
    end
  
    if game.currentScene.useDialogs then
      table.insert ( self.layers, dialog.layer )
    end
  end
  self.initialized = true
end

function hud:onInput ()
    local stopInput = false

    if not dialog.opened then
      stopInput = inventory:onInput ()

      if not stopInput then
        stopInput = highlight:onInput ()
      end
    else
      stopInput = dialog:onInput ()
    end
  -- 
  -- 
  --   if dialog.opened then
  --     dialog:onInput ()
  --   end
  --   
  if DEBUG then
    local x, y = input_manager.position ()
    if x and y then
      debugHUD:setMouseWindowPosition(x,y)
      x, y = game.currentScene.layer_objects.background:wndToWorld ( x, y )
      debugHUD:setMouseWorldPosition(x,y)
    end
  end
  
  return stopInput
end