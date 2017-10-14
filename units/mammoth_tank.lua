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
		weaponvelocity = 1200,
		explosiongenerator = "custom:TANKGUN_FX",
		damage =
		{
			default = 75,		
		},
	},
	rocketpods = {
		name = "Mammoth Tusk",
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
		weaponAcceleration = 5,
		tracks = true,
		turnRate = 2,
		trajectoryHeight = 2,
		
		damage =
		{
			default = 75,		
		},
	},
}


unitDef.weaponDefs = weaponDefs
return lowerkeys({ [unitName]  =  unitDef })
