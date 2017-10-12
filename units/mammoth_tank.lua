local unitName  =  "mammoth_tank"

local unitDef  =  {
--Internal settings
    BuildPic = "mammoth_tank.bmp",
    Category = "TANK SMALL NOTAIR NOTSUB",
    ObjectName = "mammoth_tank.s3o",
    name = "Mammoth Tank",
    Side = "GDI",
    TEDClass = "TANK",
    UnitName = "mammoth_tank",
    script = "mammoth_tank_script.lua",
    
--Unit limitations and properties
    BuildTime = 3000,
    Description = "GDI heaviest vehicle. Has no matching opponent. Is capable of bringing down aircrafts",
    MaxDamage = 1500,
    RadarDistance = 0,
    SightDistance = 800,
    SoundCategory = "TANK",
    Upright = 0,
    
--Energy and metal related
    BuildCostEnergy = 0,
    BuildCostMetal = 1500,
    
--Pathfinding and related
    Acceleration = 0.10,
    BrakeRate = 0.05,
    FootprintX = 2,
    FootprintZ = 2,
    MaxSlope = 15,
    MaxVelocity = 0.8,
    MaxWaterDepth = 20,
    MovementClass = "Default2x2",
    TurnRate = 400,
    
--Abilities
    Builder = 0,
    CanAttack = 1,
    CanGuard = 1,
    CanMove = 1,
    CanPatrol = 1,
    CanStop = 1,
    LeaveTracks = 0,
    Reclaimable = 0,
    
--Hitbox
--    collisionVolumeOffsets    =  "0 0 0",
--    collisionVolumeScales     =  "20 20 20",
--    collisionVolumeTest       =  1,
--    collisionVolumeType       =  "box",
    
--Weapons and related
    BadTargetCategory = "NOTAIR",
    ExplodeAs = "TANKDEATH",
    NoChaseCategory = "AIR",

    weapons = {
		{
            def = "dual120mm",
			def = "dual120mm",
        },
    },
}

local weaponDefs = {
    dual120mm = {
		name = "120mm dual",
		weapontype = "Cannon",
		burst = 2,
		burstRate = 0.625,
		accuracy = 10,
		areaofeffect = 100,
		avoidfeature = false,
		avoidfriendly = true,
		canattackground = true,
		collidefriendly = true,
		collisionsize = 8,
		commandfire = false,
		craterboost = 0,
		cratermult = 0,
		edgeeffectiveness = 0.1,
		explosionspeed = 128,
		impulseboost = 0,
		impulsefactor = 0,
		intensity = 1,
		noselfdamage = true,
		size = 4,
--        soundstart = "tank_fire",
        soundhit = "orangeblob_explo",
		range = 475,
		reloadtime = 2.5,
		rgbcolor = "1.0 1.0 1.0",
		turret = true,
		texture1 = "flame",
		weaponvelocity = 400,
		explosiongenerator = "custom:TANKGUN_FX",
		damage =
		{
			default = 75,		
		},
	},
	mammoth_tank_rockets = {
		name                    = "Mammoth Tusk",
		areaOfEffect            = 8,
		avoidFeature            = true,
		craterBoost             = 0,
		craterMult              = 0,
		cylinderTargeting       = 5,
		explosiongenerator = "custom:TANKGUN_FX",

		customParams        	  = {
		isaa = [[1]],
		script_reload = [[12.5]],
		script_burst = [[3]],
		
		light_camera_height = 2000,
		light_radius = 200,
		},

		damage                  = {
			default = 104,
			subs    = 7.5,
		},
		
		fireStarter             = 70,
		flightTime              = 4,
		impactOnly              = true,
		impulseBoost            = 0,
		impulseFactor           = 0.4,
		interceptedByShieldType = 2,
		metalpershot            = 0,
		model                   = [[hobbes.s3o]],
		noSelfDamage            = true,
		range                   = 500,
		reloadtime              = 1.2,
		smokeTrail              = true,
		--soundstart = "tank_fire",
        soundhit = "orangeblob_explo",
		startVelocity           = 500,
		texture2                = [[lightsmoketrail]],
		tolerance               = 10000,
		tracks                  = true,
		turnRate                = 60000,
		turret                  = true,
		weaponAcceleration      = 300,
		weaponType              = "MissileLauncher",
		weaponVelocity          = 750,
    },
}


unitDef.weaponDefs = weaponDefs
return lowerkeys({ [unitName]  =  unitDef })
