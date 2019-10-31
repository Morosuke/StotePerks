dofile("data/scripts/lib/utilities.lua")

table.insert( perk_list,
{
	id = "THE_ITIS",
	ui_name = "The Itis",
	ui_description = "You recover from teh Itis.",
	ui_icon = "mods/stote_perks/files/ui/itis.png",
	perk_icon = "mods/stote_perks/files/ig/itis.png",
	--not_in_default_perk_pool = cfg_disable_wandbuff,
	func = function( entity_perk_item, entity_who_picked, item_name )
		
		--27
		for k,v in pairs(perk_list) do
			if k == "TELEPORTITIS" then
				local x,y = EntityGetTransform( player_entity )
				local p_entity = perk_spawn( x, y, perk.id )
				if ( p_entity ~= nil ) then
					perk_remove( p_entity, player_entity, EntityGetName( p_entity ), false, false )
				end
			end
		end

			
	end,
		
})


