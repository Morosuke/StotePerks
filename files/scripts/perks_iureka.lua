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

--[[
table.insert( perk_list,
{
  id = "REVENGE_ELDRITCH_PORTAL",
  ui_name = "Revenge Eldritch Portal",
  ui_description = ".",
  --ui_icon = "mods/stote_perks/files/ui/.png",
  --perk_icon = "mods/stote_perks/files/ig/.png",

})

table.insert( perk_list,
{
  id = "REVENGE_EARTH_SPIRIT",
  ui_name = "Revenge Earth Spirit",
  ui_description = ".",
  --ui_icon = "mods/stote_perks/files/ui/.png",
  --perk_icon = "mods/stote_perks/files/ig/.png",

})

table.insert( perk_list,
{
  id = "MOVEMENT_SLOWER",
  ui_name = "Slower Movement",
  ui_description = "You now walk slower.",
  --ui_icon = "mods/stote_perks/files/ui/movement_slower.png",
  --perk_icon = "mods/stote_perks/files/ig/movement_slower.png",

})

table.insert( perk_list,
{
  id = ""EVAPORATE_BLOOD"",
  ui_name = "Evaporate Blood",
  ui_description = ".",
  --ui_icon = "mods/stote_perks/files/ui/.png",
  --perk_icon = "mods/stote_perks/files/ig/.png",

})

table.insert( perk_list,
{
  id = "POISON_BLOOD",
  ui_name = "Poison Blood",
  ui_description = "Your blood turns to poison.",
  --ui_icon = "mods/stote_perks/files/ui/.png",
  --perk_icon = "mods/stote_perks/files/ig/.png",

})

table.insert( perk_list,
{
  id = "ACID_BLOOD",
  ui_name = "Acid Blood",
  ui_description = ".",
  --ui_icon = "mods/stote_perks/files/ui/.png",
  --perk_icon = "mods/stote_perks/files/ig/.png",

})

table.insert( perk_list,
{
  id = "SPREAD_INCREASE",
  ui_name = "",
  ui_description = ".",
  --ui_icon = "mods/stote_perks/files/ui/.png",
  --perk_icon = "mods/stote_perks/files/ig/.png",

})

]]--
--[[
  --temp todo
  "SCATTER"
]]--