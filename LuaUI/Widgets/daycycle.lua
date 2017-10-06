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

function widget:GetInfo()
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

local incrementPerSecond = 1 / 30
local colorDay = {0.5, 0.5, 0.5}
local colorNight = {0.1, 0.1, 0.13}

local progress = 0

local function getColor(index)
  local colorFactor = 0
  if progress > 0.9 then
    colorFactor = (1 - progress) * 5 + 0.5
  elseif progress > 0.1 then
    colorFactor = 1
  elseif progress > -0.1 then
    colorFactor = (progress + 0.1) * 5
  elseif progress > -0.9 then
    colorFactor = 0
  else
    colorFactor = (-progress - 0.9) * 5
  end

  return colorDay[index] * colorFactor + colorNight[index] * (1 - colorFactor)
end

function widget:Initialize()
  Spring.SetSunManualControl = true
end

function widget:Update(delta)
  progress = (progress + incrementPerSecond * delta)
  if progress > 1 then
    progress = progress - 2
  end
  
  if progress >= 0 then
    Spring.SetSunDirection(math.sin((progress - 0.5) * math.pi), math.cos((progress - 0.5) * math.pi), 0.5)
  else
    Spring.SetSunDirection(math.sin((progress + 0.5) * math.pi), math.cos((progress + 0.5) * math.pi), 0.5)
  end
  
  local color = {getColor(1), getColor(2), getColor(2)}
  Spring.SetSunLighting({groundAmbientColor = color, groundDiffuseColor = color, unitAmbientColor = color, unitDiffuseColor = color})
end
