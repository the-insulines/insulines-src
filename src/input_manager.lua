--==============================================================
-- The Insulines
-- Copyright (c) 2010-2012 quov.is
-- All Rights Reserved. 
-- http://quov.is // http://theinsulines.com
--==============================================================
module ( "input_manager", package.seeall )

local pointerX, pointerY = nil, nil

-- Set callback for mouse and touches
if MOAIInputMgr.device.pointer then
  local pointerCallback = function ( x, y )
   
   pointerX, pointerY = x, y

   if touchCallbackFunc then
     touchCallbackFunc ( MOAITouchSensor.TOUCH_MOVE, 1, pointerX, pointerY, 1 )
   end
  end
  
  MOAIInputMgr.device.pointer:setCallback ( pointerCallback )
    
end

----------------------------------------------------------------
-- exposed functions
----------------------------------------------------------------

function position ()
  return pointerX, pointerY
end
function down ( )
	
	if MOAIInputMgr.device.touch then	
		
		return MOAIInputMgr.device.touch:down ()
		
	elseif MOAIInputMgr.device.pointer then
		
		return (	
			MOAIInputMgr.device.mouseLeft:down ()
		)
	end
	
end

function getTouch ()
	
	if MOAIInputMgr.device.touch then	

		return MOAIInputMgr.device.touch:getTouch ()
		
	elseif MOAIInputMgr.device.pointer then
	
		return pointerX, pointerY, 1
	end
end

function wheel_delta ()
  
end