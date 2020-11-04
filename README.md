# vehcontrol

NUI visual menu vehicle script for FiveM

## Features

* Control
    - Hood
    - Trunk
    - Doors
    - Windows
    - Interior Light
    - Change Seats

## NUI Controls

**Open** - ]

**Close** - ESC

## Commands

**/engine** - Start/Stop Vehicle Engine

**/hood** - Open/Close Hood

**/trunk** - Open/Close Trunk

**/seat** [1-4]- Move Seat

**/door** [1-4] - Open/Close Door

**/window** [1-4] - Roll Up/Down Window

**/windowfront** - Roll Up/Down Front Windows

**/windowback** - Roll Up/Down Back Windows

**/windowall** - Roll Up/Down All Windows

**/vehcontrolclose** - Close NUI (in F8 if stuck open)

## Config
UseCommands [true/false] - Allow the use of /commands

DisableSeatShuffle [true/false] - Allow auto-seat shuffle from passenger to driver

## TODO

- Nothing Currently

Feature request can be made [Here](https://github.com/Manvaril/vehcontrol/issues/new/choose)

## Changelog

**v1.1.1**
- Fix Auto-Seat Shuffle
- Add DisableSeatShuffle [true/false] flag to config

**v1.1.0**
- Fixed seat switching (was unable to move to driver from every seat)
- Added config.lua with settings
- Added /engine command
- Added /hood command
- Added /trunk command
- Added /door command
- Added /seat command
- Added /window command
- Added /windowfront command
- Added /windowback command
- Added /windowall command
- Added vehcontrolclose command (use in F8 if NUI stuck open)
- Restructured code to be modular with NUI and Commands

**v1.0.0**
- Initial Release

## License

Copyright 2020 Manvaril

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
