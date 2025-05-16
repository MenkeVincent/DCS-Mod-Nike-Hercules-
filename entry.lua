self_ID = "Nike Hercules"
declare_plugin(self_ID, {
    installed         = true,
    displayName       = _("Nike Hurcules"),
    shortName         = "NikeHurcules",
    state             = "installed",
    developerName     = "ACI Productions",
    version           = "1.0",
    info              = _("Adds the Nike Hurcules air defense unit to DCS world."),
    encyclopedia_path = current_mod_path .. '/Encyclopedia',
})

-- Mount paths:
-- mount_vfs_liveries_path(current_mod_path .. "/Liveries")
mount_vfs_model_path(current_mod_path .. "/Shapes")
mount_vfs_texture_path(current_mod_path .. "/Textures")

local function info_msg(msg)
    if _G.log and log.info then
        log.info("[Nike Launcher] " .. msg)
    end
end

info_msg("Entry started.");

local function vehicle_file(f)
    info_msg("Loading vehicle file: " .. f)
    if dofile(current_mod_path .. f) then
        error("can't load file " .. f)
        return
    end
    if GT then
        info_msg("GT loaded from " .. f)
        GT.shape_table_data = {
            {
                file        = GT.visual.shape,
                username    = GT.Name,
                desrt       = GT.visual.shape_dstr,
                classname   = "lLandVehicle",
                positioning = "BYNORMAL",
                life        = GT.life or 5,
            },
            {
                name = GT.visual.shape_dstr,
                file = GT.visual.shape_dstr,
            },
        }
        add_surface_unit(GT)
        info_msg("Vehicle registered.");
        GT = nil
    else
        error("GT empty in file " .. f)
    end
end

local function weapon_file(f)
    info_msg("Loading weapon file: " .. f)
    if dofile(current_mod_path .. f) then
        error("can't load file " .. f)
        return
    end
end

vehicle_file("/Database/Vehicle/Nike_Launcher.lua")
weapon_file("/Database/Weapon/Missile_MIM14.lua")

plugin_done()
info_msg("Entry finished: Plugin loaded.");
