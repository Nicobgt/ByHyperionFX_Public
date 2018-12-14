-- Created by Asser90 - modified by Deziel0495 and IllusiveTea - further modified by Vespura --

-- These vehicles will be registered as "allowed/valid" tow trucks.
-- Change the x, y and z offset values for the towed vehicles to be attached to the towtruck.
-- x = left/right, y = forwards/backwards, z = up/down
local allowedTowModels = { 
    ['flatbed'] = {x = 0.0, y = -0.85, z = 0.65}, -- default GTA V flatbed
    ['flatbed2'] = {x = 0.0, y = 0.0, z = 0.68}, -- addon flatbed2 (provided with the script)
    ['flatbed3'] = {x = 0.0, y = -1.2, z = 1.30}, -- addon flatbed3 (also provided with the script)
}


local allowTowingBoats = false -- Set to true if you want to be able to tow boats.
local allowTowingPlanes = false -- Set to true if you want to be able to tow planes.
local allowTowingHelicopters = false -- Set to true if you want to be able to tow helicopters.
local allowTowingTrains = false -- Set to true if you want to be able to tow trains.
local allowTowingTrailers = false -- Disables trailers. NOTE: THIS ALSO DISABLES: AIRTUG, TOWTRUCK, SADLER, ANY OTHER VEHICLE THAT IS IN THE UTILITY CLASS.

local currentlyTowedVehicle = nil

RegisterCommand("tow", function()
	TriggerEvent("tow")
end,false)



function isTargetVehicleATrailer(modelHash)
    if GetVehicleClassFromName(modelHash) == 11 then
        return true
    else
        return false
    end
end

local xoff = 0.0
local yoff = 0.0
local zoff = 0.0

function isVehicleATowTruck(vehicle)
    local isValid = false
    for model,posOffset in pairs(allowedTowModels) do
        if IsVehicleModel(vehicle, model) then
            xoff = posOffset.x
            yoff = posOffset.y
            zoff = posOffset.z
            isValid = true
            break
        end
    end
    return isValid
end

RegisterNetEvent('tow')
AddEventHandler('tow', function()
	
	local playerped = PlayerPedId()
	local vehicle = GetVehiclePedIsIn(playerped, true)
	
	local isVehicleTow = isVehicleATowTruck(vehicle)

	if isVehicleTow then

		local coordA = GetEntityCoords(playerped, 1)
		local coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 5.0, 0.0)
		local targetVehicle = getVehicleInDirection(coordA, coordB)
        

		Citizen.CreateThread(function()
			while true do
				Citizen.Wait(0)
				isVehicleTow = isVehicleATowTruck(vehicle)
				local roll = GetEntityRoll(GetVehiclePedIsIn(PlayerPedId(), true))
				if IsEntityUpsidedown(GetVehiclePedIsIn(PlayerPedId(), true)) and isVehicleTow or roll > 70.0 or roll < -70.0 then
					DetachEntity(currentlyTowedVehicle, false, false)
					currentlyTowedVehicle = nil
				end
			end
		end)

		if currentlyTowedVehicle == nil then
			if targetVehicle ~= 0 then
                local targetVehicleLocation = GetEntityCoords(targetVehicle, true)
                local towTruckVehicleLocation = GetEntityCoords(vehicle, true)
                local distanceBetweenVehicles = GetDistanceBetweenCoords(targetVehicleLocation, towTruckVehicleLocation, false)
                -- print(tostring(distanceBetweenVehicles)) -- debug only
                if distanceBetweenVehicles > 12.0 then
                    TriggerEvent("pNotify:SendNotification",{text = "Kablerne er ikke lange nok, flyt bilen tættere på.",type = "error",timeout = (2000),layout = "centerLeft",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
                else
                    local targetModelHash = GetEntityModel(targetVehicle)
                    -- Check to make sure the target vehicle is allowed to be towed (see settings at lines 8-12)
                    if not ((not allowTowingBoats and IsThisModelABoat(targetModelHash)) or (not allowTowingHelicopters and IsThisModelAHeli(targetModelHash)) or (not allowTowingPlanes and IsThisModelAPlane(targetModelHash)) or (not allowTowingTrains and IsThisModelATrain(targetModelHash)) or (not allowTowingTrailers and isTargetVehicleATrailer(targetModelHash))) then 
                        if not IsPedInAnyVehicle(playerped, true) then
                            if vehicle ~= targetVehicle and IsVehicleStopped(vehicle) then
                                -- TriggerEvent('chatMessage', '', {255,255,255}, xoff .. ' ' .. yoff .. ' ' .. zoff) -- debug line
                                AttachEntityToEntity(targetVehicle, vehicle, GetEntityBoneIndexByName(vehicle, 'bodyshell'), 0.0 + xoff, -1.5 + yoff, 0.0 + zoff, 0, 0, 0, 1, 1, 0, 1, 0, 1)
                                currentlyTowedVehicle = targetVehicle
                                TriggerEvent("pNotify:SendNotification",{text = "Bilen blev kørt på ladet.",type = "success",timeout = (2000),layout = "centerLeft",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
                            else
                                TriggerEvent("pNotify:SendNotification",{text = "Der er ikke nogen bil på ladet.",type = "error",timeout = (2000),layout = "centerLeft",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
                            end
                        else
                            TriggerEvent("pNotify:SendNotification",{text = "Du skal være ude af bilen for at bruge ladet.",type = "error",timeout = (2000),layout = "centerLeft",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
                        end
                    else
                        TriggerEvent("pNotify:SendNotification",{text = "Din lastbil er ikke stor nok til det køretøj.",type = "error",timeout = (2000),layout = "centerLeft",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
                    end
                end
            else
                TriggerEvent("pNotify:SendNotification",{text = "Intet køretøj i nærheden du kan køre på ladet.",type = "error",timeout = (2000),layout = "centerLeft",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
			end
		elseif IsVehicleStopped(vehicle) then
            DetachEntity(currentlyTowedVehicle, false, false)
            local vehiclesCoords = GetOffsetFromEntityInWorldCoords(vehicle, 0.0, -12.0, 0.0)
			SetEntityCoords(currentlyTowedVehicle, vehiclesCoords["x"], vehiclesCoords["y"], vehiclesCoords["z"], 1, 0, 0, 1)
			SetVehicleOnGroundProperly(currentlyTowedVehicle)
			currentlyTowedVehicle = nil
            TriggerEvent("pNotify:SendNotification",{text = "Bilen blev kørt af ladet.",type = "success",timeout = (2000),layout = "centerLeft",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
		end
	else
        TriggerEvent("pNotify:SendNotification",{text = "Din bil er ikke indregistreret som en ladvogn.",type = "success",timeout = (2000),layout = "centerLeft",queue = "global",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
    end
end)

function getVehicleInDirection(coordFrom, coordTo)
	local rayHandle = CastRayPointToPoint(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 10, PlayerPedId(), 0)
	local a, b, c, d, vehicle = GetRaycastResult(rayHandle)
	return vehicle
end