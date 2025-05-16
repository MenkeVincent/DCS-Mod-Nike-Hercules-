-- Nike Launcher
GT = {}
GT.Name = "Nike_Hercules"
GT.life = 10  -- Beispielwert, anpassen falls nötig

-- Metatable-Integration (GT_t muss vorab in DCS definiert sein)
GT_t.ws = 0
set_recursive_metatable(GT, GT_t.generic_stationary)
set_recursive_metatable(GT.chassis, GT_t.CH_t.STATIC)

-- Visuelle Eigenschaften
GT.visual = {}
GT.visual.shape = "Launcher"             -- muss exakt dem Dateinamen im Shapes-Ordner entsprechen
GT.visual.shape_dstr = "S_75_Launcher_p_1" -- Datei für zerstörtes Modell
GT.ScaleOfModel = { x = 0.15, y = 0.15, z = 0.15 }

-- Alarm und Animation
GT.toggle_alarm_state_interval = 0.01
GT.animation_arguments = {}
GT.animation_arguments.alarm_state = -1

-- Sensor-Konfiguration
GT.sensor = {}
set_recursive_metatable(GT.sensor, GT_t.SN_visual)
GT.sensor.height = 2.617
GT.sensor.max_range_finding_target = 65000
GT.sensor.min_range_finding_target = 500
GT.sensor.max_alt_finding_target = 20000
GT.sensor.min_alt_finding_target = 50

-- Feuer-/Burning-Effekt
GT.visual.fire_size = 0.8
GT.visual.fire_pos = {}
GT.visual.fire_pos[1] = 1.575
GT.visual.fire_pos[2] = 0
GT.visual.fire_pos[3] = 0
GT.visual.fire_time = 500

-- Waffensystemdefinition
GT.WS = {}
GT.WS.maxTargetDetectionRange = 65000
local ws = GT_t.inc_ws() or 1
GT.WS[ws] = {}
GT.WS[ws].pos = { 0.0, 1.7, 0.0 }
GT.WS[ws].angles = { { math.rad(90), math.rad(0), math.rad(0), math.rad(0) } }
GT.WS[ws].drawArgument1 = 0
GT.WS[ws].drawArgument2 = 1
GT.WS[ws].omegaY = 0.323599
GT.WS[ws].omegaZ = 0.174533
GT.WS[ws].reference_angle_Z = math.rad(30.6)
GT.WS[ws].reloadAngleY = 0.0
GT.WS[ws].reloadAngleZ = 0.0
GT.WS[ws].pidY = { p = 5, i = 0, d = 2, inn = 1 }
GT.WS[ws].pidZ = { p = 5, i = 0, d = 2, inn = 1 }

local __LN = add_launcher(GT.WS[ws], GT_t.LN_t.MISSILE_MIM14)
GT.WS[ws].LN = { __LN }
__LN.min_launch_angle = math.rad(90)
__LN.launch_delay = 5
__LN.depends_on_unit = {
    { { "NASAMS_Command_Post", 1 } },
    { { "NASAMS_Radar_MPQ64F1", 1 } },
}
__LN.BR = { { connector_name = "POINT_ROCKET" } }
__LN = nil

-- Anzeige und weitere Parameter
GT.Name = "Nike_Hercules"
GT.DisplayName = _('Nike Hurcules')
GT.DisplayNameShort = _('N_HURC')
GT.Rate = 10

GT.DetectionRange = 0
GT.ThreatRangeMin = GT.WS[1].LN[1].distanceMin  -- Voraussetzung: Diese Felder existieren in der Launcher-Vorlage.
GT.ThreatRange = GT.WS[1].LN[1].distanceMax
GT.mapclasskey = "P0091000082"
GT.attribute = {
    wsType_Ground,
    wsType_SAM,
    wsType_Miss,
    SANikeH_LN,
    "AA_missile",
    "LR SAM",
    "SAM LL",
}
GT.category = "Air Defence"
GT.tags = { "Air Defence", "Launcher" }
GT.Countries = { "USA", "GERMANY" }
