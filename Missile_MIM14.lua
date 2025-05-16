-- MIM14-Raketen Definition und Launcher-Konfig

-- Hilfsfunktionen
local function calcPiercingMass(warhead)
    warhead.piercing_mass = warhead.mass
    if (warhead.expl_mass / warhead.mass > 0.1) then
        warhead.piercing_mass = warhead.mass / 5.0
    end
end

local function simple_aa_warhead(power, caliber)
    local res = {}
    res.caliber = caliber
    res.mass = power
    res.expl_mass = power
    res.other_factors = {1, 1, 1}
    res.obj_factors = {1, 1}
    res.concrete_factors = {1, 1, 1}
    res.cumulative_factor = 0
    res.concrete_obj_factor = 0.0
    res.cumulative_thickness = 0.0

    calcPiercingMass(res)
    return res
end

-- Raketen-Definition
Nike_MIM14_MISSILE = {
    category = CAT_MISSILES,
    name = "MIM14_MISSILE",
    user_name = _("MIM14"),
    model = "NikeHercules",
    mass = 4860.0,
    wsTypeOfWeapon = {wsType_Weapon, wsType_Missile, wsType_SA_Missile, WSTYPE_PLACEHOLDER},

    Escort = 3,
    Head_Type = 6,
    sigma = {300, 300, 300},
    M = 4860.0,
    H_max = 100000.0,
    H_min = 2000,
    Diam = 800.0,
    Cx_pil = 1,
    D_max = 144841.0,
    D_min = 6000.0,
    Head_Form = 1,
    Life_Time = 90.0,
    Nr_max = 6,
    v_min = 4900.0,
    v_mid = 2500.0,
    Mach_max = 4.0,
    t_b = 0.0,
    t_acc = 15.0,
    t_marsh = 40.0,
    Range_max = 56000.0,
    H_min_t = 100.0,
    Fi_start = 3.14152,
    Fi_rak = 3.14152,
    Fi_excort = 0.75,
    Fi_search = 99.9,
    OmViz_max = 99.9,
    ccm_k0 = 3.0,

    PN_coeffs = {
        5,
        1000.0, 0.8,
        2000.0, 1.0,
        5000.0, 1.0,
        15000.0, 0.5,
        20000.0, 0.2
    },
    warhead = {
        mass = 302,
        expl_mass = 302,
        other_factors = {1, 1, 1},
        obj_factors = {1, 1},
        concrete_factors = {1, 1, 1},
        cumulative_factor = 0,
        concrete_obj_factor = 0.0,
        cumulative_thickness = 0.0,
        piercing_mass = 40.0,
        caliber = 500,
    },

    exhaust1 = {1, 1, 1, 1},
    X_back = -3.463,
    Y_back = 0.0,
    Z_back = 0.0,
    exhaust2 = {0.9, 0.9, 0.9, 0.05},
    X_back_acc = -6.0,
    Y_back_acc = 0.0,
    Z_back_acc = 0.0,
    Reflection = 0.3967,
    KillDistance = 150.0,
    shape_table_data = {
        {
            name     = "MIM14_MISSILE",
            file     = "MIM14_missile",
            life     = 1,
            fire     = {0, 1},
            username = _("MIM14"),
            index    = WSTYPE_PLACEHOLDER,
        },
    },
    
    fuze_proximity = {
        ignore_inp_armed = 1,
        radius = 65,
    },
}

declare_weapon(Nike_MIM14_MISSILE)

-- Launcher-Konfiguration für MIM14
GT_t.LN_t.MISSILE_MIM14 = {}
GT_t.LN_t.MISSILE_MIM14.type = 4
GT_t.LN_t.MISSILE_MIM14.xc = -3.26
GT_t.LN_t.MISSILE_MIM14.distanceMin = 3000
GT_t.LN_t.MISSILE_MIM14.distanceMax = 160934
GT_t.LN_t.MISSILE_MIM14.reactionTime = 1
GT_t.LN_t.MISSILE_MIM14.launch_delay = 2
GT_t.LN_t.MISSILE_MIM14.maxShootingSpeed = 1
GT_t.LN_t.MISSILE_MIM14.show_external_missile = true

GT_t.LN_t.MISSILE_MIM14.sensor = {}
set_recursive_metatable(GT_t.LN_t.MISSILE_MIM14.sensor, GT_t.WSN_t[0])

GT_t.LN_t.MISSILE_MIM14.reflection_limit = 0.02
GT_t.LN_t.MISSILE_MIM14.ECM_K = -1
GT_t.LN_t.MISSILE_MIM14.barrels_reload_type = 3 -- entspricht BarrelsReloadTypes.SEQUENTIALY
GT_t.LN_t.MISSILE_MIM14.PL = {}
GT_t.LN_t.MISSILE_MIM14.PL[1] = {}
GT_t.LN_t.MISSILE_MIM14.PL[1].ammo_capacity = 1
GT_t.LN_t.MISSILE_MIM14.PL[1].type_ammunition = Nike_MIM14_MISSILE.wsTypeOfWeapon
GT_t.LN_t.MISSILE_MIM14.PL[1].reload_time = 13 * 60  -- 13 Minuten
GT_t.LN_t.MISSILE_MIM14.PL[1].shot_delay = 0.1
GT_t.LN_t.MISSILE_MIM14.BR = { { pos = {0, 0, 0} } }
