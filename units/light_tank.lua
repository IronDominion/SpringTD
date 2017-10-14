local unitName  =  "light_tank"

local unitDef  =  {
--Internal settings
    BuildPic = "light_tank.bmp",
    Category = "TANK SMALL NOTAIR NOTSUB",
    ObjectName = "light_tank.s3o",
    name = "Light Tank",
    Side = "Nod",
    TEDClass = "TANK",
    UnitName = "light_tank",
    script = "medium_tank_script.lua",
    
--Unit limitations and properties
    BuildTime = 1400,
    Description = "Main battle unit of Nod.",
    MaxDamage = 600,
    RadarDistance = 0,
    SightDistance = 1000,
    SoundCategory = "TANK",
    Upright = 0,
    
--Energy and metal related
    BuildCostEnergy = 0,
    BuildCostMetal = 700,
    
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
		size = 4,
--        soundstart = "tank_fire",
        soundhit = "orangeblob_explo",
		range = 450,
		reloadtime = 2,
		rgbcolor = "1.0 1.0 1.0",
		turret = true,
		texture1 = "flame",
		weaponvelocity = 1200,
		explosiongenerator = "custom:TANKGUN_FX",
		damage =
		{
			default = 50,
		},
	},
}


unitDef.weaponDefs = weaponDefs
return lowerkeys({ [unitName]  =  unitDef })
