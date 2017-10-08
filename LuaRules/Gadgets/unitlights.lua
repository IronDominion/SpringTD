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
    name      = "Unit Lights",
    desc      = "Adds lights for all units.",
    author    = "jrb0001",
    date      = "2017-10-07",
    license   = "GNU GPL, v2 or later",
    layer     = 5,
    enabled   = true
  }
end

if not gadgetHandler:IsSyncedCode() then
	local lights = {}

	local function addLight(unitID, lightParams)
		lightParams.ttl = 1000000000
		lightParams.priority = 10

		local mapLight = Spring.AddMapLight(lightParams)
		local modelLight = Spring.AddModelLight(lightParams)

		if mapLight ~= nil then
			Spring.Echo("Added map light " .. mapLight)
			Spring.SetMapLightTrackingState(mapLight, unitID, true, true)
		end
		if modelLight ~= nil then
			Spring.Echo("Added model light " .. modelLight)
			Spring.SetModelLightTrackingState(modelLight, unitID, true, true)
		end

		return {map = mapLight, model = modelLight}
	end

	local function updateLight(light, lightParams)
		Spring.UpdateMapLight(light.map, lightParams)
		Spring.UpdateModelLight(light.model, lightParams)
	end

	local function removeLight(light)
		if light.map ~= nil then
			Spring.Echo("Removed map light " .. light.map)
			Spring.UpdateMapLight(light.map, {ttl = 0})
			light.map = nil
		end
		if light.model ~= nil then
			Spring.Echo("Removed model light " .. light.model)
			Spring.UpdateModelLight(light.model, {ttl = 0})
			light.model = nil
		end
	end

	function gadget:Initialize()
		for _, unitID in pairs(Spring.GetAllUnits()) do
			gadget:UnitFinished(unitID, Spring.GetUnitDefID(unitID), Spring.GetUnitTeam(unitID))
		end
	end

	function gadget:Shutdown()
		for unitID, unit in pairs(lights) do
			gadget:UnitDestroyed(unitID, Spring.GetUnitDefID(unitID), Spring.GetUnitTeam(unitID), nil, nil, nil)
		end
	end

	function gadget:UnitFinished(unitID, unitDefID, unitTeam)
		if lights[unitID] == nil then
			lights[unitID] = {}
		end

		local lightDefs = {}
		for name, id in pairs(Spring.GetUnitPieceMap(unitID)) do
			if name:sub(1, #"light") == "light" then
				lightDefs[name] = {id = id}
			end
		end

		for id, name in pairs(Spring.GetUnitPieceList(unitID)) do
			local parent = lightDefs[Spring.GetUnitPieceInfo(unitID, id).parent]
			if parent ~= nil then
				local k, v = name:gmatch("([^=]+)=(.+)")()
				parent[k] = loadstring("return " .. v)()
			end
		end

		for name, def in pairs(lightDefs) do
			local lightParams = {
					direction = def.direction,
					diffuseColor = def.color,
					specularColor = def.color,
					radius = def.radius,
					fov = def.fov
				}

			lights[unitID][name] = addLight(unitID, lightParams)
			lights[unitID][name].piece = def.id
		end
	end

	function gadget:UnitDestroyed(unitID, unitDefID, unitTeam, attackerID, attackerDefID, attackerTeam)
		if lights[unitID] ~= nil then
			for name, light in pairs(lights[unitID]) do
				removeLight(light)
				lights[unitID][name] = nil
			end
			lights[unitID] = nil
		end
	end

	function gadget:Update()
		local delta = Spring.GetLastUpdateSeconds()

		for unitID, unit in pairs(lights) do
			for name, light in pairs(unit) do
				updateLight(light, {position = {Spring.GetUnitPiecePosition(unitID, light.piece)}})
			end
		end
	end
end
