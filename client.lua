local isInVehControl = false
local window1 = true
local window2 = true
local window3 = true
local window4 = true

Citizen.CreateThread(function()
    while true do
		Citizen.Wait(0)
		if IsPedInAnyVehicle(PlayerPedId(), false) then
			if IsControlJustReleased(0, 40) then -- Key to open NUI https://docs.fivem.net/docs/game-references/controls/
				openVehControl()
			end
		end
    end
end)

function openVehControl()
	isInVehControl = true
		SetNuiFocus(true, true)
		SendNUIMessage({
			type = "openGeneral"
		})
end

function closeVehControl()
	isInVehControl = false
		SetNuiFocus(false, false)
		SendNUIMessage({
			type = "close"
		})
end

RegisterNUICallback('NUIFocusOff', function()
	isInVehControl = false
	SetNuiFocus(false, false)
	SendNUIMessage({
		type = "closeAll"
	})
end)

-----------------------------------------------------------------------------
-- ENGINE
-----------------------------------------------------------------------------

RegisterNUICallback('ignition', function()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    if vehicle ~= nil and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, 0) then
        SetVehicleEngineOn(vehicle, (not GetIsVehicleEngineRunning(vehicle)), false, true)
    end
end)

-----------------------------------------------------------------------------
-- INTERIOR LIGHT
-----------------------------------------------------------------------------

RegisterNUICallback('interiorLight', function(data, cb)
	local playerPed = GetPlayerPed(-1)
	if (IsPedSittingInAnyVehicle(playerPed)) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		if IsVehicleInteriorLightOn(vehicle) then
			SetVehicleInteriorlight(vehicle, false)
		else
			SetVehicleInteriorlight(vehicle, true)
		end
	end
end)

-----------------------------------------------------------------------------
-- DOORS
-----------------------------------------------------------------------------

RegisterNUICallback('doors', function(data, cb)
	local playerPed = GetPlayerPed(-1)
	if (IsPedSittingInAnyVehicle(playerPed)) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		if GetVehicleDoorAngleRatio(vehicle, data.door) > 0.0 then
			SetVehicleDoorShut(vehicle, data.door, false)
		else
			SetVehicleDoorOpen(vehicle, data.door, false)
		end
	end
end)

-----------------------------------------------------------------------------
-- SEATS
-----------------------------------------------------------------------------

RegisterNUICallback('seatchange', function(data, cb)
	local playerPed = GetPlayerPed(-1)
	if (IsPedSittingInAnyVehicle(playerPed)) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		if IsVehicleSeatFree(vehicle, data.seat) then
			TaskWarpPedIntoVehicle(GetPlayerPed(-1), vehicle, data.seat)
		end
	end
end)

-----------------------------------------------------------------------------
-- WINDOWS
-----------------------------------------------------------------------------

RegisterNUICallback('windowdriver', function(data, cb)
	local playerPed = GetPlayerPed(-1)
	if (IsPedSittingInAnyVehicle(playerPed)) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		if window1 == true and DoesVehicleHaveDoor(vehicle, data.door) then
			RollDownWindow(vehicle, data.window)
			window1 = false
		else
			RollUpWindow(vehicle, data.window)
			window1 = true
		end
	end
end)

RegisterNUICallback('windowpass', function(data, cb)
	local playerPed = GetPlayerPed(-1)
	if (IsPedSittingInAnyVehicle(playerPed)) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		if window2 == true and DoesVehicleHaveDoor(vehicle, data.door) then
			RollDownWindow(vehicle, data.window)
			window2 = false
		else
			RollUpWindow(vehicle, data.window)
			window2 = true
		end
	end
end)

RegisterNUICallback('windowlpass', function(data, cb)
	local playerPed = GetPlayerPed(-1)
	if (IsPedSittingInAnyVehicle(playerPed)) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		if window3 == true and DoesVehicleHaveDoor(vehicle, data.door) then
			RollDownWindow(vehicle, data.window)
			window3 = false
		else
			RollUpWindow(vehicle, data.window)
			window3 = true
		end
	end
end)

RegisterNUICallback('windowrpass', function(data, cb)
	local playerPed = GetPlayerPed(-1)
	if (IsPedSittingInAnyVehicle(playerPed)) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		if window4 == true and DoesVehicleHaveDoor(vehicle, data.door) then
			RollDownWindow(vehicle, data.window)
			window4 = false
		else
			RollUpWindow(vehicle, data.window)
			window4 = true
		end
	end
end)

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end