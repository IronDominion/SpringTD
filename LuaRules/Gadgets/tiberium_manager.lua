--
--	This file is part of SpringTD (https://github.com/IronDominion/SpringTD).
--	Copyright (c) 2020 The contributors of SpringTD (see AUTHORS).
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
        name = "Tiberium Manager",
        desc = "Replaces metal on the ground with blossom trees and manages tiberium spread over time.",
        author = "Voidwalker",
        date = "2020-12-01",
        license = "GNU GPL, v2 or later",
        layer = 5,
        enabled = true
    }
end
-- TODO:
-- find a way to check if the map is 'made of metal' and disable this script in this scenario

-- synced only
if gadgetHandler:IsSyncedCode() then

    function gadget:Initialize() Spring.Echo("TibManager::Init()") end

    function gadget:Shutdown() Spring.Echo("TibManager::Shutdown()") end

    function gadget:GameStart()
        -- Metal map coordinates are mapSize coordinates divided by 16
        Spring.Echo("TibManager::GameStart()")

        local gaiaTeamID = Spring.GetGaiaTeamID()
        for ix = 0, Game.mapSizeX / 16, 1 do
            for iz = 0, Game.mapSizeZ / 16, 1 do
                local _metal = Spring.GetMetalAmount(ix, iz)

                if _metal > 0 then
                    Spring.SetMetalAmount(ix, iz, .0)
                    local y = Spring.GetGroundHeight(ix * 16, iz * 16)
                    -- TODO: Group found metal spots by 3x3 spots and
                    -- replace spawned unit with blossom tree
                    Spring.CreateUnit(UnitDefNames["base"].id, ix * 16.0, y,
                                      iz * 16.0, 1.0, gaiaTeamID)
                    Spring.Echo("Found " .. tostring(_metal) ..
                                    " of metal at: [" .. tostring(ix * 16) ..
                                    ",0," .. tostring(iz * 16) .. "]")
                end
            end
        end
    end

    -- function gadget:Update() end -- TODO tiberium growth logic here
end
