-- Characters
function howard ()
  local howard = character.new ( 'howard' )
  howard.renderPriority = 0
  howard.layer_name = 'objects'
  howard.priority = 10
  howard.avoid_clicks = false
  howard.avoid_zoom_factor = true
  howard.onClick = function ()
    josh:lookAt ( howard:getPosition () )
    dialog:load ( 'foam_and_lather' )
  end
  return howard
end


function klein ()
  local klein = character.new ( 'klein' )
  klein.renderPriority = 0
  klein.layer_name = 'objects'
  klein.priority = 10
  klein.avoid_clicks = false
  klein.avoid_zoom_factor = true
  klein.onClick = function ()
    josh:lookAt ( klein:getPosition () )
    dialog:load ( 'klein' )
  end
  return klein
end


function sonja ()
  local sonja = character.new ( 'sonja' )
  sonja.renderPriority = 0
  sonja.layer_name = 'objects'
  sonja.priority = 10
  sonja.pathNode = 'stuff'
  sonja.avoid_clicks = false
  sonja.avoid_zoom_factor = true
  sonja.onClick = function ()
    josh:lookAt ( sonja:getPosition () )
    dialog:load ( 'glasworks' )
  end
  return sonja
end


function paul ()
  local paul = character.new ( 'paul' )
  paul.renderPriority = 0
  paul.layer_name = 'objects'
  paul.priority = 10
  paul.pathNode = 'pete_and_paul'
  paul.avoid_clicks = false
  paul.avoid_zoom_factor = true
  paul.onClick = function ()
    josh:lookAt ( paul:getPosition () )
    dialog:load ( 'wardrobe' )
  end
  return paul
end


function pete ()
  local pete = character.new ( 'pete' )
  pete.renderPriority = 0
  pete.layer_name = 'objects'
  pete.priority = 10
  pete.pathNode = 'pete_and_paul'
  pete.avoid_clicks = false
  pete.avoid_zoom_factor = true
  pete.onClick = function ()
    josh:lookAt ( pete:getPosition () )
    dialog:load ( 'wardrobe' )
  end
  return pete
end

c01s03_characters = { 
  howard = howard, 
  klein = klein, 
  sonja = sonja, 
  paul = paul, 
  pete = pete }