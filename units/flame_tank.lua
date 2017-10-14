local unitName  =  "flame_tank"

local unitDef  =  {
--Internal settings
    BuildPic = "flame_tank.bmp",
    Category = "TANK SMALL NOTAIR NOTSUB",
    ObjectName = "flame_tank.s3o",
    name = "Flame Tank",
    Side = "Nod",
    TEDClass = "TANK",
    UnitName = "flame_tank",
    script = "flame_tank_script.lua",
    
--Unit limitations and properties
    BuildTime = 1000,
    Description = "Unleashes devastating flames upon a wide area.",
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
    		def = "inferno",	
    	},
			{
				def = "inferno",
			},
    },
}

local weaponDefs = {
    inferno = {
		name = "Flame",
		weapontype = "Flame",
		accuracy = 10,
		--sprayangle = 100,
		areaofeffect = 250,
		--projectiles = 5,
		avoidfeature = false,
		avoidfriendly = true,
		canattackground = true,
		collidefriendly = true,
		collisionsize = 4,
		commandfire = false,
		craterboost = 0,
		cratermult = 0,
		edgeeffectiveness = 0.1,
		explosionspeed = 128,
		impulseboost = 0,
		impulsefactor = 0,
		intensity = 1,
		noselfdamage = true,
		size = 2,
--        soundstart = "tank_fire",
        soundhit = "orangeblob_explo",
		range = 225,
		reloadtime = 0.16,
		rgbcolor = "1.0 0 0",
		turret = true,
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
