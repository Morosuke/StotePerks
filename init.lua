ModLuaFileAppend( "data/scripts/perks/perk_list.lua", "mods/stote_perks/perks_iureka.lua" )
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
	local perk1 = "CRITICAL_HIT"  --addto list
	local perk2 = "BREATH_UNDERWATER"
	local perk3 = "EXTRA_MONEY"
	local perk4 = "EXTRA_MONEY_TRICK_KILL"
	local perk5 = "HOVER_BOOST"
	local perk6 = "MOVEMENT_FASTER"  -- add to list
	local perk7 = "LOW_GRAVITY"  -- add to list
	local perk8 = "SPEED_DIVER" --FASTER SWIMMING
	local perk9 = "REPELLING_CAPE"
	local perk10 = "EXPLODING_CORPSES"  -- add to list
	local perk11 = "SAVING_GRACE"
	local perk12 = "INVISIBILITY"
	local perk13 = "GLOBAL_GORE" --MORE BLOOD  -- add to list
	local perk14 = "REMOVE_FOG_OF_WAR" --SEE ALL  -- add to list
	local perk15 = "VAMPIRISM"  -- add to list
	local perk16 = "EXTRA_HP"
	local perk17 = "HEARTS_MORE_EXTRA_HP"
	local perk18 = "GLASS_CANNON"  -- add to list
	local perk19 = "RESPAWN" --EXTRA LIFE
	local perk20 = "WORM_ATTRACTOR"  -- add to list
	local perk21 = "WORM_DETRACTOR"
	local perk22 = "PROTECTION_FIRE"
	local perk23 = "PROTECTION_RADIOACTIVITY"
	local perk24 = "PROTECTION_EXPLOSION"
	local perk25 = "PROTECTION_MELEE"  -- add to list
	local perk26 = "PROTECTION_ELECTRICITY"  -- add to list
	local perk27 = "TELEPORTITIS"  -- add to list
	local perk28 = "STAINLESS_ARMOUR"
	local perk29 = "EDIT_WANDS_EVERYWHERE"  -- add to list
	local perk30 = "ABILITY_ACTIONS_MATERIALIZED" --THROWABLE BOMBS
	local perk31 = "PROJECTILE_HOMING"
	local perk32 = "PROJECTILE_HOMING_SHOOTER" --BOOMERANG
	local perk33 = "FREEZE_FIELD"  -- add to list
	local perk34 = "DISSOLVE_POWDERS"  -- add to list
	local perk35 = "BLEED_SLIME"
	local perk36 = "BLEED_OIL"
	local perk37 = "SHIELD"
	local perk38 = "REVENGE_EXPLOSION"  -- add to list
	local perk39 = "REVENGE_TENTACLE"  -- add to list
	local perk40 = "ELECTRICITY"
	local perk41 = "ATTRACT_ITEMS"  -- add to list
	local perk42 = "EXTRA_KNOCKBACK"  -- add to list
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
	local perks = { "CRITICAL_HIT", "MOVEMENT_FASTER", "EXPLODING_CORPSES", "GLOBAL_GORE",
	 "REMOVE_FOG_OF_WAR", "VAMPIRISM", "GLASS_CANNON", "WORM_ATTRACTOR", "TELEPORTITIS",
	 "EDIT_WANDS_EVERYWHERE", "FREEZE_FIELD", "DISSOLVE_POWDERS", "REVENGE_EXPLOSION",
	  "REVENGE_TENTACLE", "ATTRACT_ITEMS", "EXTRA_KNOCKBACK", "REVENGE_NUKE_MAYBE", 
	  "BLEED_OIL", "ELECTRICITY" } 
	-- add perk ID to this array to add new perk to the pool for the start of the game
	local added_perk_list = {}
	local total_perks_in_custom_list = #perks

	local num_perks_to_add = Random(4, 9)

	for i=1,num_perks_to_add, 1 do
		local perk_id_to_add = Random(1, total_perks_in_custom_list)
      	local flag = -1

		--check to see if a perk is already
		if has_value(added_perk_list, perks[perk_id_to_add]) then
		    --allow for multiple copies of GLASS_CANNON to be added cause fuck you
			if perks[perk_id_to_add] == "GLASS_CANNON" then
				flag = 1
			else
				flag = 0
			end	
		else
			if perks[perk_id_to_add] == "VAMPIRISM" then --protect from having VAMPIRISM and FREEZE_FIELD at the same time
				if has_value(added_perk_list, "FREEZE_FIELD") then
					flag = 0
				else
					flag = 1
				end
			elseif perks[perk_id_to_add] == "FREEZE_FIELD" then --protect from having FREEZE_FIELD and VAMPIRISM at the same time
				if has_value(added_perk_list, "VAMPIRISM") then
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
			local perk = perks[perk_id_to_add]
			local p_entity = perk_spawn( x, y, perk)
			if ( p_entity ~= nil ) then
				perk_pickup( p_entity, player_entity, EntityGetName( p_entity ), false, false )
				table.insert(added_perk_list, perk)
			end
		end
	end
  -- add test perk
  --local p_entity2 = perk_spawn( x, y, "REVENGE_NUKE_MAYBE")
  --if ( p_entity2 ~= nil ) then
  --  perk_pickup( p_entity2, player_entity, EntityGetName( p_entity2 ), false, false )
  --end
end