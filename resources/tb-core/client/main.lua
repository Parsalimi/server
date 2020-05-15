local Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
}

TBCore 			  = {}
TBCore.PlayerData = {}

local Pickups       = {}
local isSpawned 	= false
local isDead 		= false

RegisterNetEvent('tb-core:client:getObject')
AddEventHandler('tb-core:client:getObject', function(callback)
	callback(TBCore)
end)

RegisterNetEvent('tb-core:client:setCharacterData')
AddEventHandler('tb-core:client:setCharacterData', function(Player)
	TBCore.PlayerData = Player
end)

RegisterNetEvent('tb-core:client:updateCash')
AddEventHandler('tb-core:client:updateCash', function(amount)
	TBCore.PlayerData.cash = amount
end)

RegisterNetEvent('tb-core:client:updateBank')
AddEventHandler('tb-core:client:updateBank', function(amount)
	TBCore.PlayerData.bank = amount
end)

RegisterNetEvent('tb-core:client:updateGroup')
AddEventHandler('tb-core:client:updateGroup', function(group)
	TBCore.PlayerData.usergroup = group
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		DisableControlAction(0, Keys["TAB"], true)
		DisableControlAction(0, Keys["1"], true)
		DisableControlAction(0, Keys["2"], true)
		DisableControlAction(0, Keys["3"], true)
		DisableControlAction(0, Keys["4"], true)
		DisableControlAction(0, Keys["5"], true)

		HideHudComponentThisFrame(19)
		HideHudComponentThisFrame(20)
		HideHudComponentThisFrame(21)
		HideHudComponentThisFrame(22)
	end
end)

Citizen.CreateThread(function()
	while true do
        if GetPlayerWantedLevel(PlayerId()) ~= 0 then
            SetPlayerWantedLevel(PlayerId(), 0, false)
            SetPlayerWantedLevelNow(PlayerId(), true)
		end
		Citizen.Wait(7)
    end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local ped = GetPlayerPed(-1)

		if not IsPedInAnyVehicle(ped, false) then
			DisplayRadar(false)
		else
			DisplayRadar(true)
		end
	end
end)

-- UPDATE LOCATION
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		
		local ped 		= GetPlayerPed(-1)
		local pos  		= GetEntityCoords(ped, false)
		local coords    = {x = pos.x, y = pos.y, z = pos.z}
		
		TriggerServerEvent('tb-core:server:updateLocation', coords)
		Citizen.Wait(2500)
	end
end)

-- Dead event

RegisterNetEvent('tb-core:client:isDead')
AddEventHandler('tb-core:client:isDead', function()
	local ped = GetPlayerPed(-1)
	local health = GetEntityHealth(ped)
	print(health)
	-- if health < 1 then
	-- 	isDead = true
	-- end
end)

RegisterNetEvent('tb-core:client:pickup')
AddEventHandler('tb-core:client:pickup', function(id, player)
	local ped     = GetPlayerPed(GetPlayerFromServerId(player))
	local coords  = GetEntityCoords(ped)
	local forward = GetEntityForwardVector(ped)
	local x, y, z = table.unpack(coords + forward * 0.5)

	TBCore.Functions.SpawnLocalObject('prop_michael_backpack', { x = x, y = y, z = z + 0.5, }, function(obj)
		SetEntityAsMissionEntity(obj, true, false)
		PlaceObjectOnGroundProperly(obj)
		FreezeEntityPosition(obj, true)

		Pickups[id] = {
			id = id,
			obj = obj,
			inRange = false,
			coords = { x = x, y = y, z = z - 0.3 }
		}
	end)
end)

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(100)
    end
end

RegisterNetEvent('tb-core:client:removePickup')
AddEventHandler('tb-core:client:removePickup', function(id)
	TBCore.Functions.DeleteObject(Pickups[id].obj)
	Pickups[id] = nil
end)

Citizen.CreateThread(function()
	while true do

		Citizen.Wait(0)

		local playerPed = GetPlayerPed(-1)
		local coords    = GetEntityCoords(playerPed)
		local name 		= GetPlayerName(PlayerPedId())
		
		-- if there's no nearby pickups we can wait a bit to save performance
		if next(Pickups) == nil then
			Citizen.Wait(500)
		end

		for k,v in pairs(Pickups) do

			local distance = GetDistanceBetweenCoords(coords, v.coords.x, v.coords.y, v.coords.z, true)
			local closestPlayer, closestDistance = TBCore.Functions.GetClosestPlayer()
			local ad = "pickup_object"

			if distance <= 3.0 then
				TBCore.Functions.DrawText3D(v.coords.x, v.coords.y, v.coords.z + 0.25, '[~g~H~w~] Om item op te pakken')
			end

			if distance <= 2.5 and not v.inRange and not IsPedSittingInAnyVehicle(playerPed) then
				if IsControlJustReleased(0, TBCore.Functions.getKey("H")) then
		            loadAnimDict( ad )
		            TaskPlayAnim(playerPed, ad, 'pickup_low', 8.0, 8.0, -1, 50, 0, false, false, false)
		            Citizen.Wait(1000)
		            TriggerServerEvent('tb-core:server:onPickup', v.id)
		            TaskPlayAnim(playerPed, ad, 'exit', 8.0, 8.0, -1, 50, 0, false, false, false)
				end
			end

		end

	end
end)