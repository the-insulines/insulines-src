--==============================================================
-- The Insulines
-- Copyright (c) 2010-2012 quov.is
-- All Rights Reserved. 
-- http://quov.is // http://theinsulines.com
--==============================================================

--module ( "animatedProp", package.seeall )

AnimatedProp = {}
AnimatedProp.__index = AnimatedProp


-- constants

AnimatedProp.ANIMATION_TYPE_SPRITESHEET = RESOURCE_TYPE_TILED_IMAGE
AnimatedProp.ANIMATION_TYPE_FRAMES = RESOURCE_TYPE_ANIMATION_FRAMES

-- methods

function AnimatedProp.new ( animationType )
  local newObj = {}
    newObj.animationType = animationType
    newObj.animationFrames = {}
    newObj.sounds = {}
    newObj.animations = {}
    newObj.currentAnimation = nil
    newObj.prop = MOAIProp2D.new ()
    -- newObj.remapper = nil
  
  setmetatable ( newObj, AnimatedProp )
  
  return newObj
end


function AnimatedProp:addFrames ( name, animationFrames )
  if self.animationFrames == nil then self.animationFrames = {} end
  self.animationFrames[name] = animationFrames
end


function AnimatedProp:setDeck ( animationFrames )
  self.animationFrames = animationFrames
  
  -- if the frames are in form of a spritesheet, link the whole spritesheet to the underlying prop
  if self.animationType == AnimatedProp.ANIMATION_TYPE_SPRITESHEET then
    self.prop:setDeck ( animationFrames )
    
    -- create the remapper
    self.remapper = MOAIDeckRemapper.new ()
    self.remapper:reserve ( 1 )
    self.prop:setRemapper ( self.remapper )
  else
    for k, v in pairs( self.animationFrames ) do
      self.prop:setDeck ( v[1] )
    end
  end
end


-- creates a new animation based on a spritesheet
function AnimatedProp:addSpritesheetAnimation ( name, startFrame, frameCount, frameTime, animationMode )
  if type ( frameTime ) == 'number' then
    self:addConstantSpritesheetAnimation ( name, startFrame, frameCount, frameTime, animationMode )
  end
end


-- creates a new animation based on existing individual frames
function AnimatedProp:addFramedAnimation ( name, startFrame, frameCount, frameTime, animationMode, parentAnimationName )
  local frames = self.animationFrames[name]
  if parentAnimationName then 
    frames = self.animationFrames[parentAnimationName] 
  end

  if type ( frameTime ) == 'number' then
    self:addConstantFramedAnimation ( name, frames, startFrame, frameCount, frameTime, animationMode )
  end
end


function AnimatedProp:addConstantFramedAnimation ( name, frames, startFrame, frameCount, frameTime, animationMode )
  if not animationMode then animationMode = MOAITimer.LOOP end
  
  -- create the animation curve and set equally timed frames starting on startFrame and lasting frameCount frames
  local curve = MOAIAnimCurve.new ()
  curve:reserveKeys ( frameCount )
  
  for frame = 1, frameCount do
    curve:setKey ( frame, frameTime * (frame - 1), startFrame + (frame - 1), MOAIEaseType.LINEAR )
  end
  
  -- create the timer that triggers the events in the times set by the curve
  local anim = MOAITimer.new ()
  anim:setMode ( animationMode )
  anim:setSpan ( frameCount * frameTime )
  anim:setCurve ( curve )
  anim:setListener ( MOAITimer.EVENT_TIMER_KEYFRAME, self.updateFrame )
  
  -- add some aditional information necessary for the animation to the timer object
  anim.animatedProp = self
  anim.frames = frames
  anim.name = name
  
  -- store it under the name of the animation
  self.animations[name] = anim
  
end


function AnimatedProp.updateFrame ( anim, keyframe, timesExecuted, time, value )
  self = anim.animatedProp
  self.prop:setDeck ( anim.frames[value] )
end


function AnimatedProp:addConstantSpritesheetAnimation ( name, startFrame, frameCount, frameTime, animationMode )
  if not animationMode then animationMode = MOAITimer.LOOP end
  
  local lastFrame = startFrame + frameCount - 1
  
  -- create the animation curve and set equally timed frames starting on startFrame and lasting frameCount frames
  local curve = MOAIAnimCurve.new ()
  curve:reserveKeys ( 2 )
  curve:setKey ( 1, 0, startFrame, MOAIEaseType.LINEAR )
  curve:setKey ( 2, frameTime * (frameCount - 1), lastFrame, MOAIEaseType.LINEAR )
  
  -- create the animation that links the animation curve with the remapper
  local anim = MOAIAnim:new ()
  anim:reserveLinks ( 1 )
  
  anim:setLink (1, curve, self.remapper, 1)
  anim:setMode (animationMode)
  
  -- store it under the name of the animation
  self.animations[name] = anim
  
end


function AnimatedProp:getAnimation ( name )
  return self.animations[name]
end


function AnimatedProp:startAnimation ( name )
  if self.currentAnimation then self.currentAnimation:stop () end
  self.currentAnimation = self:getAnimation ( name )
  self.currentAnimation:start ()
  return self.currentAnimation
end


function AnimatedProp:stopCurrentAnimation ()
  if self.currentAnimation then
    self.currentAnimation:stop ()
  end
end


function AnimatedProp:stopAnimation ( name )
  MOAICoroutine.blockOnAction ( self.animations[name]:stop () )
  self.currentAnimation = nil
end


function AnimatedProp:pauseAnimation ( name )
  MOAICoroutine.blockOnAction ( self.animations[name]:pause () )
  self.currentAnimation = nil
end


---- methods forwarded to MOAIProp2D

function AnimatedProp:setLoc ( ... )
  self.prop:setLoc ( unpack (arg) )
end
