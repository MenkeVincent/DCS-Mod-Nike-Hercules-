self_ID = "Nike Hercules"

local function debug_log(msg)
    if env and env.info then
        env.info("[NikeHurcules][DEBUG] " .. tostring(msg))
    elseif log and log.info then
        log.info("[NikeHurcules][DEBUG] " .. tostring(msg))
    end
end

local function debug_error(msg)
    if env and env.error then
        env.error("[NikeHurcules][ERROR] " .. tostring(msg))
    elseif log and log.error then
        log.error("[NikeHurcules][ERROR] " .. tostring(msg))
    end
end

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

mount_vfs_model_path(current_mod_path .. "/Shapes")
mount_vfs_texture_path(current_mod_path .. "/Textures")

debug_log("entry.lua started.")

-- Try to load weapon file
debug_log("Trying to load /Database/Weapon/Missile_MIM14.lua")
dofile(current_mod_path .. "/Database/Weapon/Missile_MIM14.lua")
debug_log("Loaded /Database/Weapon/Missile_MIM14.lua")

-- Try to load vehicle file
debug_log("Trying to load /Database/Vehicle/Nike_Launcher.lua")
dofile(current_mod_path .. "/Database/Vehicle/Nike_Launcher.lua")
debug_log("Loaded /Database/Vehicle/Nike_Launcher.lua")

debug_log("Calling plugin_done()")
plugin_done()
debug_log("entry.lua finished.")