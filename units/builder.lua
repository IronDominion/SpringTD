local unitName = "builder"

local unitDef = 
{
-- Internal settings
	BuildPic = "builder.bmp",
	Category = "MOBILE SCOUT NOTHEAVY NOTAIR NOTSHIP NOTEPIC NOTSTEALTHY ALL",
	ObjectName = "builder.s3o",
	Side = "TANKS",
	TEDClass = "TANK",
	script = "builderscript.lua",
	
-- Unit limitations and properties
	ActivateWhenBuilt = 1,
	BuildTime = 1000,
	Description = "Constructs buildings",
	MaxDamage = 175,
	Name = "Builder",
	RadarDistance = 0,
	SightDistance = 200,
	SoundCategory = "TANK",
	Upright = 0,
	
-- Energy and metal related
	BuildCostEnergy = 70,
	
-- Pathfinding and related
	Acceleration = 0.15,
	BrakeRate = 0.1,
	FootprintX = 2,
	FootprintZ = 2,
	MaxSlope = 10,
	MaxVelocity = 4.0,
	MaxWaterDepth = 12,
	TurnRate = 900,
	movementclass = "default2x2",
	
-- Abilities
	Builder = 1,
	BuildDistance = 65,
	WorkerTime = 100,
	Reclaimable = 0,
	CanAttack = 0,
	CanGuard = 1,
	CanMove = 1,
	CanPatrol = 1,
	LeaveTracks = 0,
	ShowNanoSpray = 0,
	buildoptions = {
		"base",
		"building",
	},
	
-- Weapons and related
	ExplodeAs = "TANKGUN_FX",
	NoChaseCategory = "ALL",
}

return lowerkeys({ [unitName] = unitDef })
