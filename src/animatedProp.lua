--==============================================================
-- The Insulines
-- Copyright (c) 2010-2012 quov.is
-- All Rights Reserved. 
-- http://quov.is // http://theinsulines.com
--==============================================================

--module ("animatedProp", package.seeall)

AnimatedProp = {}
AnimatedProp.__index = AnimatedProp


function AnimatedProp.new ()
  local newObj = {}
    newObj.animations = {}
    newObj.currentAnimation = nil
    newObj.prop = MOAIProp2D.new ()
    newObj.remapper = nil
  
  setmetatable (newObj, AnimatedProp)
  return newObj
end


function AnimatedProp:setDeck (spriteSheetDeck)
  self.prop:setDeck (spriteSheetDeck)
  
  -- create the remapper
  self.remapper = MOAIDeckRemapper.new ()
  self.remapper:reserve (1)
  
  self.prop:setRemapper (self.remapper)
end


function AnimatedProp:addConstantAnimation (name, startFrame, frameCount, frameTime, animationMode)
  
  if not animationMode then animationMode = MOAITimer.LOOP end
  
  local lastFrame = startFrame + frameCount
  
  -- create the animation curve and set equally timed frames starting on startFrame and lasting frameCount frames
  local curve = MOAIAnimCurve.new ()
  curve:reserveKeys (2)
  curve:setKey (1, 0, startFrame, MOAIEaseType.LINEAR)
  curve:setKey (2, frameTime * (lastFrame - 1), lastFrame, MOAIEaseType.LINEAR)
  
  -- create the animation that links the animation curve with the remapper
  local anim = MOAIAnim:new ()
  anim:reserveLinks (1)
  
  anim:setLink (1, curve, self.remapper, 1)
  anim:setMode (animationMode)
  
  -- store it under the name of the animation
  self.animations[name] = anim
end


function AnimatedProp:getAnimation ( name )
  return self.animations[name]
end


function AnimatedProp:startAnimation ( name )
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


---- methods forwarded to MOAIProp2D

function AnimatedProp:setLoc ( ... )
  self.prop:setLoc ( unpack (arg) )
end
