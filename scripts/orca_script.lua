local base = piece 'base'
local body = piece 'body'
local rjet = piece 'turbine_r'
local ljet = piece 'turbine_l'
local flare_r = piece 'flare_r'
local flare_l = piece 'flare_l'
local gun_l = piece 'gun_l'
local gun_r = piece 'gun_r'

local SIG_RESTORE = 1
local SIG_AIM = 2
local RESTORE_DELAY = Spring.UnitScript.GetLongestReloadTime(unitID) * 2

local function RestoreAfterDelay ()
	Signal (SIG_RESTORE)
	SetSignalMask (SIG_RESTORE)
	Sleep (RESTORE_DELAY)
	Turn (gun_l, y_axis, 0, math.rad(20))
	Turn (gun_r, x_axis, 0, math.rad(20))
end

function script.QueryWeapon(num)
	return emit
end

function script.AimFromWeapon(weaponID, heading, pitch)
	return gun_l
end

function script.AimWeapon(num, heading, pitch)
	Signal(SIG_AIM)
	SetSignalMask(SIG_AIM)
    -- each time the Signal is called, all other functions with the same SignalMask will stop running. This makes sure the tank isn't trying to fire at something, and restore the turret position, at the same time.
	Turn(gun_l, x_axis, -pitch, math.rad(30))
	Turn(gun_r, x_axis, -pitch, math.rad(30))
	WaitForTurn(gun_l, x_axis)
	WaitForTurn(gun_r, x_axis)
	StartThread(RestoreAfterDelay)
	return true
end

function script.FireWeapon(num)
	Turn (rjet, x_axis, 0, math.rad(70))
	Turn (ljet, x_axis, 0, math.rad(70))
end

function script.Killed(recentDamage, maxHealth)
	return 0
end