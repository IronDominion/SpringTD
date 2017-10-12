local unitName  =  "orca"

local unitDef  =  {
--Internal settings
    BuildPic = "orca.bmp",
    Category = "GUNSHIP SMALL NOTAIR NOTSUB",
    ObjectName = "orca.s3o",
    name = "Orca",
    Side = "GDI",
    TEDClass = "TANK",
    UnitName = "orca",
    script = "orca.lua",
    
--Unit limitations and properties
    BuildTime = 1000,
    Description = "Gunship",
    MaxDamage = 1000,
    RadarDistance = 0,
    SightDistance = 1000,
    SoundCategory = "TANK",
	collide = true,
	cruiseAlt = 150,
	floater = true,
    
--Energy and metal related
    BuildCostEnergy = 100,
    BuildCostMetal = 0,
    
--Pathfinding and related
    Acceleration = 0.18,
    BrakeRate = 0.16,
    FootprintX = 2,
    FootprintZ = 2,
    MaxSlope = 15,
    MaxVelocity = 6.5,
    MovementClass = "Default2x2",
    TurnRate = 700,
    
--Abilities
    Builder = 0,
    CanFly = 1,
    CanAttack = 1,
    CanGuard = 1,
    CanMove = 1,
    CanPatrol = 1,
    CanStop = 1,
	AirHoverFactor = 10,
    HoverAttack = 1,
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
		bursts = 10,
		areaofeffect = 10,
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
		range = 750,
		reloadtime = 1.5,
		rgbcolor = "1.0 1.0 1.0",
		turret = false,
		texture1 = "flame",
		weaponvelocity = 400,
		explosiongenerator = "custom:TANKGUN_FX",
		damage =
		{
			default = 25,
		},
	},
}


unitDef.weaponDefs = weaponDefs
return lowerkeys({ [unitName]  =  unitDef })
