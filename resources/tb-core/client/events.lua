RegisterNetEvent('tb-core:client:SpawnVehicle')
AddEventHandler('tb-core:client:SpawnVehicle', function(vehicle, name)
	local myPed = GetPlayerPed(-1)
	local player = PlayerId()
	local vehicle = GetHashKey(vehicle)

    RequestModel(vehicle)

	while not HasModelLoaded(vehicle) do
		Wait(1)
	end

	local coords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0, 5.0, 0)
	local spawned_car = CreateVehicle(vehicle, coords, 64.55118,116.613,78.69622, true, false)
	SetVehicleOnGroundProperly(spawned_car)
	SetPedIntoVehicle(myPed, spawned_car, - 1)
	SetModelAsNoLongerNeeded(vehicle)
	TBCore.Functions.Notify('success', 'Vehicle Spawned: '..name)
end)

RegisterNetEvent('tb-core:client:DeleteVehicle')
AddEventHandler('tb-core:client:DeleteVehicle', function()
    local playerPed = PlayerPedId()
	local vehicle   = TBCore.Functions.GetClosestVehicle()

	if IsPedInAnyVehicle(playerPed, true) then
		vehicle = GetVehiclePedIsIn(playerPed, false)
	end

	if DoesEntityExist(vehicle) then
		TBCore.Functions.DeleteVehicle(vehicle)
		TBCore.Functions.Notify('success', 'Vehicle Deleted')
	end
end)

RegisterNetEvent('tb-core:client:playSound')
AddEventHandler('tb-core:client:playSound', function(sound, set)
	PlaySoundFrontend(-1, sound, set, false)
end)

RegisterNetEvent('tb-core:client:refreshPlayer')
AddEventHandler('tb-core:client:refreshPlayer', function()
	TriggerServerEvent('tb-core:client:refreshPlayer', TBCore.PlayerData)
end)

RegisterNetEvent('tb-core:client:notify')
AddEventHandler('tb-core:client:notify', function(type, msg, length)
	exports['tb-notify']:Notification(type, msg, length)
end)