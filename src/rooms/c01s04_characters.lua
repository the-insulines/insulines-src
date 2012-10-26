-- Characters

moe = character.new ( 'moe' )
moe.avoid_clicks = false
moe.priority = 10
moe.onClick = function ( )
  josh:lookAt ( moe:getPosition () )
  -- dialog:load ( '' )
end

