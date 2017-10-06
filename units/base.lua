local unitName = "base"

local unitDef =
{
-- Internal settings
	BuildPic = "base.bmp",
	Category = "BUILDING NOTSCOUT NOTHEAVY NOTAIR NOTEPIC NOTSHIP NOTSTEALTHY ALL",
	ObjectName = "base2.s3o",
	Side = "TANK",
	TEDClass = "PLANT",
	script = "basescript.lua",
	
-- Unit limitations and properties
	ActivateWhenBuilt = true,
	BuildTime = 1000,
    commander = true,
	Description = "Produces units",
	MaxDamage = 1500,
	Name = "Base",
	RadarDistance = 0,
	SightDistance = 400,
	SoundCategory = "BUILDING",
	Upright = 1,
	WorkerTime = 80,
	levelground = 1,
	
-- Energy and metal related
	BuildCostEnergy = 500,
	EnergyStorage = 0,
	EnergyUse = 0,
	MetalStorage = 0,
	EnergyMake = 1, 
	MakesMetal = 0, 
	MetalMake = 0,
	
-- Pathfinding and related
	FootprintX = 4,
	FootprintZ = 4,
	MaxSlope = 10,
	MaxWaterDepth = 0,
	YardMap = "cccc cccc cccc cccc",

-- Abilities
	Builder = 1,
        Reclaimable = 0,
	ShowNanoSpray = 0,
	CanBeAssisted = 0,
	buildoptions = 
	{
		"tank",
		"apc",
		"humvee",
		"4tnk",
		"builder",
	},
	
-- Abilities new to Spring
	
-- Weapons and related

	ExplodeAs = "BUILDINGLARGEDEATH",
	SelfDestructAs = "BUILDINGLARGEDEATH",
	SelfDestructCountdown = 5,
}

return lowerkeys({ [unitName] = unitDef })
