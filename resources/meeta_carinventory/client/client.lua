-- CREATE BY THANAWUT PROMRAUNGDET
ESX = nil

local IsOpenMenu = false
local CloseToVehicle = false
local Current_Vehicle

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	Citizen.Wait(5000)

end)

function all_trim(s)
    if s then
        return s:match "^%s*(.*)":match "(.-)%s*$"
    else
        return "noTagProvided"
    end
end

function VehicleInFront()
    local pos = GetEntityCoords(GetPlayerPed(-1))
    local entityWorld = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0.0, 2.0, 0.0)
    local rayHandle = CastRayPointToPoint(pos.x, pos.y, pos.z, entityWorld.x, entityWorld.y, entityWorld.z, 10, GetPlayerPed(-1), 0)
    local a, b, c, d, result = GetRaycastResult(rayHandle)
    return result
end

Citizen.CreateThread(function()
    while true do
        Wait(0)
        -- Press Key
        if IsControlJustPressed(1, Config.Key["L"]) and not IsPedInAnyVehicle(PlayerPedId()) and not IsOpenMenu then
            local PlayerPed = GetPlayerPed(-1)
            local PlayerCoords = GetEntityCoords(PlayerPed)
            local Vehicles = GetClosestVehicle(PlayerCoords.x, PlayerCoords.y, PlayerCoords.z, 2.0, 0, 71)
            if GetPedInVehicleSeat(Vehicles, -1) == 0 then
                local Vehicle_Plate = GetVehicleNumberPlateText(Vehicles)
                local Vehicle_Lock = GetVehicleDoorLockStatus(Vehicles)
                local Vehicle_Class = GetVehicleClass(Vehicles)

                print(Vehicle_Class)

                if Vehicles ~= 0 then
                    IsOpenMenu = true
                    if Vehicle_Lock == 1 then
                        if Vehicle_Class == 8 or Vehicle_Class == 13 then
                            TriggerEvent("pNotify:SendNotification", {
                                text = 'ยานพหนะ<strong class="red-text">ไม่สามารถ</strong>เก็บของได้',
                                type = "error",
                                timeout = 3000,
                                layout = "bottomCenter",
                                queue = "global"
                            })
                            Wait(2000)
                            IsOpenMenu = false
                        else
                            local Vehicle_Model = string.lower(GetDisplayNameFromVehicleModel(GetEntityModel(Vehicles)))
                            SetVehicleDoorOpen(Vehicles, 5, false, false)
                            TriggerEvent("pNotify:SendNotification", {
                                text = '<strong class="blue-text">กรุณารอ...</strong>',
                                type = "success",
                                timeout = 2000,
                                layout = "bottomCenter",
                                queue = "global"
                            })
                            Wait(1000)
                            OpenInventoryVehicle(Vehicle_Plate, Config.VehicleLimitModel[Vehicle_Model])
                            CloseToVehicle = true
                            Current_Vehicle = Vehicles
                        end
                    else
                        TriggerEvent("pNotify:SendNotification", {
                            text = 'ยานพหนะถูก<strong class="red-text">ล็อค</strong>ไม่สามารถเปิดท้ายได้',
                            type = "error",
                            timeout = 3000,
                            layout = "bottomCenter",
                            queue = "global"
                        })
                        Wait(2000)
                        IsOpenMenu = false
                    end
                end
            end
            
        end

    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(500)
        local pos = GetEntityCoords(GetPlayerPed(-1))
        if CloseToVehicle then
            local vehicle = GetClosestVehicle(pos["x"], pos["y"], pos["z"], 2.0, 0, 70)
            if DoesEntityExist(vehicle) then
                CloseToVehicle = true
            else
                CloseToVehicle = false
                IsOpenMenu = false
                SetVehicleDoorShut(Current_Vehicle, 5, false)
            end
        end
    end
end)

function OpenInventoryVehicle(plate, max)
    if not max then
        max = Config.Limit
    end

    ESX.TriggerServerCallback("meeta_carinventory:getInventory",function(inventory)
        text = plate.." ความจุ: "..(inventory.weight / 1000).." / "..(max / 1000)
        data = {plate = plate, max = max, text = text}
        TriggerEvent("esx_inventoryhud:openTrunkInventory", data, inventory.cash, inventory.blackMoney, inventory.items, inventory.weapons)
        IsOpenMenu = false
    end, plate)

end

RegisterNetEvent("meeta_carinventory:setOpenMenu")
AddEventHandler("meeta_carinventory:setOpenMenu",function(state)
    IsOpenMenu = state
end)