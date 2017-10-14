local unitName  =  "stealth_tank"

local unitDef  =  {
--Internal settings
    BuildPic = "stealth_tank.bmp",
    Category = "TANK SMALL NOTAIR NOTSUB",
    ObjectName = "stealth_tank.s3o",
    name = "Stealth Tank",
    Side = "Nod",
    TEDClass = "TANK",
    UnitName = "stealth_tank",
    script = "stealth_tank_script.lua",
    
--Unit limitations and properties
    BuildTime = 1000,
    Description = "Fast stealthed tank.",
    MaxDamage = 1000,
    RadarDistance = 0,
    SightDistance = 1000,
    SoundCategory = "TANK",
    Upright = 0,
    
--Energy and metal related
    BuildCostEnergy = 100,
    BuildCostMetal = 0,
    
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
    
--Cloaking
		canCloak = true,
		initCloaked = true,
		cloakTimeout = 128,
    
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
            def = "stealthmissiles",
        },
    },
}

local weaponDefs = {
    stealthmissiles = {
		name = "Stinger",
		weapontype = "MissileLauncher",
		burst = 2,
		burstRate = 0.625,
		accuracy = 10,
		areaofeffect = 100,
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
		
		-- missile values
		startVelocity = 1,
		weaponAcceleration = 250,
		tracks = true,
		turnRate = 100,
		trajectoryHeight = 0,
		flightTime = 3000,
		
		damage =
		{
			default = 75,		
		},
	},
}


unitDef.weaponDefs = weaponDefs
return lowerkeys({ [unitName]  =  unitDef })
