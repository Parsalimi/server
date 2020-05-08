--[[
	file: server.lua
	resource: scotty-policealert
	author: Scotty1944
	contact: https://steamcommunity.com/id/scotty1944/
	warning: หากนำไปขายต่อหรือแจกจ่าย หรือใช้ร่วมกันเกิน 1 server จะถูกยกเลิก license ทันที
]]

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local queue = {}

local function CopAlert(text, pos)
	local xPlayers = ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 		if xPlayer.job.name == 'police' then
				TriggerClientEvent("pNotify:SendNotification", xPlayers[i], {
				text = text,
				layout = Config["alert_position"],
				queue = "police_alert", 
				type = "alert",
				theme = "gta",
				timeout = Config["duration"] * 800,
			})
			TriggerClientEvent("scotty-policealert:alertArea", xPlayers[i], pos)
		
		end
	end
end

local function InsertQueue(pos)
	local num
	for i=1, 9 do
		local v = queue[i]
		if v == nil then
			num = i
			queue[i] = {
				time = GetGameTimer() + (Config["duration"] * 800),
				pos = pos
			}
			break
		end
	end
	return num
end

RegisterServerEvent("scotty-policealert:getLocation")
AddEventHandler("scotty-policealert:getLocation", function(num)
	local data = queue[num]
	if data then
		TriggerClientEvent("scotty-policealert:sendLocation", source, data.pos)
	end
end)

local player_report = {}
RegisterServerEvent("scotty-policealert:defaultAlert")
AddEventHandler("scotty-policealert:defaultAlert", function(type, gender, location, pos)
	if player_report[source] and player_report[source] > GetGameTimer() then	
		return
	end
	--print(type, gender, location, pos)
	local num = InsertQueue(pos)
	if not num then return end
	
	local action
	if type == "carjacking" then
		action = Config["translate"]["action_carjacking"]
	elseif type == "melee" then
		action = Config["translate"]["action_melee"]
	elseif type == "gunshot" then
		action = Config["translate"]["action_gunshot"]
	elseif type == "drug" then
		action = Config["translate"]["action_drug"]
	elseif type == "thief" then
		action = Config["translate"]["action_thief"]
	elseif type == "fishing" then
		action = Config["translate"]["action_fishing"]
	elseif type == "burglary" then
		action = Config["translate"]["action_burglary"]
	else
		return
	end
	
	player_report[source] = GetGameTimer() + (Config["duration"] * 800)
	
	local text = ''..Config["translate"]["title"]..''..string.format(Config["translate"]["text"], Config["translate"][gender], action, location)..'<br><b style="color:black; background:white; border-radius:4px; padding:2%;">'..Config["base_key_text"]..'</b> + <b style="color:black; background:white; border-radius:4px; padding:2% 4% 2% 4%;">'..num..'</b> '..Config["translate"]["tip"]..'<br>'
	
	CopAlert(text, pos)
end)

Citizen.CreateThread(function()
	while true do
		for i=1, 9 do
			local v = queue[i]
			if v and v.time < GetGameTimer() then
				queue[i] = nil
			end
		end
		Citizen.Wait(500)
	end
end)