ModLuaFileAppend( "data/scripts/perks/perk_list.lua", "mods/stote_perks/files/scripts/perks_iureka.lua" )
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
	-- default perks
	"CRITICAL_HIT"  --addto list
	"BREATH_UNDERWATER"
	"EXTRA_MONEY"
	"EXTRA_MONEY_TRICK_KILL"
	"HOVER_BOOST"
	"MOVEMENT_FASTER"  -- add to list
	"LOW_GRAVITY"  -- add to list
	"SPEED_DIVER" --FASTER SWIMMING
	"STRONG_KICK"
	"REPELLING_CAPE"
	"EXPLODING_CORPSES"  -- add to list
	"SAVING_GRACE"
	"INVISIBILITY"
	"GLOBAL_GORE" --MORE BLOOD  -- add to list
	"REMOVE_FOG_OF_WAR" --SEE ALL  -- add to list
	"VAMPIRISM"  -- add to list
	"EXTRA_HP"
	"HEARTS_MORE_EXTRA_HP"
	"GLASS_CANNON"  -- add to list
	"RESPAWN" --EXTRA LIFE
	"WORM_ATTRACTOR"  -- add to list
	"WORM_DETRACTOR"
	"PROTECTION_FIRE"
	"PROTECTION_RADIOACTIVITY"
	"PROTECTION_EXPLOSION"
	"PROTECTION_MELEE"  -- add to list
	"PROTECTION_ELECTRICITY"  -- add to list
	"TELEPORTITIS"  -- add to list
	"STAINLESS_ARMOUR"
	"EDIT_WANDS_EVERYWHERE"  -- add to list
	"ABILITY_ACTIONS_MATERIALIZED" --THROWABLE BOMBS
	"PROJECTILE_HOMING"
	"PROJECTILE_HOMING_SHOOTER" --BOOMERANG
	"FREEZE_FIELD"  -- add to list
	"DISSOLVE_POWDERS"  -- add to list
	"BLEED_SLIME"
	"BLEED_OIL"
	"SHIELD"
	"REVENGE_EXPLOSION"  -- add to list
	"REVENGE_TENTACLE"  -- add to list
	"ATTACK_FOOT"
	"PLAGUE_RATS"
	"ELECTRICITY"
	"ATTRACT_ITEMS"  -- add to list
	"EXTRA_KNOCKBACK"  -- add to list
	"LOWER_SPREAD"
	"BOUNCE"
	"MYSTERY_EGGPLANT" --???
	"EXTRA_PERK"
	"PERK_LOTTERY"
	"GENOME_MORE_HATRED"
	"GENOME_MORE_LOVE"

	--custom perks
	"REVENGE_NUKE_MAYBE"
	"REVENGE_TENTACLE_PORTAL"
	"REVENGE_EARTH_SPIRIT"
	"MOVEMENT_SLOWER"
	"EVAPORATE_BLOOD"


	"SPREAD_INCREASE",

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
	  "BLEED_OIL", "ELECTRICITY", "REVENGE_TENTACLE_PORTAL", "REVENGE_EARTH_SPIRIT",
	  "MOVEMENT_SLOWER", "EVAPORATE_BLOOD"} 
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
			--protect from having VAMPIRISM and FREEZE_FIELD or EVAPORATE_BLOOD at the same time
			if perks[perk_id_to_add] == "VAMPIRISM" then 
				if has_value(added_perk_list, "FREEZE_FIELD") or has_value(added_perk_list, "EVAPORATE_BLOOD")then
					flag = 0
				else
					flag = 1
				end
			--protect from having FREEZE_FIELD and VAMPIRISM at the same time
			elseif perks[perk_id_to_add] == "FREEZE_FIELD" then 
				if has_value(added_perk_list, "VAMPIRISM") then
					flag = 0
				else
					flag = 1
				end
			--protect from having EVAPORATE_BLOOD and VAMPIRISM at the same time
			elseif perks[perk_id_to_add] == "EVAPORATE_BLOOD" then 
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
  local p_entity2 = perk_spawn( x, y, "SPREAD_INCREASE")
  if ( p_entity2 ~= nil ) then
    perk_pickup( p_entity2, player_entity, EntityGetName( p_entity2 ), false, false )
  end
end