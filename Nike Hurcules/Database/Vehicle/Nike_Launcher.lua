GT = {}
GT.Name = "Nike_Hercules"
GT.DisplayName = _('Nike Hurcules')
GT.DisplayNameShort = _('N_HURC')
GT.Rate = 10
GT.life = 10

-- Assume GT_t and set_recursive_metatable are available

GT.visual = {}
GT.visual.shape = "Launcher"
GT.visual.shape_dstr = "S_75_Launcher_p_1"
GT.ScaleOfModel = { x = 0.15, y = 0.15, z = 0.15 }

GT.sensor = {}
set_recursive_metatable(GT.sensor, GT_t.SN_visual)
GT.sensor.height = 2.617
GT.sensor.max_range_finding_target = 65000

GT.WS = {}
GT.WS.maxTargetDetectionRange = 65000
local ws = GT_t.inc_ws() or 1
GT.WS[ws] = {}
GT.WS[ws].pos = { 0.0, 1.7, 0.0 }
GT.WS[ws].angles = { { math.rad(90), math.rad(0), math.rad(0), math.rad(0) } }

local __LN = add_launcher(GT.WS[ws], GT_t.LN_t.MISSILE_MIM14)
GT.WS[ws].LN = { __LN }

GT.ThreatRangeMin = __LN.distanceMin
GT.ThreatRange = __LN.distanceMax

GT.mapclasskey = "P0091000082"
GT.attribute = {wsType_Ground, wsType_SAM, wsType_Miss, "AA_missile", "LR SAM", "SAM LL"}
GT.category = "Air Defence"
GT.tags = { "Air Defence", "Launcher" }
GT.Countries = { "USA", "GERMANY" }

add_surface_unit(GT)