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
        script_damage_received = "mods/stote_perks/scripts/revenge_nuke_maybe.lua",
        execute_every_n_frame = "-1",
      } )
    end,
  })