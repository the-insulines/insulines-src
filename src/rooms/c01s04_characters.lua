-- Characters

moe = character.new ( 'moe' )
moe.avoid_clicks = false
moe.priority = 10
moe.onClick = function ( )
  josh:lookAt ( moe:getPosition () )
  moe:startAnimation ( 'blink' )
  dialog:load ( 'moe' )
end

