-- --==============================================================
-- -- The Insulines
-- -- Copyright (c) 2010-2012 quov.is
-- -- All Rights Reserved. 
-- -- http://quov.is // http://theinsulines.com
-- --==============================================================
-- 

if DEBUG then
  josh = character.new ( 'josh' )
  josh.renderPriority = 200
  
  nancy = character.new ( 'nancy' )
  nancy.renderPriority = 100
  
  howard = character.new ( 'howard' )
  howard.renderPriority = 0
  howard.layer_name = 'objects'
  howard.priority = 10
  howard.avoid_clicks = false
  howard.onClick = function ( room )
    room:talkTo( 'howard' )
  end
  
  klein = character.new ( 'klein' )
  klein.renderPriority = 0
  klein.layer_name = 'objects'
  klein.priority = 10
  klein.avoid_clicks = false
  klein.onClick = function ( room )
    room:talkTo( 'klein' )
  end
  
  sonja = character.new ( 'sonja' )
  sonja.renderPriority = 0
  sonja.layer_name = 'objects'
  sonja.priority = 10
  sonja.pathNode = 'stuff'
  sonja.avoid_clicks = false
  sonja.onClick = function ( room )
    room:talkTo( 'sonja' )
  end
  
  paul = character.new ( 'paul' )
  paul.renderPriority = 0
  paul.layer_name = 'objects'
  paul.priority = 10
  paul.pathNode = 'pete_and_paul'
  paul.avoid_clicks = false
  paul.onClick = function ( room )
    room:talkTo( 'paul' )
  end
  
  pete = character.new ( 'pete' )
  pete.renderPriority = 0
  pete.layer_name = 'objects'
  pete.priority = 10
  pete.pathNode = 'pete_and_paul'
  pete.avoid_clicks = false
  pete.onClick = function ( room )
    room:talkTo( 'pete' )
  end
end
