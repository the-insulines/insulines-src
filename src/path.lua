--==============================================================
-- The Insulines
-- Copyright (c) 2010-2012 quov.is
-- All Rights Reserved. 
-- http://quov.is // http://theinsulines.com
--==============================================================

module ( "Path", package.seeall )

function new (graph)

  local path = {}
  
  path.graph = graph
  
  -- function path:nearestPathPointToPoint ( x, y )
  -- end
    
  function path:nearestPointToPointInSegment ( segment, targetPoint )
    
    -- get the normalized direction vector of the segment
    local segmentVector = (segment.p1) - (segment.p2)
    
    -- determine the length of the projection (dot product) over the segment of
    -- the vector established by the point and one end of the segment
    local projectionLength = ( targetPoint - segment.p2 ) .. segmentVector
    projectionLength = projectionLength / ( segmentVector:squaredLen () )
    
    -- trim the projection to the ends of the segment so it sticks to the distance against a segment, not a line
    if projectionLength > 1 then
      projectionLength = 1
    elseif projectionLength < 0 then
      projectionLength = 0
    end

    local nearestPoint = segment.p2 + segmentVector * projectionLength
    return nearestPoint, (nearestPoint - targetPoint):squaredLen ()
  end

  
  function path:debug( layer )
    self.gfx = MOAIScriptDeck.new ()
    self.gfx:setRect ( - WORLD_RESOLUTION_X / 2, - WORLD_RESOLUTION_Y / 2, WORLD_RESOLUTION_X / 2, WORLD_RESOLUTION_Y / 2 )
    
    self.draw = function ()
      local x, y = input_manager.position ()
      if x and y then
        local mousePoint = point ( layer:wndToWorld (x, y) )
        Path.drawPath ( self, mousePoint, layer )
      end
    end
    
    self.gfx:setDrawCallback ( self.draw )
    self.prop = MOAIProp2D.new ()
    self.prop:setDeck ( self.gfx )
    layer:insertProp ( self.prop )
  end
  
  return path
end




function drawPath ( path, point, layer )
  local graph = path.graph
  
  for k, v in pairs ( graph ) do
    local node = v
    
    for j = 1, table.getn ( node.neighbors ) do
      local nextNode = graph[node.neighbors[j]]
      local segment = {p1 = node.position, p2 = nextNode.position}
      local nearest = path:nearestPointToPointInSegment ( segment, point )
      MOAIDraw.fillCircle ( nearest.x, nearest.y, 3, 10 )
      MOAIDraw.drawLine ( node.position.x, node.position.y, nextNode.position.x, nextNode.position.y )
    end
  end
end


-- function drawPath ( path, layer )
--   local graph = path.graph
--   
--   for k, v in pairs ( graph ) do
--     local node = v
--     
--     for j = 1, table.getn ( node.neighbors ) do
--       local nextNode = graph[node.neighbors[j]]
--     end
--   end
-- end

