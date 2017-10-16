local base = piece "base"
local body = piece "body"
local turret = piece "turret"
local gun_l = piece "gun_l"
local gun_r = piece "gun_r"
local flare_l = piece "flare_l"
local flare_r = piece "flare_r"
-- declares all the pieces we'll use in the script.

local SIG_AIM = 2
local SIG_AIM2 = 4

local RESTORE_DELAY = Spring.UnitScript.GetLongestReloadTime(unitID) * 16
-- picks a sensible time to wait before trying to turn the turret back to default.

function script.Create()
    return 0
end

local function RestoreAfterDelay(unitID)
    -- defines a local funtion to wait a bit, then move the turret back to how it was originally.
	Sleep(RESTORE_DELAY)
	Turn(turret, y_axis, 0, 3)
end

function script.AimWeapon1(heading, pitch)
	Signal(SIG_AIM)
	SetSignalMask(SIG_AIM)
    -- each time the Signal is called, all other functions with the same SignalMask will stop running. This makes sure the tank isn't trying to fire at something, and restore the turret position, at the same time.
	Turn(turret, y_axis, heading, 3)
	WaitForTurn(turret, y_axis)
	StartThread(RestoreAfterDelay)
	return true
end

function script.AimWeapon2(heading, pitch)
	Signal(SIG_AIM2)
	SetSignalMask(SIG_AIM2)
	return true
end

function script.AimFromWeapon1()
		return turret
end
function script.AimFromWeapon2()
		return turret
end
-- The unit looks from this piece down the QueryWeapon piece, to see whether it's aiming at anything.

--function script.FireWeapon(weaponID)
	--EmitSfx(flare, 0)
--end

function script.QueryWeapon1()
		return flare_l
end
function script.QueryWeapon2()
		return flare_r
end
-- The piece that the bullet/laser/whatever comes out of.



function script.Killed(recentDamage, maxHealth)
	return 0
end

function script.HitByWeapon(x,z,weaponDef,damage)
    -- This stops the unit taking damage until it's been built.
	if GetUnitValue(COB.BUILD_PERCENT_LEFT)>2 then return 0
	else return damage
	end
end