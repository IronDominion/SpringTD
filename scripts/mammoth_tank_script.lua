local base = piece "base"
local body = piece "body"

local turret = piece "turret"

local gun_l = piece "gun_l"
local gun_r = piece "gun_r"

local flare_l = piece "flare_l"
local flare_r = piece "flare_r"

local missilepod_l = piece "missilepod_l"
local missile_l1 = piece "missile_l1"
local missile_l2 = piece "missile_l2"
local missile_l3 = piece "missile_l3"
local missile_l4 = piece "missile_l4"
local missile_l5 = piece "missile_l5"
local missile_l6 = piece "missile_l6"
local missilepod_r = piece "missilepod_r"
local missile_r1 = piece "missile_r1"
local missile_r2 = piece "missile_r2"
local missile_r3 = piece "missile_r3"
local missile_r4 = piece "missile_r4"
local missile_r5 = piece "missile_r5"
local missile_r6 = piece "missile_r6"
-- declares all the pieces we'll use in the script.

local guncase = 0
local rocketcase1 = 0
local rocketcase2 = 0

local SIG_AIM = 2
local SIG_AIM2 = 4
local SIG_AIM3 = 8

local BURSTDELAY = 625
local RESTORE_DELAY = Spring.UnitScript.GetLongestReloadTime(unitID) * 2
-- picks a sensible time to wait before trying to turn the turret back to default.

function script.Create()
    return 0
end

local function RestoreAfterDelay(unitID)
    -- defines a local funtion to wait a bit, then move the turret back to how it was originally.
	Sleep(RESTORE_DELAY)
	Turn(turret, y_axis, 0, math.rad(35))
	Turn(gun_l, x_axis, 0, math.rad(30))
	Turn(gun_r, x_axis, 0, math.rad(30))
	Turn(missilepod_l, x_axis, 0, math.rad(30))
	Turn(missilepod_r, x_axis, 0, math.rad(30))
end

function script.AimWeapon1(heading, pitch)
	Signal(SIG_AIM)
	SetSignalMask(SIG_AIM)
    -- each time the Signal is called, all other functions with the same SignalMask will stop running. This makes sure the tank isn't trying to fire at something, and restore the turret position, at the same time.
	Turn(turret, y_axis, heading, math.rad(35))
	Turn(gun_l, x_axis, -pitch, math.rad(30))
	WaitForTurn(turret, y_axis)
	WaitForTurn(gun_l, x_axis)
	Turn(gun_r, x_axis, -pitch, math.rad(30))
	WaitForTurn(gun_r, x_axis)
	StartThread(RestoreAfterDelay)
	return true
end

function script.AimWeapon2(heading, pitch)
	Signal(SIG_AIM2)
	SetSignalMask(SIG_AIM2)
	Turn(missilepod_l, x_axis, -math.rad(25), math.rad(30))
	WaitForTurn(missilepod_l, x_axis)
	return true
end

function script.AimWeapon3(heading, pitch)
	Signal(SIG_AIM2)
	SetSignalMask(SIG_AIM3)
	Turn(missilepod_r, x_axis, -math.rad(25), math.rad(30))
	WaitForTurn(missilepod_r, x_axis)
	return true
end

function script.Shot1()
	guncase = guncase + 1
	if guncase == 2 then
		guncase = 0
	end
	if guncase == 0 then
		StartThread(RecoilL)
	else
		StartThread(RecoilR)
	end
end

function script.Shot2()
	rocketcase1 = rocketcase1 + 1
	if rocketcase1 == 6 then
		rocketcase1 = 0
	end
end

function script.Shot3()
	rocketcase2 = rocketcase2 + 1
	if rocketcase2 == 6 then
		rocketcase2 = 0
	end
end

function RecoilR()
	Move(gun_r, z_axis, -10, 50)
	Sleep(500)
	Move(gun_r, z_axis, 0, 10)
end

function RecoilL()
	Move(gun_l, z_axis, -10, 50)
	Sleep(500)
	Move(gun_l, z_axis, 0, 10)	
end

--function script.QueryWeapon() return flare end
-- The piece that the bullet/laser/whatever comes out of.

function script.AimFromWeapon1() return turret end
function script.AimFromWeapon2() return turret end
function script.AimFromWeapon3() return turret end

function script.QueryWeapon1() 
	if guncase == 0 then
		return flare_l 
	else
		return flare_r
	end
end
function script.QueryWeapon2() 
	if rocketcase1 == 0 then
		return missile_l1 
	elseif rocketcase1 == 1 then
		return missile_l2
	elseif rocketcase1 == 2 then
		return missile_l3
	elseif rocketcase1 == 3 then
		return missile_l4
	elseif rocketcase1 == 4 then
		return missile_l5 
	elseif rocketcase1 == 5 then
		return missile_l6
	else
		Spring.Echo("Invalid operation at mammothtank script queryweapon2")
		return missile_l1
	end
end

function script.QueryWeapon3() 
	if rocketcase2 == 0 then
		return missile_r1 
	elseif rocketcase2 == 1 then
		return missile_r2
	elseif rocketcase2 == 2 then
		return missile_r3
	elseif rocketcase2 == 3 then
		return missile_r4
	elseif rocketcase2 == 4 then
		return missile_r5 
	elseif rocketcase2 == 5 then
		return missile_r6
	else
		Spring.Echo("Invalid operation at mammothtank script queryweapon3")
		return missile_r1
	end
end
-- The unit looks from this piece down the QueryWeapon piece, to see whether it's aiming at anything.

function script.Killed(recentDamage, maxHealth)
	return 0
end

function script.HitByWeapon(x,z,weaponDef,damage)
    -- This stops the unit taking damage until it's been built.
	if GetUnitValue(COB.BUILD_PERCENT_LEFT)>2 then return 0
	else return damage
	end
end
