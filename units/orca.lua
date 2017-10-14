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
    script = "orca_script.lua",
    
--Unit limitations and properties
	  BuildTime = 2000,
	  Description = "GDI gunship, equipped with double AGM missile launcher",
	  MaxDamage = 300,
	  RadarDistance = 0,
	  SightDistance = 1000,
	  SoundCategory = "TANK",
		collide = true,
		cruiseAlt = 150,
		floater = true,
    
--Energy and metal related
    BuildCostEnergy = 0,
    BuildCostMetal = 1000,
    
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
            def = "orcarockets",
        },
    },
}

local weaponDefs = {
	orcarockets = {
		name = "Hellfire",
		weapontype = "MissileLauncher",
		burst = 2,
		burstRate = 0.625,
		accuracy = 10,
		areaofeffect = 50,
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
