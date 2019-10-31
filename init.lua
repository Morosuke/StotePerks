dofile( "data/scripts/perks/perk.lua" )
dofile( "data/scripts/perks/perk_list.lua" )

function OnModPreInit()
	
end

function OnModInit()
	
end

function OnModPostInit()
	
end

--Need to figure out how to add perks at starting area from another mod for testing perposes
-- ENABLE_REMOVE_THE_ITIS_PERK = true
-- if ENABLE_REMOVE_THE_ITIS_PERK then

-- 	ModLuaFileAppend( "data/scripts/perks/perk_list.lua", "mods/more_perks/files/nuke/scripts/remove_the_itis.lua" )
	
-- end

local function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

function OnPlayerSpawned( player_entity ) -- this runs when player entity has been created

--[[
	-- spawn the perk
	-- somewhere between 2-8 is the new plague rats
	local perk1 = "CRITICAL_HIT"
	local perk2 = "BREATH_UNDERWATER"
	local perk3 = "EXTRA_MONEY"
	local perk4 = "EXTRA_MONEY_TRICK_KILL"
	local perk5 = "HOVER_BOOST"
	local perk6 = "MOVEMENT_FASTER"
	local perk7 = "LOW_GRAVITY"
	local perk8 = "SPEED_DIVER" --FASTER SWIMMING
	local perk9 = "REPELLING_CAPE"
	local perk10 = "EXPLODING_CORPSES"
	local perk11 = "SAVING_GRACE"
	local perk12 = "INVISIBILITY"
	local perk13 = "GLOBAL_GORE" --MORE BLOOD
	local perk14 = "REMOVE_FOG_OF_WAR" --SEE ALL
	local perk15 = "VAMPIRISM"
	local perk16 = "EXTRA_HP"
	local perk17 = "HEARTS_MORE_EXTRA_HP"
	local perk18 = "GLASS_CANNON"
	local perk19 = "RESPAWN" --EXTRA LIFE
	local perk20 = "WORM_ATTRACTOR"
	local perk21 = "WORM_DETRACTOR"
	local perk22 = "PROTECTION_FIRE"
	local perk23 = "PROTECTION_RADIOACTIVITY"
	local perk24 = "PROTECTION_EXPLOSION"
	local perk25 = "PROTECTION_MELEE"
	local perk26 = "PROTECTION_ELECTRICITY"
	local perk27 = "TELEPORTITIS"
	local perk28 = "STAINLESS_ARMOUR"
	local perk29 = "EDIT_WANDS_EVERYWHERE"
	local perk30 = "ABILITY_ACTIONS_MATERIALIZED" --THROWABLE BOMBS
	local perk31 = "PROJECTILE_HOMING"
	local perk32 = "PROJECTILE_HOMING_SHOOTER" --BOOMERANG
	local perk33 = "FREEZE_FIELD"
	local perk34 = "DISSOLVE_POWDERS"
	local perk35 = "BLEED_SLIME"
	local perk36 = "BLEED_OIL"
	local perk37 = "SHIELD"
	local perk38 = "REVENGE_EXPLOSION"
	local perk39 = "REVENGE_TENTACLE"
	local perk40 = "ELECTRICITY"
	local perk41 = "ATTRACT_ITEMS"
	local perk42 = "EXTRA_KNOCKBACK"
	local perk43 = "LOWER_SPREAD"
	local perk44 = "BOUNCE"
	local perk45 = "MYSTERY_EGGPLANT" --???
	local perk46 = "EXTRA_PERK"
	local perk47 = "PERK_LOTTERY"
	local perk48 = "GENOME_MORE_HATRED"
	local perk49 = "GENOME_MORE_LOVE"
]]--

	if tonumber(StatsGetValue("playtime")) > 1 then
		return
	end

	local x,y = EntityGetTransform( player_entity )

	SetRandomSeed(Random(), Random())

--[[ uncomment the code below to start the game with multiple perks ]]--
	local perks = { 1, 6, 10, 13, 14, 15, 18, 20, 27, 29, 33, 34, 25, 26, 38, 39, 41, 42 } -- add numbers to this array to add new perk at the start of the game
	local added_perk_list = {}
	local total_perks_in_custom_list = 18

	local num_perks_to_add = Random(4, 9)

	for i=1,num_perks_to_add, 1 do
		local perk_id_to_add = Random(1, total_perks_in_custom_list)
      	local flag = -1

		if perks[perk_id_to_add] ~= 22 or perks[perk_id_to_add] ~= 23 or perks[perk_id_to_add] ~= 24 or perks[perk_id_to_add] ~= 25 or perks[perk_id_to_add] ~= 26 then
	 		--check to see if a perk is already
			if has_value(added_perk_list, perks[perk_id_to_add]) then
				--allow for multiple copies of GLASS_CANNON to be added cause fuck you
				if perks[perk_id_to_add] == 18 then
					flag = 1
				else
					flag = 0
				end	
			else
				if perks[perk_id_to_add] == 15 then --protect from having VAMPIRISM and FREEZE_FIELD at the same time
					if has_value(added_perk_list, 33) then
						flag = 0
					else
						flag = 1
					end
				elseif perks[perk_id_to_add] == 33 then --protect from having FREEZE_FIELD and VAMPIRISM at the same time
					if has_value(added_perk_list, 15) then
						flag = 0
					else
						flag = 1
					end
				else
					flag = 1
				end
			end

			--if perk passes all checks add it to the players list
			if flag == 1 then
				local perk = perk_list[tonumber(perks[perk_id_to_add])]
				local p_entity = perk_spawn( x, y, perk.id )
				if ( p_entity ~= nil ) then
					perk_pickup( p_entity, player_entity, EntityGetName( p_entity ), false, false )
					table.insert(added_perk_list, perks[perk_id_to_add])
				end
			end

		end
	end
end
