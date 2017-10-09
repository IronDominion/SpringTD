local base = piece 'base'
local body = piece 'body'
local rjet = piece 'turbine_r'
local ljet = piece 'turbine_l'
local emit = piece 'flare'
local gun = piece 'gun'

local SIG_RESTORE = 1

local function RestoreAfterDelay ()
	Signal (SIG_RESTORE)
	SetSignalMask (SIG_RESTORE)
	Sleep (3000)
	Turn (gun, y_axis, 0, math.rad(20))
	Turn (gun, x_axis, 0, math.rad(20))
end

function script.QueryWeapon(num)
	return emit
end

function script.AimFromWeapon(num)
	return gun
end

function script.AimWeapon(num, heading, pitch)
	Turn (gun, y_axis, heading, math.rad(360))
	Turn (gun, x_axis, -pitch, math.rad(360))
	StartThread (RestoreAfterDelay)
	return true
end

function script.FireWeapon(num)
	Turn (rjet, x_axis, 0, math.rad(70))
	Turn (ljet, x_axis, 0, math.rad(70))
end

function script.Killed(recentDamage, maxHealth)
	return 0
end