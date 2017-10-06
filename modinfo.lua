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

local modinfo = {
	name='SpringTD',
	shortName='STD',
	version='v0.01',
	game='',
	shortGame='',
	mutator= 'Official',
	description='Tiberian Dawn reimagined in Spring RTS',
	url='https://github.com/IronDominion/SpringTD',
	modtype=1,

	depend = {
		"cursors.sdz",
		"springcontent.sdz",
	}
}

return modinfo