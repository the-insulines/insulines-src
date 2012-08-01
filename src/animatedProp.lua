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
    newObj.prop = MOAIProp2D.new ()
    newObj.remapper = nil
  
  setmetatable (newObj, AnimatedProp)
  return newObj
end


function AnimatedProp:setSpriteSheet (spriteSheetDeck)
  self.prop:setDeck (spriteSheetDeck)
  
  -- create the remapper
  self.remapper = MOAIDeckRemapper.new ()
  self.remapper:reserve (1)
  self.prop:setRemapper (self.remapper)
end


function AnimatedProp:addConstantAnimation (name, startFrame, frameCount, frameTime)
  local lastFrame = startFrame + frameCount
  
  -- create the animation curve and set equally timed frames starting on frameCount and lasting frameCount frames
  local curve = MOAIAnimCurve.new ()
  curve:reserveKeys (2)
  curve:setKey (1, 0, startFrame, MOAIEaseType.LINEAR)
  curve:setKey (2, frameTime * (lastFrame - 1), lastFrame, MOAIEaseType.LINEAR)
  
  -- create the animation that links the animation curve with the remapper
  local anim = MOAIAnim:new ()
  anim:reserveLinks (1)
  anim:setLink (1, curve, self.remapper, 1)
  anim:setMode (MOAITimer.LOOP)
  
  -- store it under the name of the animation
  self.animations[name] = anim
end


function AnimatedProp:startAnimation (name)
  MOAICoroutine.blockOnAction (self.animations[name]:start ())
end


---- methods forwarded to MOAIProp2D

function AnimatedProp:setLoc (...)
  self.prop:setLoc (unpack (arg))
end
