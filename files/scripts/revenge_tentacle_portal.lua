dofile( "data/scripts/lib/utilities.lua" )

function damage_received( damage, desc, entity_who_caused, is_fatal )
	local entity_id    = GetUpdatedEntityID()
	local pos_x, pos_y = EntityGetTransform( entity_id )
	
	if( entity_who_caused == entity_id ) then return end
  
	-- check that we're only shooting every 500 frames
	if script_wait_frames( entity_id, 30 ) then  return  end
	shoot_projectile( entity_id, "data/entities/projectile/tentacle_portal.xml", pos_x, pos_y, 0, 0 )
end