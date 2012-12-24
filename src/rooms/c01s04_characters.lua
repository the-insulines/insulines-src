-- Characters
function moe ()
  local moe = character.new ( 'moe' )
  moe.avoid_clicks = false
  moe.priority = 10
  moe.onClick = function ( )
    game.currentScene.objects.josh:lookAt ( moe:getPosition () )
    inventory:closeInventory ()
    inventory:addItem('wristband', game.currentScene.objects.wristband)
    moe:startAnimation ( 'blink' )
    dialog:load ( 'moe' )
  end
  return moe
end