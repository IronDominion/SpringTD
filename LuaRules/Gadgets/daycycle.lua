--
--	This file is part of SpringTD (https://github.com/IronDominion/SpringTD).
--	Copyright (c) 2017 The contributors of SpringTD (see AUTHORS).
--
--	This program is free software: you can redistribute it and/or modify
--	it under the terms of the GNU General Public License as published by
--	the Free Software Foundation; either version 2 of the License, or
--	(at your option) any later version.
--
--	This program is distributed in the hope that it will be useful,
--	but WITHOUT ANY WARRANTY; without even the implied warranty of
--	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--	GNU General Public License for more details.
--
--	You should have received a copy of the GNU General Public License along
--	with this program; if not, write to the Free Software Foundation, Inc.,
--	51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
--

function gadget:GetInfo()
  return {
    name      = "Day Cycle",
    desc      = "Simulates sun movement.",
    author    = "jrb0001",
    date      = "2017-10-06",
    license   = "GNU GPL, v2 or later",
    layer     = 5,
    enabled   = true
  }
end

if not gadgetHandler:IsSyncedCode() then
	local incrementPerSecond = 1 / 30
	local colorSun = {1, 1, 1}
	local colorMoon = {0.1, 0.1, 0.3}

	local progress = 0

	local function getLocation(x, y, z, distance)
		local locationLength = distance / math.sqrt(x * x + y * y + z * z)
		x = x * locationLength
		y = y * locationLength
		z = z * locationLength
		return {x, y, z}
	end

	local sunMap = nil
	local moonMap = nil
	local sunModel = nil
	local moonModel = nil

	function gadget:Initialize()
		sunMap = Spring.AddMapLight({ttl = 1000000000, diffuseColor = colorSun, specularColor = colorSun, radius = 1000000000, fov = 360, priority = 100})
		moonMap = Spring.AddMapLight({ttl = 1000000000, diffuseColor = colorMoon, specularColor = colorMoon, radius = 1000000000, fov = 360, priority = 100})
		sunModel = Spring.AddModelLight({ttl = 1000000000, diffuseColor = colorSun, specularColor = colorSun, radius = 1000000000, fov = 360, priority = 100})
		moonModel = Spring.AddModelLight({ttl = 1000000000, diffuseColor = colorMoon, specularColor = colorMoon, radius = 1000000000, fov = 360, priority = 100})

		local color = {0, 0, 0}
		Spring.SetSunLighting({groundAmbientColor = color, groundDiffuseColor = color, groundSpecularColor = color, unitAmbientColor = color, unitDiffuseColor = color, unitSpecularColor = color})
	end

	function gadget:Shutdown()
		Spring.UpdateMapLight(sunMap, {ttl = 0})
		Spring.UpdateMapLight(moonMap, {ttl = 0})
		Spring.UpdateModelLight(sunModel, {ttl = 0})
		Spring.UpdateModelLight(moonModel, {ttl = 0})

		local color = {0.5, 0.5, 0.5}
		Spring.SetSunLighting({groundAmbientColor = color, groundDiffuseColor = color, groundSpecularColor = color, unitAmbientColor = color, unitDiffuseColor = color, unitSpecularColor = color})
	end

	function gadget:Update()
		local delta = Spring.GetLastUpdateSeconds()
		progress = (progress + incrementPerSecond * delta)
		if progress > 1 then
			progress = progress - 2
		end

		if progress >= 0 then
			Spring.SetSunDirection(math.sin((progress - 0.5) * math.pi), math.cos((progress - 0.5) * math.pi), 0.5)
		else
			Spring.SetSunDirection(math.sin((progress + 0.5) * math.pi), math.cos((progress + 0.5) * math.pi), 0.5)
		end

		Spring.UpdateMapLight(sunMap, {position = getLocation(math.sin((progress - 0.5) * math.pi), math.cos((progress - 0.5) * math.pi), 0.5, 1000000)})
		Spring.UpdateMapLight(moonMap, {position = getLocation(math.sin((progress + 0.5) * math.pi), math.cos((progress + 0.5) * math.pi), 0.5, 1000000)})
		Spring.UpdateModelLight(sunModel, {position = getLocation(math.sin((progress - 0.5) * math.pi), math.cos((progress - 0.5) * math.pi), 0.5, 1000000)})
		Spring.UpdateModelLight(moonModel, {position = getLocation(math.sin((progress + 0.5) * math.pi), math.cos((progress + 0.5) * math.pi), 0.5, 1000000)})
	end
end
