local base = piece "base"
local body = piece "body"
local turret = piece "turret"
local gun = piece "gun"
local flare = piece "flare"
local wheel_fl = piece "wheel_fl"
local wheel_fr = piece "wheel_fr"
local wheel_bl = piece "wheel_bl"
local wheel_br = piece "wheel_br"
-- declares all the pieces we'll use in the script.

local SIG_AIM = 2

local RESTORE_DELAY = Spring.UnitScript.GetLongestReloadTime(unitID) * 2
local wheelTurnSpeed = 1

local ismoving

local angleCap = math.rad(25)
local turnRate = math.rad(60)
local headingToRad = 1/32768*math.pi

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
	Turn(gun, x_axis, -pitch, math.rad(30))
	WaitForTurn(turret, y_axis)
	WaitForTurn(gun, x_axis)
	StartThread(RestoreAfterDelay)
	return true
end

function script.FireWeapon(weaponID)
	EmitSfx(flare, 0)
end

function script.StartMoving()
	Spin(wheel_fl, x_axis, wheelTurnSpeed)
	Spin(wheel_fr, x_axis, wheelTurnSpeed)
	Spin(wheel_bl, x_axis, wheelTurnSpeed)
	Spin(wheel_br, x_axis, wheelTurnSpeed)
	
	ismoving = true
end

function script.StopMoving()
	StopSpin(wheel_fl, x_axis, wheelTurnSpeed)
	StopSpin(wheel_fr, x_axis, wheelTurnSpeed)
	StopSpin(wheel_bl, x_axis, wheelTurnSpeed)
	StopSpin(wheel_br, x_axis, wheelTurnSpeed)
	ismoving = false
end

function script.Create()
	StartThread(AdjustRotation)
	--StartThread(Rollwheels)
end

function script.QueryWeapon() return flare end
-- The piece that the bullet/laser/whatever comes out of.

function script.AimFromWeapon() return gun end
-- The unit looks from this piece down the QueryWeapon piece, to see whether it's aiming at anything.

function script.Killed(recentDamage, maxHealth)
	return 0
end

function AdjustRotation()
	local lastHeading, currHeading, deltaHeading, turnAngle
	lastHeading = GetUnitValue(COB.HEADING)*headingToRad
	while true do
		if ismoving == false then
			Sleep(50)
		else
		
		currHeading = GetUnitValue(COB.HEADING)*headingToRad
		deltaHeading = (currHeading - lastHeading)
		
		turnAngle = deltaHeading * 3
		if turnAngle > angleCap then 
			turnAngle = angleCap 
		end
		if turnAngle < -angleCap then 
			turnAngle = -angleCap 
		end
		if math.abs(deltaHeading) < 0.02 then
			Turn (wheel_fl, y_axis, turnAngle*2, turnRate*0.5)
			Turn (wheel_fr, y_axis, turnAngle*2, turnRate*0.5)
			--Turn (wheel_bl, y_axis, turnAngle*2, turnRate*0.5)
			--Turn (wheel_br, y_axis, turnAngle*2, turnRate*0.5)
		else
			Turn (wheel_fl, y_axis, turnAngle*2, turnRate)
			Turn (wheel_fr, y_axis, turnAngle*2, turnRate)
			--Turn (wheel_bl, y_axis, turnAngle*2, turnRate)
			--Turn (wheel_br, y_axis, turnAngle*2, turnRate)
		end
			lastHeading = currHeading
			Sleep(50)
		end
	end
end
function script.HitByWeapon(x,z,weaponDef,damage)
    -- This stops the unit taking damage until it's been built.
	if GetUnitValue(COB.BUILD_PERCENT_LEFT)>2 then return 0
	else return damage
	end
end
