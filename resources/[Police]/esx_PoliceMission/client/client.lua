--------------------------------
------- Created by Hamza -------
-------------------------------- 

ESX = nil

local PlayerData = nil
local converting = false
local meltingGold = false
local exchangingGold = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end
	PlayerData = ESX.GetPlayerData()
end)

-- Function for 3D text:
function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())

    SetTextScale(0.32, 0.32)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 255)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 500
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 80)
end

-- Blip on Map for Gold Smeltery Location
Citizen.CreateThread(function()
	if Config.EnableSmelteryBlip == true then
	  for k,v in ipairs(Config.GoldSmeltery)do
		local blip = AddBlipForCoord(v.x, v.y, v.z)
		SetBlipSprite(blip, 618)
		SetBlipDisplay(blip, 4)
		SetBlipScale  (blip, 0.7)
		SetBlipColour (blip, 5)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Gold Smeltery")
		EndTextCommandSetBlipName(blip)
	  end
	end
end)

-- Blip on Map for Gold Smeltery Location
Citizen.CreateThread(function()
	if Config.EnableExchangeBlip == true then
	  for k,v in ipairs(Config.GoldExchange)do
		local blip = AddBlipForCoord(v.x, v.y, v.z)
		SetBlipSprite(blip, 500)
		SetBlipDisplay(blip, 4)
		SetBlipScale  (blip, 0.7)
		SetBlipColour (blip, 5)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Gold Exchange")
		EndTextCommandSetBlipName(blip)
	  end
	end
end)

-- Core Thread Function
Citizen.CreateThread(function()
	while true do
        Citizen.Wait(5)
		local pos = GetEntityCoords(GetPlayerPed(-1), false)
		for k,v in pairs(Config.GoldSmeltery) do
			local distance = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, v.x, v.y, v.z, false)
			if distance <= 10.0 then
				DrawMarker(Config.SmelteryMarker, v.x, v.y, v.z-0.975, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 2.5, 2.5, 2.5, Config.SmelteryMarkerColor.r,Config.SmelteryMarkerColor.g,Config.SmelteryMarkerColor.b,Config.SmelteryMarkerColor.a, false, true, 2, true, false, false, false)					
			else
				Citizen.Wait(500)
			end	
			if distance <= 1.5 and meltingGold == false then
				DrawText3Ds(v.x, v.y, pos.z, "Press ~g~[E]~s~ for ~y~Gold Melting~s~")
				if IsControlJustPressed(0, 38) then
					TriggerServerEvent("esx_PoliceMission:goldMelting")
					meltingGold = true
				end
			end
		end		
	end
end)

-- Core Thread Function
Citizen.CreateThread(function()
	while true do
        Citizen.Wait(5)
		local pos = GetEntityCoords(GetPlayerPed(-1), false)
		for k,v in pairs(Config.GoldExchange) do
			local distance = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, v.x, v.y, v.z, false)
			if distance <= 5.0 then
				DrawMarker(Config.ExchangeMarker, v.x, v.y, v.z-0.975, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.25, 1.25, 1.25, Config.ExchangeMarkerColor.r,Config.ExchangeMarkerColor.g,Config.ExchangeMarkerColor.b,Config.ExchangeMarkerColor.a, false, true, 2, true, false, false, false)					
			else
				Citizen.Wait(500)
			end	
			if distance <= 0.6 then
				DrawText3Ds(v.x, v.y, pos.z, "Presiona ~g~[E]~s~ para el intercambio del oro")
				if IsControlJustPressed(0, 38) then
					TriggerServerEvent("esx_PoliceMission:goldExchange")
					exchangingGold = true
				end
			end
		end		
	end
end)

-- GOLD WATCH >> GOLD BAR
RegisterNetEvent("GoldWatchToGoldBar")
AddEventHandler("GoldWatchToGoldBar", function()
	FreezeEntityPosition(GetPlayerPed(-1), true)
    if converting then
      return
    end
	
    converting = true
	
	TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, true)
	exports['progressBars']:startUI((Config.SmelteryTime * 1000), "GOLD WATCH > GOLD BAR")
	Citizen.Wait((Config.SmelteryTime * 1000))
	ClearPedTasks(PlayerPedId())
	FreezeEntityPosition(GetPlayerPed(-1), false)
    meltingGold = false
	converting = false
end)

-- GOLD BAR >> DIRTY CASH
RegisterNetEvent("GoldBarToCash")
AddEventHandler("GoldBarToCash", function()
	FreezeEntityPosition(GetPlayerPed(-1), true)
    if converting then
      return
    end
	
    converting = true
	
	--TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, true)
	exports['progressBars']:startUI((Config.ExchangeTime * 1000), "EXCHANGING GOLD BARS")
	Citizen.Wait((Config.ExchangeTime * 1000))
	--ClearPedTasks(PlayerPedId())
	FreezeEntityPosition(GetPlayerPed(-1), false)
    
	exchangingGold = false
	converting = false
	ESX.ShowNotification("Has recibido ~r~$35.000~s~ de Dinero")
end)
