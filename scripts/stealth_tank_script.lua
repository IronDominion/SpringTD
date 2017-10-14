local base = piece "base"
local body = piece "body"
local turret = piece "turret"
local gun = piece "gun"
local flare_l = piece "flare_l"
local flare_r = piece "flare_r"
-- declares all the pieces we'll use in the script.
local case = 0
local SIG_AIM = 2

local RESTORE_DELAY = Spring.UnitScript.GetLongestReloadTime(unitID) * 2
-- picks a sensible time to wait before trying to turn the turret back to default.

function script.Create()
    return 0
end

local function RestoreAfterDelay(unitID)
    -- defines a local funtion to wait a bit, then move the turret back to how it was originally.
	Sleep(RESTORE_DELAY)
	Turn(turret, y_axis, 0, math.rad(35))
	Turn(gun, x_axis, 0, math.rad(30))
end

function script.AimWeapon(weaponID, heading, pitch)
	Signal(SIG_AIM)
	SetSignalMask(SIG_AIM)
    -- each time the Signal is called, all other functions with the same SignalMask will stop running. This makes sure the tank isn't trying to fire at something, and restore the turret position, at the same time.
	Turn(turret, y_axis, heading, math.rad(35))
	WaitForTurn(turret, y_axis)
	Turn(gun, x_axis, 0, math.rad(30))
	WaitForTurn(gun, x_axis)
	StartThread(RestoreAfterDelay)
	return true
end

function script.Shot(weaponID) 
	case = case + 1
	if case == 2 then
		case = 0
	end
end

function script.QueryWeapon()
	if case == 0 then
		return flare_l
	elseif case == 1 then
		return flare_r
	else
		Spring.Echo("Invalid operation STNK script")
		return flare_l
	end
end
--function script.FireWeapon(weaponID)
--	EmitSfx(flare_l, 0)
--	EmitSfx(flare_r, 0)
--end

--function script.QueryWeapon() return flare end
-- The piece that the bullet/laser/whatever comes out of.

function script.AimFromWeapon() return gun end
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
