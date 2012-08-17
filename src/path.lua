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
  
  function path:steps ( sourcePoint, targetPoint )
    local sourcePointOnPath, sourceSegment = self:nearestPointOnPath ( sourcePoint )
    local targetPointOnPath, targetSegment = self:nearestPointOnPath ( targetPoint )
    
    local targetNode = self:nearestNodeNameToPoint ( targetSegment, targetPointOnPath )
    
    -- calculate the minimum path starting on each node of the source segment
    local sourceNode1 = self:nodeNameForPoint (sourceSegment.p1)
    local sourceNode2 = self:nodeNameForPoint (sourceSegment.p2)
    local distances1, previous1 = self:findMinimumPath ( sourceNode1, targetNode )
    local distances2, previous2 = self:findMinimumPath ( sourceNode2, targetNode )
    
    -- choose the minimum between both previous paths
    local distances, previous
    local sourceNode
    if distances1[targetNode] < distances2[targetNode] then
      distances = distances1
      previous = previous1
      sourceNode = sourceNode1
    else
      distances = distances2
      previous = previous2
      sourceNode = sourceNode2
    end
    
    local steps = self:assemblePath ( previous, sourceNode, targetNode, sourceSegment, targetSegment, targetPointOnPath )
    
    return steps
  end
  
  
  function path:findMinimumPath ( sourceNode, targetNode )
    
    local nodes = self:nodeNames ()
    local visited = {}
    local previous = {}
    local distances = {}
    
    -- Setup initital distance to source to 0 and the others to nil (infinite distance)
    distances[sourceNode] = 0
    
    while #nodes > 0 do
      
      local nearestNodeIndex, nearestNodeName = self:nodeWithSmallestDistance(nodes, distances)
      
      -- if the target node was selected, it has the shortest path and it won't have a shorter one
      if nearestNodeName == targetSegment then
        break
      end
      
      -- remove the selected node from the list
      table.remove ( nodes, nearestNodeIndex )
      
      -- for every neighbor, update the shortest distance
      for index, neighbor in pairs ( self.graph[nearestNodeName].neighbors ) do
        local nearestDistance = distances[nearestNodeName] + (self.graph[nearestNodeName].position - self.graph[neighbor].position):len ()
        
        if distances[neighbor] == nil or nearestDistance < distances[neighbor] then
          distances[neighbor] = nearestDistance
          previous[neighbor] = nearestNodeName
        end
        
      end
      
    end
    
    return distances, previous
  end
  
  
  function path:assemblePath ( previous, sourceNode, targetNode, sourceSegment, targetSegment, targetPointOnPath )
    local steps = {}
    
    -- build list of steps
    local currentNode = targetNode
    
    -- loop through the path nodes (starting on the target and finishing when reaching the source)
    -- adding them to steps
    while ( currentNode ~= sourceNode ) do
      table.insert ( steps, self.graph[currentNode].position )
      currentNode = previous[currentNode]
    end
    
    -- if the source and target nodes are on the same segment, the path souldn't contain any path nodes
    local targetSegmentNode1 = self:nodeNameForPoint ( targetSegment.p1 )
    local targetSegmentNode2 = self:nodeNameForPoint ( targetSegment.p2 )
    
    if not (( sourceSegment.p1 == targetSegment.p1 and sourceSegment.p2 == targetSegment.p2 )
        or ( sourceSegment.p1 == targetSegment.p2 and sourceSegment.p2 == targetSegment.p1 )) then
      table.insert ( steps, self.graph[sourceNode].position )
    end
    
    -- reverse the path so the nodes on it are stored in the order in which they will be traversed
    steps = table.reverse ( steps )

    -- if the target node and the previous one are on the same segment, remove the target node
    -- this is because we are interested in finding the target segment but we feed it just one node
    if #steps >= 2 then
      local previousNode = steps[#steps - 1]
      
      if previousNode == targetSegment.p1 or previousNode == targetSegment.p2 then
        table.remove ( steps, #steps )
      end
    end
    
    -- add the target point to the path, it wasn't added before because the algorithm just traverses the path nodes
    table.insert ( steps, targetPointOnPath )
    
    return steps
  end
  
  
  function path:nodeWithSmallestDistance ( nodes, distances )
    local node = nil
    local index = nil
    
    for k, v in pairs ( nodes ) do
      if distances[v] and ((node == nil) or (distances[node] > distances[v])) then
        node = v
        index = k
      end
    end
    
    return index, node
  end
  
  function path:nodeNames ()
    local names = {}
    
    for k, v in pairs (self.graph) do
      table.insert(names, k)
    end
    
    return names
  end
  
  
  function path:nodeNameForPoint ( point )
  
    for k, v in pairs (self.graph) do
      if v.position == point then
        return k
      end
    end
  
  end
  
  
  function path:nearestNodeToPoint ( segment, point )
    local p1_delta = (segment.p1 - point):squaredLen ()
    local p2_delta = (segment.p2 - point):squaredLen ()
    
    if p1_delta < p2_delta then
      return segment.p1
    else
      return segment.p2
    end
  end
  
  
  function path:nearestNodeNameToPoint( segment, point )
    return self:nodeNameForPoint( self:nearestNodeToPoint ( segment, point ) )
  end
  
  
  function path:nearestPointOnPath ( targetPoint )
    local nearestPoint = nil
    local nearestSegment = nil
    local nearestPointDistanceSquare = nil
    
    for k, node in pairs ( graph ) do
      for j = 1, table.getn ( node.neighbors ) do
        local nextNode = graph[node.neighbors[j]]
        local segment = { p1 = node.position, p2 = nextNode.position }
        local localNearest, localDistanceSquare = path:nearestPointToPointInSegment ( segment, targetPoint )

        if nearestPoint == nil or nearestPointDistanceSquare > localDistanceSquare then
          nearestPoint = localNearest
          nearestPointDistanceSquare = localDistanceSquare
          nearestSegment = segment
        end
      end
    end

    return nearestPoint, nearestSegment
  end
  
  
  function path:nearestPointToPointInSegment ( segment, targetPoint )
    
    -- get the normalized direction vector of the segment
    local segmentVector = (segment.p1) - (segment.p2)
    
    -- determine the length of the projection (dot product) over the segment of
    -- the vector established by the point and one end of the segment
    local projectionLength = ( targetPoint - segment.p2 ):dotProduct (segmentVector)
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

