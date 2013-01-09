-- Characters
function howard ()
  local howard = character.new ( 'howard' )
  howard.renderPriority = 0
  howard.layer_name = 'objects'
  howard.priority = 10
  howard.avoid_clicks = false
  howard.avoid_zoom_factor = true
  howard.onClick = function ()
    game.currentScene.objects.josh:lookAt ( howard:getPosition () )
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
    game.currentScene.objects.josh:lookAt ( klein:getPosition () )
    dialog:load ( 'klein' )
  end
  
  -- set up face animations
  local eyeKeyframes = {}
  eyeKeyframes[1] = point(757, 165)
  eyeKeyframes[2] = point(758, 165)
  eyeKeyframes[3] = point(760, 165)
  eyeKeyframes[4] = point(762, 165)
  eyeKeyframes[5] = point(764, 165)
  eyeKeyframes[6] = point(765, 165)
  eyeKeyframes[9] = point(764, 165)
  eyeKeyframes[10] = point(762, 165)
  eyeKeyframes[11] = point(760, 165)
  eyeKeyframes[12] = point(758, 165)
  
  local mouthKeyframes = {}
  mouthKeyframes[1] = point(748, 104)
  mouthKeyframes[2] = point(749, 104)
  mouthKeyframes[3] = point(750, 104)
  mouthKeyframes[4] = point(752, 104)
  mouthKeyframes[5] = point(754, 104)
  mouthKeyframes[6] = point(755, 104)
  mouthKeyframes[9] = point(754, 104)
  mouthKeyframes[10] = point(752, 104)
  mouthKeyframes[11] = point(750, 104)
  mouthKeyframes[12] = point(749, 104)
  
  function kleinFacePosition ( animName, frame )
    local pos = eyeKeyframes[frame]
    if pos and game.currentScene then
      game.currentScene:moveEyesTo ( klein, pos )
    end
    
    pos = mouthKeyframes[frame]
    if pos and game.currentScene then
      game.currentScene:moveMouthTo ( klein, pos )
    end
  end
  klein.animation:setAnimationListener ( 'stand', kleinFacePosition )
  
  return klein
end

function klein_eyes ()
  local klein_eyes = character.new ( 'klein_eyes' )
  klein_eyes.renderPriority = 1
  klein_eyes.layer_name = 'objects'
  klein_eyes.priority = 0
  klein_eyes.avoid_clicks = true
  klein_eyes.avoid_zoom_factor = true
  return klein_eyes
end

function klein_mouth ()
  local klein_mouth = character.new ( 'klein_mouth' )
  klein_mouth.renderPriority = 2
  klein_mouth.layer_name = 'objects'
  klein_mouth.priority = 0
  klein_mouth.avoid_clicks = true
  klein_mouth.avoid_zoom_factor = true
  return klein_mouth
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
    game.currentScene.objects.josh:lookAt ( paul:getPosition () )
    dialog:load ( 'wardrobe' )
  end
  
  -- set up face animations
  local eyeKeyframes = {}
  eyeKeyframes[1] = point(106, 232)
  eyeKeyframes[17] = point(103, 232)
  eyeKeyframes[18] = point(99, 232)
  eyeKeyframes[19] = point(100, 232)
  eyeKeyframes[20] = point(102, 232)
  eyeKeyframes[21] = point(104, 232)
  eyeKeyframes[22] = point(106, 232)
  
  local mouthKeyframes = {}
  mouthKeyframes[1] = point(108, 192)
  mouthKeyframes[17] = point(105, 192)
  mouthKeyframes[18] = point(101, 192)
  mouthKeyframes[19] = point(102, 192)
  mouthKeyframes[20] = point(104, 192)
  mouthKeyframes[21] = point(106, 192)
  mouthKeyframes[22] = point(108, 192)
  
  function paulFacePosition ( animName, frame )
    local pos = eyeKeyframes[frame]
    if pos and game.currentScene then
      game.currentScene:moveEyesTo ( paul, pos )
    end
    
    pos = mouthKeyframes[frame]
    if pos and game.currentScene then
      game.currentScene:moveMouthTo ( paul, pos )
    end
  end
  paul.animation:setAnimationListener ( 'stand', paulFacePosition )
  
  return paul
end

function paul_eyes ()
  local paul_eyes = character.new ( 'paul_eyes' )
  paul_eyes.renderPriority = 1
  paul_eyes.layer_name = 'objects'
  paul_eyes.priority = 0
  paul_eyes.avoid_clicks = true
  paul_eyes.avoid_zoom_factor = true
  return paul_eyes
end

function paul_mouth ()
  local paul_mouth = character.new ( 'paul_mouth' )
  paul_mouth.renderPriority = 2
  paul_mouth.layer_name = 'objects'
  paul_mouth.priority = 0
  paul_mouth.avoid_clicks = true
  paul_mouth.avoid_zoom_factor = true
  return paul_mouth
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
    game.currentScene.objects.josh:lookAt ( pete:getPosition () )
    dialog:load ( 'wardrobe' )
  end
  return pete
end

function pete_eyes ()
  local pete_eyes = character.new ( 'pete_eyes' )
  pete_eyes.renderPriority = 1
  pete_eyes.layer_name = 'objects'
  pete_eyes.priority = 0
  pete_eyes.avoid_clicks = true
  pete_eyes.avoid_zoom_factor = true
  return pete_eyes
end

function pete_mouth ()
  local pete_mouth = character.new ( 'pete_mouth' )
  pete_mouth.renderPriority = 2
  pete_mouth.layer_name = 'objects'
  pete_mouth.priority = 0
  pete_mouth.avoid_clicks = true
  pete_mouth.avoid_zoom_factor = true
  return pete_mouth
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
    game.currentScene.objects.josh:lookAt ( sonja:getPosition () )
    dialog:load ( 'glasworks' )
  end
  return sonja
end

function sonja_eyes ()
  local sonja_eyes = character.new ( 'sonja_eyes' )
  sonja_eyes.renderPriority = 1
  sonja_eyes.layer_name = 'objects'
  sonja_eyes.priority = 0
  sonja_eyes.avoid_clicks = true
  sonja_eyes.avoid_zoom_factor = true
  return sonja_eyes
end

function sonja_mouth ()
  local sonja_mouth = character.new ( 'sonja_mouth' )
  sonja_mouth.renderPriority = 2
  sonja_mouth.layer_name = 'objects'
  sonja_mouth.priority = 0
  sonja_mouth.avoid_clicks = true
  sonja_mouth.avoid_zoom_factor = true
  return sonja_mouth
end



c01s03_characters = {
  howard = howard,
  klein = klein,
  klein_mouth = klein_mouth,
  klein_eyes = klein_eyes,
  paul = paul,
  paul_mouth = paul_mouth,
  paul_eyes = paul_eyes,
  pete = pete,
  pete_mouth = pete_mouth,
  pete_eyes = pete_eyes,
  sonja = sonja,
  sonja_mouth = sonja_mouth,
  sonja_eyes = sonja_eyes,
}
