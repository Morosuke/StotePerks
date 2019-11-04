dofile("data/scripts/lib/utilities.lua")

table.insert( perk_list,
{
  id = "REVENGE_NUKE_MAYBE",
  ui_name = "Revenge Nuke Maybe",
  ui_description = "When you take damage you might go off like a Nuke.",
  ui_icon = "mods/stote_perks/files/ui/revenge_nuke.png",
  perk_icon = "mods/stote_perks/files/ig/revenge_nuke.png",
  
  func = function( entity_perk_item, entity_who_picked, item_name )
    EntityAddComponent( entity_who_picked, "LuaComponent", 
    { 
      script_damage_received = "mods/stote_perks/files/scripts/revenge_nuke_maybe.lua",
      execute_every_n_frame = "-1",
    } )
  end,
})

table.insert( perk_list,
{
  id = "REVENGE_TENTACLE_PORTAL",
  ui_name = "Revenge Tentacle Portal",
  ui_description = ".",
  ui_icon = "mods/stote_perks/files/ui/test_perk.png",
  perk_icon = "mods/stote_perks/files/ig/test_perk.png",
  func = function( entity_perk_item, entity_who_picked, item_name )
    EntityAddComponent( entity_who_picked, "LuaComponent", 
    { 
      script_damage_received = "mods/stote_perks/files/scripts/revenge_tentacle_portal.lua",
      execute_every_n_frame = "-1",
    } )
  end,
})

table.insert( perk_list,
{
  id = "REVENGE_EARTH_SPIRIT",
  ui_name = "Revenge Earth Spirit",
  ui_description = ".",
  ui_icon = "mods/stote_perks/files/ui/test_perk.png",
  perk_icon = "mods/stote_perks/files/ig/test_perk.png",

  func = function( entity_perk_item, entity_who_picked, item_name )
    EntityAddComponent( entity_who_picked, "LuaComponent", 
    { 
      script_damage_received = "mods/stote_perks/files/scripts/revenge_pebble.lua",
      execute_every_n_frame = "-1",
    } )
  end,
})

table.insert( perk_list,
{
  id = "MOVEMENT_SLOWER",
  ui_name = "Slower Movement",
  ui_description = "You now walk slower.",
  ui_icon = "mods/stote_perks/files/ui/test_perk.png",
  perk_icon = "mods/stote_perks/files/ig/test_perk.png",
  game_effect = "MOVEMENT_SLOWER",
})



table.insert( perk_list,
{
  id = "EVAPORATE_BLOOD",
  ui_name = "Evaporate Blood",
  ui_description = "All blood will evaporate as you get near.",
  ui_icon = "mods/stote_perks/files/ui/test_perk.png",
  perk_icon = "mods/stote_perks/files/ig/test_perk.png",
  func = function( entity_perk_item, entity_who_picked, item_name )
    local x,y = EntityGetTransform( entity_who_picked )
    local child_id = EntityLoad( "mods/stote_perks/files/entities/evaporate_blood.xml", x, y )
    EntityAddChild( entity_who_picked, child_id )
  end,
})

--[[
table.insert( perk_list,
{
  id = "POISON_BLOOD",
  ui_name = "Poison Blood",
  ui_description = "Your blood turns to poison upon contact with air.",
  ui_icon = "mods/stote_perks/files/ui/test_perk.png",
  perk_icon = "mods/stote_perks/files/ig/test_perk.png",
  func = function( entity_perk_item, entity_who_picked, item_name )
  
    local damagemodels = EntityGetComponent( entity_who_picked, "DamageModelComponent" )
    if( damagemodels ~= nil ) then
      for i,damagemodel in ipairs(damagemodels) do
        ComponentSetValue( damagemodel, "blood_material", "poison" )
        ComponentSetValue( damagemodel, "blood_spray_material", "poison" )
        ComponentSetValue( damagemodel, "blood_multiplier", "3.0" )
        ComponentSetValue( damagemodel, "blood_sprite_directional", "data/particles/bloodsplatters/bloodsplatter_directional_oil_$[1-3].xml" )
        ComponentSetValue( damagemodel, "blood_sprite_large", "data/particles/bloodsplatters/bloodsplatter_oil_$[1-3].xml" )
        
        local explosion_resistance = tonumber(ComponentObjectGetValue( damagemodel, "damage_multipliers", "explosion" ))
        explosion_resistance = explosion_resistance * 0.6
        ComponentObjectSetValue( damagemodel, "damage_multipliers", "explosion", tostring(explosion_resistance) )
      end
    end
    
  end,

})

table.insert( perk_list,
{
  id = "ACID_BLOOD",
  ui_name = "Acid Blood",
  ui_description = ".",
  ui_icon = "mods/stote_perks/files/ui/test_perk.png",
  perk_icon = "mods/stote_perks/files/ig/test_perk.png",
  func = function( entity_perk_item, entity_who_picked, item_name )
  
    local damagemodels = EntityGetComponent( entity_who_picked, "DamageModelComponent" )
    if( damagemodels ~= nil ) then
      for i,damagemodel in ipairs(damagemodels) do
        ComponentSetValue( damagemodel, "blood_material", "acid" )
        ComponentSetValue( damagemodel, "blood_spray_material", "acid" )
        ComponentSetValue( damagemodel, "blood_multiplier", "3.0" )
        ComponentSetValue( damagemodel, "blood_sprite_directional", "data/particles/bloodsplatters/bloodsplatter_directional_oil_$[1-3].xml" )
        ComponentSetValue( damagemodel, "blood_sprite_large", "data/particles/bloodsplatters/bloodsplatter_oil_$[1-3].xml" )
        
        local explosion_resistance = tonumber(ComponentObjectGetValue( damagemodel, "damage_multipliers", "explosion" ))
        explosion_resistance = explosion_resistance * 0.6
        ComponentObjectSetValue( damagemodel, "damage_multipliers", "explosion", tostring(explosion_resistance) )
      end
    end
    
  end,

})

table.insert( perk_list,
{
  id = "SPREAD_INCREASE",
  ui_name = "Spread Increase",
  ui_description = "increases spread of your wands.",
  ui_icon = "mods/stote_perks/files/ui/test_perk.png",
  perk_icon = "mods/stote_perks/files/ig/test_perk.png",
  func = function( entity_perk_item, entity_who_picked, item_name )
    EntityAddComponent( entity_who_picked, "ShotEffectComponent", 
    { 
      extre_modifier = function()
      c.spread_degrees = c.spread_degrees + 50
      c.speed_multiplier = c.speed_multiplier * 1.2
      shot_effects.recoil_knockback = shot_effects.recoil_knockback + 25.0
      end,
    } )
  end,
})

]]
--[[
  --temp todo
  "SCATTER"
]]--