local unitName  =  "mlrs"

local unitDef  =  {
--Internal settings
    BuildPic = "mrls.bmp",
    Category = "TANK SMALL NOTAIR NOTSUB",
    ObjectName = "mlrs.s3o",
    name = "MLRS",
    Side = "GDI",
    TEDClass = "TANK",
    UnitName = "mlrs",
    script = "rocket_launcher_script.lua",
    
--Unit limitations and properties
    BuildTime = 1600,
    Description = "Self-propelled Multiple Launch Rocket System",
    MaxDamage = 250,
    RadarDistance = 0,
    SightDistance = 1000,
    SoundCategory = "TANK",
    Upright = 0,
    
--Energy and metal related
    BuildCostEnergy = 100,
    BuildCostMetal = 800,
    
--Pathfinding and related
    Acceleration = 0.15,
    BrakeRate = 0.1,
    FootprintX = 2,
    FootprintZ = 2,
    MaxSlope = 15,
    MaxVelocity = 2.0,
    MaxWaterDepth = 20,
    MovementClass = "Default2x2",
    TurnRate = 700,
    
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
        [1] = {
            def = "mrlsrockets",
        },
    },
}

local weaponDefs = {
    mrlsrockets = {
		name = "rockets",
		weapontype = "Cannon",
		burst = 12,
		burstRate = 0.125,
		accuracy = 500,
		areaofeffect = 100,
		sprayAngle = 50,
		avoidfeature = false,
		avoidfriendly = false, --true
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
		highTrajectory = 1,
		size = 4,
--        soundstart = "tank_fire",
    soundhit = "orangeblob_explo",
		range = 1200,
		reloadtime = 7.5,
		rgbcolor = "1.0 0 0",
		turret = true,
		texture1 = "flame",
		weaponvelocity = 325,
		explosiongenerator = "custom:TANKGUN_FX",
		
		damage =
		{
			default = 25,		
		},
	},
}


unitDef.weaponDefs = weaponDefs
return lowerkeys({ [unitName]  =  unitDef })
