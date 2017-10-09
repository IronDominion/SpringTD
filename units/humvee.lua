local unitName  =  "humvee"

local unitDef  =  {
--Internal settings
    BuildPic = "filename.bmp",
    Category = "TANK SMALL NOTAIR NOTSUB",
    ObjectName = "humvee.s3o",
    name = "Humvee",
    Side = "GDI",
    TEDClass = "TANK",
    UnitName = "humvee",
    script = "humvee_script.lua",
    
--Unit limitations and properties
    BuildTime = 800,
    Description = "Fast scouting vehicle, capable of shredding infantry.",
    MaxDamage = 150,
    RadarDistance = 0,
    SightDistance = 1400,
    SoundCategory = "TANK",
    Upright = 0,
    
--Energy and metal related
    BuildCostEnergy = 0,
    BuildCostMetal = 400,
    
--Pathfinding and related
    Acceleration = 0.15,
    BrakeRate = 0.1,
    FootprintX = 2,
    FootprintZ = 2,
    MaxSlope = 15,
    MaxVelocity = 1.5,
    MaxWaterDepth = 20,
    MovementClass = "Default1x1",
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
            def = "m60",
        },
    },
}

local weaponDefs = {
    m60 = {
		name = "m60",
		weapontype = "Cannon",
		accuracy = 75,
		burst = 5,
		burstRate = 0.1,
		sprayAngle = 10,
		areaofeffect = 25,
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
		size = 1,
--        soundstart = "tank_fire",
        soundhit = "orangeblob_explo",
		range = 450,
		reloadtime = 1.5,
		rgbcolor = "1.0 1.0 1.0",
		turret = true,
		texture1 = "flame",
		weaponvelocity = 400,
		explosiongenerator = "custom:TANKGUN_FX",
		damage =
		{
			default = 5,	
		},
	},
}


unitDef.weaponDefs = weaponDefs
return lowerkeys({ [unitName]  =  unitDef })
