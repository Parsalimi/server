--------------------------------
------- Created by Hamza -------
-------------------------------- 

local ESX = nil

local ExchangeTimer = {}
local GoldJobTimer = {}

local NPC = 0

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

Citizen.CreateThread(function()
	Citizen.Wait(1000)
	while true do
		NPC = math.random(1,#Config.MissionNPC)
		TriggerClientEvent("esx_PoliceMission:spawnNPC",-1,Config.MissionNPC[NPC])
		Citizen.Wait(7200000*2)
	end
end)

AddEventHandler('esx:playerLoaded', function(playerId, xPlayer)
	TriggerClientEvent("esx_PoliceMission:spawnNPC",playerId,Config.MissionNPC[NPC])
end)

-- server side for cooldown timer
RegisterServerEvent("esx_PoliceMission:MeltingCooldown")
AddEventHandler("esx_PoliceMission:MeltingCooldown",function(source)
	table.insert(SmelteryTimer,{MeltingTimer = GetPlayerIdentifier(source), time = ((Config.SmelteryTime * 1000))})
end)

-- server side for cooldown timer
RegisterServerEvent("esx_PoliceMission:ExhangeCooldown")
AddEventHandler("esx_PoliceMission:ExhangeCooldown",function(source)
	table.insert(ExchangeTimer,{ExchangeTimer = GetPlayerIdentifier(source), timeExchange = ((Config.ExchangeCooldown * 60000))})
end)

-- server side for cooldown timer
RegisterServerEvent("esx_PoliceMission:GoldJobCooldown")
AddEventHandler("esx_PoliceMission:GoldJobCooldown",function(source)
	table.insert(GoldJobTimer,{GoldJobTimer = GetPlayerIdentifier(source), timeGoldJob = (2 * 60000)}) -- cooldown timer for doing missions
end)

-- thread for syncing the cooldown timer
Citizen.CreateThread(function() -- do not touch this thread function!
	while true do
	Citizen.Wait(1000)
		for k,v in pairs(SmelteryTimer) do
			if v.time <= 0 then
				RemoveSmelteryTimer(v.MeltingTimer)
			else
				v.time = v.time - 1000
			end
		end
		for k,v in pairs(ExchangeTimer) do
			if v.timeExchange <= 0 then
				RemoveExchangeTimer(v.ExchangeTimer)
			else
				v.timeExchange = v.timeExchange - 1000
			end
		end
		for k,v in pairs(GoldJobTimer) do
			if v.timeGoldJob <= 0 then
				RemoveGoldJobTimer(v.GoldJobTimer)
			else
				v.timeGoldJob = v.timeGoldJob - 1000
			end
		end
	end
end)

-- server side function to get cooldown timer
ESX.RegisterServerCallback("esx_PoliceMission:getGoldJobCoolDown",function(source,cb)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if not CheckGoldJobTimer(GetPlayerIdentifier(source)) then
		cb(false)
	else
		TriggerClientEvent("esx:showNotification",source,string.format("Otro ~ y ~ trabajo ~ s ~ está ~ g ~ disponible ~ s ~ para usted en: ~ b ~% s ~ s ~ minutos",GetGoldJobTimer(GetPlayerIdentifier(source))))
		cb(true)
	end
end)

-- server side function to get payment
RegisterServerEvent('esx_PoliceMission:missionAccepted')
AddEventHandler('esx_PoliceMission:missionAccepted', function()
	TriggerClientEvent("esx_PoliceMission:startMission",source,0)
end)

ESX.RegisterServerCallback("esx_PoliceMission:getPayment",function(source,cb)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local Players = ESX.GetPlayers()
	local blackMoney = 0
	blackMoney = xPlayer.getAccount('black_money').money
	local moneyCash = 0
	moneyCash = xPlayer.getMoney()
	if Config.UseBlackMoneyAsMissionCost == true then
		if blackMoney <= Config.MissionCost then
			TriggerClientEvent('esx:showNotification', source, "Usted ~ b ~ no tiene suficiente ~ s ~ ~ r ~ dinero ~ s ~ para pagar ~ r ~ honorarios ~ s ~ por un ~ y ~ trabajo ~ s ~")
			cb(false)
		else
			xPlayer.removeAccountMoney('black_money', Config.MissionCost)
			TriggerEvent("esx_PoliceMission:GoldJobCooldown",source)
			cb(true)
		end
	else
		if moneyCash <= Config.MissionCost then
			TriggerClientEvent('esx:showNotification', source, "Usted ~ b ~ no tiene suficientes ~ s ~ ~ g ~ dinero ~ s ~ para pagar ~ r ~ honorarios ~ s ~ para un ~ y ~ trabajo ~ s ~")
			cb(false)
		else
			xPlayer.removeMoney(Config.MissionCost)
			TriggerEvent("esx_PoliceMission:GoldJobCooldown",source)
			cb(true)
		end
	end
end)

-- server side function to accept the mission
ESX.RegisterServerCallback("esx_PoliceMission:getMissionavailability",function(source,cb)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local Players = ESX.GetPlayers()
	local policeOnline = 0
	for i = 1, #Players do
		local xPlayer = ESX.GetPlayerFromId(Players[i])
		if xPlayer["job"]["name"] == Config.PoliceDatabaseName then
			policeOnline = policeOnline + 1
		end
	end
	if policeOnline >= Config.RequiredPoliceOnline then
		cb(true)
	else
		cb(false)
		TriggerClientEvent('esx:showNotification', source, "Hay ~ r ~ no ~ s ~ suficientes ~ b ~ policías ~ s ~ en la ~ y ~ ciudad ~ s ~")
	end
end)

-- mission reward
RegisterServerEvent('esx_PoliceMission:reward')
AddEventHandler('esx_PoliceMission:reward', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local SecondItem = false
	
	-- item 1
	local itemAmount1 = ((math.random(Config.ItemMinAmount1,Config.ItemMaxAmount1)) * 100)
	local item1 = ESX.GetItemLabel(Config.ItemName1)
	
	-- item 2
	local itemAmount2 = math.random(Config.ItemMinAmount2,Config.ItemMaxAmount2)
	local item2 = ESX.GetItemLabel(Config.ItemName2)
	
	local chance = math.random(1,Config.RandomChance)
	if chance == 1 then
		SecondItem = true	
	end
	
	if Config.EnableSecondItemReward == true and SecondItem == true then
		xPlayer.addInventoryItem(Config.ItemName1,itemAmount1)
		xPlayer.addInventoryItem(Config.ItemName2,itemAmount2)
		if Config.EnableCustomNotification == true then
			TriggerClientEvent("esx_PoliceMission:missionComplete", source,itemAmount1,item1,itemAmount2,item2)
		else
			TriggerClientEvent('esx:showNotification', source, "~ g ~ Misión completada: ~ s ~ Has recibido ~ b ~"..itemAmount1.."x~s~ ~y~"..item1.."~s~ y "..itemAmount2.."x~s~ ~y~"..item2.."~s~")
		end
	else
		xPlayer.addInventoryItem(Config.ItemName1,itemAmount1)
		if Config.EnableCustomNotification == true then
			TriggerClientEvent("esx_PoliceMission:missionComplete", source,itemAmount1,item1)
		else
			TriggerClientEvent('esx:showNotification', source, "~ g ~ Misión completada: ~ s ~ Has recibido ~b~"..itemAmount1.."x~s~ ~y~"..item1.."~s~")
		end
	end
	
end)

RegisterServerEvent('esx_PoliceMission:GoldJobInProgress')
AddEventHandler('esx_PoliceMission:GoldJobInProgress', function(targetCoords, streetName)
	TriggerClientEvent('esx_PoliceMission:outlawNotify', -1,string.format("^3 Shots fired ^0 at ^5%s^0 and ongoing grand theft auto",streetName))
	TriggerClientEvent('esx_PoliceMission:GoldJobInProgress', -1, targetCoords)
end)

-- sync mission data
RegisterServerEvent("esx_PoliceMission:syncMissionData")
AddEventHandler("esx_PoliceMission:syncMissionData",function(data)
	TriggerClientEvent("esx_PoliceMission:syncMissionData",-1,data)
end)

-- server side function for converting part
RegisterServerEvent('esx_PoliceMission:goldMelting')
AddEventHandler('esx_PoliceMission:goldMelting', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	
	if xPlayer.getInventoryItem("goldwatch").count >= 100 then
		if xPlayer.getInventoryItem("goldbar").count <= 99 then
			if not CheckIfMelting(GetPlayerIdentifier(source)) then
				TriggerEvent("esx_PoliceMission:MeltingCooldown",source)
						
				xPlayer.removeInventoryItem("goldwatch",100)
			
				TriggerClientEvent("GoldWatchToGoldBar",source)
				Citizen.Wait((Config.SmelteryTime * 1000))
			
				xPlayer.addInventoryItem("goldbar",1)
			else
				TriggerClientEvent("esx:showNotification",source,string.format("¡Ya estás ~ b ~ comprometido ~ s ~ en un ~ y ~ proceso ~ s ~!",GetTimeForMelting(GetPlayerIdentifier(source))))
			end
		else
			TriggerClientEvent("esx:showNotification",source,"Usted ~ r ~ no tiene ~ s ~ suficiente ~ b ~ espacio vacío ~ s ~ para más ~ y ~ Lingotes de oro ~ s ~")
		end
	else
		TriggerClientEvent("esx:showNotification",source,"necesitas ~ r ~ al menos ~ s ~ 100x ~ y ~ Relojes de oro ~ s ~")
	end
end)

-- server side function for exchange part
RegisterServerEvent('esx_PoliceMission:goldExchange')
AddEventHandler('esx_PoliceMission:goldExchange', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local _source = source
	
	if not CheckIfExchanging(GetPlayerIdentifier(source)) then
		if xPlayer.getInventoryItem("goldbar").count >= 70 then
			TriggerEvent("esx_PoliceMission:ExhangeCooldown",source)
						
			xPlayer.removeInventoryItem("goldbar",70)
			
			TriggerClientEvent("GoldBarToCash",source)
			Citizen.Wait((Config.ExchangeTime * 1000))
			
			xPlayer.addAccountMoney('black_money', 35000)
		else
			TriggerClientEvent("esx:showNotification",source,"Necesita ~ r ~ al menos ~ s ~ 70x ~ y ~ Lingotes de oro ~ s ~")
		end
	else
		TriggerClientEvent("esx:showNotification",source,string.format("Puede ~ y ~ intercambiar oro ~ s ~ nuevamente en: ~ b ~% s minutos ~ s ~",GetTimeForExchange(GetPlayerIdentifier(source))))
	end
end)

-- ## DO NOT TOUCH BELOW THIS!! ## --

-- Functions for Smeltery Timer
function RemoveSmelteryTimer(source)
	for k,v in pairs(SmelteryTimer) do
		if v.MeltingTimer == source then
			table.remove(SmelteryTimer,k)
		end
	end
end
function GetTimeForMelting(source)
	for k,v in pairs(SmelteryTimer) do
		if v.MeltingTimer == source then
			return math.ceil(v.time/1000)
		end
	end
end
function CheckIfMelting(source)
	for k,v in pairs(SmelteryTimer) do
		if v.MeltingTimer == source then
			return true
		end
	end
	return false
end
-- Functions for Exchange Timer:
function RemoveExchangeTimer(source)
	for k,v in pairs(ExchangeTimer) do
		if v.ExchangeTimer == source then
			table.remove(ExchangeTimer,k)
		end
	end
end
function GetTimeForExchange(source)
	for k,v in pairs(ExchangeTimer) do
		if v.ExchangeTimer == source then
			return math.ceil(v.timeExchange/60000)
		end
	end
end
function CheckIfExchanging(source)
	for k,v in pairs(ExchangeTimer) do
		if v.ExchangeTimer == source then
			return true
		end
	end
	return false
end
-- Functions for Mission Timer:
function RemoveGoldJobTimer(source)
	for k,v in pairs(GoldJobTimer) do
		if v.GoldJobTimer == source then
			table.remove(GoldJobTimer,k)
		end
	end
end
function GetGoldJobTimer(source)
	for k,v in pairs(GoldJobTimer) do
		if v.GoldJobTimer == source then
			return math.ceil(v.timeGoldJob/60000)
		end
	end
end
function CheckGoldJobTimer(source)
	for k,v in pairs(GoldJobTimer) do
		if v.GoldJobTimer == source then
			return true
		end
	end
	return false
end


