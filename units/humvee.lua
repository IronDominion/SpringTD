local unitName  =  "humvee"

local unitDef  =  {
--Internal settings
    BuildPic = "filename.bmp",
    Category = "TANK SMALL NOTAIR NOTSUB",
    ObjectName = "humvee.s3o",
    name = "Humvee",
    Side = "TANKS",
    TEDClass = "TANK",
    UnitName = "humvee",
    script = "tankscript.lua",
    
--Unit limitations and properties
    BuildTime = 1000,
    Description = "A generic tank unit.",
    MaxDamage = 800,
    RadarDistance = 0,
    SightDistance = 800,
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
            def = "orangeblob",
        },
    },
}

local weaponDefs = {
    orangeblob = {
		name = "Orange Plasma Cannon",
		weapontype = "Cannon",
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
		range = 450,
		reloadtime = 1.5,
		rgbcolor = "1.0 1.0 1.0",
		turret = true,
		texture1 = "flame",
		weaponvelocity = 400,
		explosiongenerator = "custom:TANKGUN_FX",
		damage =
		{
			default = 100,
		},
	},
}


unitDef.weaponDefs = weaponDefs
return lowerkeys({ [unitName]  =  unitDef })
