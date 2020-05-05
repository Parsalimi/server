local BlacklistedObject = {"xs_prop_hamburgher_wl","prop_fnclink_05crnr1","p_crahsed_heli_s","prop_rock_4_big2","prop_beachflag_le","stt_prop_stunt_soccer_ball","prop_beach_fire","apa_mp_apa_yacht","xm_prop_x17_sub","sr_prop_sr_track_wall","stt_prop_stunt_jump15","stt_prop_stunt_jump30","stt_prop_stunt_jump45","stt_prop_stunt_trck_slope15","stt_prop_stunt_trck_slope30","stt_prop_stunt_trck_slope45","stt_prop_stunt_track_start"}
local BlacklistedPed = {"a_m_o_acult_01","rcmpaparazzo_2"}
--local ListeBlackList = {"avenger2","maverick","blimp2","luxor","besra","blimp2","blimp3","bombushka","cargoplane","hydra","jet","lazer","titan","volatol",}
local ListeBlackList = {"blimp2"}

ESX     = nil
BanList = {}
DiscordDLMABan = "https://discordapp.com/api/webhooks/682269488443293758/aRVIybM8Q3KY8PjeH-jLSWrJo6bL0DzvWe8CD-KxL5qHTykJrg_J_ppT2dxiEMinj6LM"
DiscordDLMAObject = "https://discordapp.com/api/webhooks/682269863384973318/AMPo4WNe_am6ZpCmCZloKuklaf28z4QNetLn9uaVZoH19phUhOazpgya6PsgdRlMRiOG"
DiscordDLMAexplosion = "https://discordapp.com/api/webhooks/682270050811641940/AgXzszLfTFaRtYc3gNXuaUtH3wYEtVHx69QEyNfSeazHbwP4LxoQT3jo2dJ61KMKQ6ew"
DiscordDLMAWarn = "https://discordapp.com/api/webhooks/682270345818144778/SD7oTAgyn0W1bwQOYkia4dFmHnkvd-S-z6cANjEGoKFPFgAZ0qhVv1rLOlDwpcALSiTt"
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler("onMySQLReady",function()
	loadBanList()
end)


function loadBanList()
	MySQL.Async.fetchAll(
		'SELECT * FROM dlma_ban',
		{},
		function (data)
		  BanList = {}
		  for i=1, #data, 1 do
			table.insert(BanList, {
				identifier = data[i].identifier,
				license    = data[i].license,
				liveid     = data[i].liveid,
				xblid      = data[i].xblid,
				discord    = data[i].discord,
				playerip   = data[i].playerip,
				reason     = data[i].reason,
			  })
		  end
    end)
end

RegisterCommand('DBanReload', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
		if xPlayer.permission_level >= 4 then
			if xPlayer.get('aduty') then
				loadBanList()
			else
				TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, " ^0Shoma nemitavanid dar halat ^1OffDuty ^0az command haye admini estefade konid!")
			end
	
		else
			TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, " ^0Shoma Ejaze in kar ro nadarid!")
		end
							
	end)	

--[[
RegisterServerEvent("modmenu")
AddEventHandler("modmenu", function()
	local _source = source
	Wait(100)
	sendToDiscord(DiscordDLMAWarn,_source,"[Try to Block event]","**Name: **"..GetPlayerName(_source).."\n Enjoy Ban :)",12320855)
	TriggerEvent('DLMA:BCheater', _source,"Dont try to use cheat! :)" )
end)
]]

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(8000)
		StopResource("acxd")
		Citizen.Wait(1000)
		StartResource("acxd")
		CancelEvent()
	end
end)
--[[
Citizen.CreateThread(function()
	while true do
		updateCheck()
		Citizen.Wait(10000)
		TriggerClientEvent("DLMA:TargetCheck", -1) 
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(45000)
		RemToCheck()
	end
end)

PlayerCheck = {}
PlayerWarning = {}
function AddToCheck(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer then
	if not PlayerCheck[xPlayer.identifier] then
	    PlayerCheck[xPlayer.identifier] = {Name = xPlayer.name}
	end
end
end

function WarnPlayer(xPlayer)
	if PlayerWarning[xPlayer.identifier] then
		if PlayerWarning[xPlayer.identifier].Warn >= 3 then
			PlayerWarning[xPlayer.identifier] = nil
			sendToDiscord(DiscordDLMAWarn,xPlayer.source,"[Not Connect to anticheat]","**Name: **"..GetPlayerName(xPlayer.source),12320855)
			DropPlayer(xPlayer.source, "[DLMA]: You are not connected to ANTI-CHEAT.")
		else
			PlayerWarning[xPlayer.identifier].Warn = PlayerWarning[xPlayer.identifier].Warn + 1
			print("Player Disconnected! | "..xPlayer.name.." | "..PlayerWarning[xPlayer.identifier].Warn.."/4")
		end
	else
		PlayerWarning[xPlayer.identifier] = {Warn = 0}
	end	
end

function RemToCheck()
	for _,v in pairs(GetPlayers()) do
		local xPlayer = ESX.GetPlayerFromId(v)
	if xPlayer then
	    if PlayerCheck[xPlayer.identifier] then
			PlayerCheck[xPlayer.identifier] = nil
			PlayerWarning[xPlayer.identifier] = nil
	    else
		    print("Not Player To List!")
	    end
    end
  end
end

function updateCheck()
	for _,v in pairs(GetPlayers()) do
		local xPlayer = ESX.GetPlayerFromId(v)
		if xPlayer then
		if not PlayerCheck[xPlayer.identifier] then
			WarnPlayer(xPlayer)
		end
	end
	end
end

AddEventHandler('playerDropped', function()
	local _source = source
	if _source ~= nil then
		print(_source)
		local identifier = GetPlayerIdentifier(_source)
		PlayerCheck[identifier] = nil
		PlayerWarning[identifier] = nil
	end
end)
]]

AddEventHandler('explosionEvent', function(sender, ev)
	print(sender,json.encode(ev))
	sendToDiscord(DiscordDLMAexplosion,sender,"[CREATE EXPLOSION]","**Creator Name: **"..GetPlayerName(sender),12320855)
	CancelEvent()
end)

RegisterServerEvent('DLMA:CheckBack')
AddEventHandler('DLMA:CheckBack', function()
	AddToCheck(source)
end)

RegisterServerEvent('DLMA:WeaponFlag')
AddEventHandler('DLMA:WeaponFlag', function(weapon)
	print("Weapon Cheat !!")
	TriggerClientEvent("DLMA:RemoveInventoryWeapons", source) 
end)

AddEventHandler('entityCreated', function(entity)
    local entity = entity
    if not DoesEntityExist(entity) then
        return
    end
    local src = NetworkGetEntityOwner(entity)
    local entID = NetworkGetNetworkIdFromEntity(entity)
    local model = GetEntityModel(entity)
	local hash = GetHashKey(entity)
	local SpawnerName = GetPlayerName(src)
	for i, objName in ipairs(ListeBlackList) do
        if model == GetHashKey(objName) then
			TriggerClientEvent("DLMA:DeleteCars", src, entity)
			sendToDiscord(DiscordDLMAObject,src,"[BLOCK LIST CARS SPAWN]","**-Spawner Name: **"..SpawnerName.."\n\n**-Object Name: **"..objName.."\n\n**-Spawn Model:** "..model.."\n\n**-Entity ID:** "..entity.."\n\n**-Hash ID:** "..hash.."\n\n Enjoy Ban xD",10038562)
			TriggerEvent('DLMA:BCheater', src,"Block Vehicle Spawning\nYou just try me :)")
			break
        end
    end
	for i, objName in ipairs(BlacklistedPed) do
        if model == GetHashKey(objName) then
			TriggerClientEvent("DLMA:DeletePeds", src, entity)
			sendToDiscord(DiscordDLMAObject,src,"[BLOCK LIST PED SPAWN]","**-Spawner Name: **"..SpawnerName.."\n\n**-Object Name: **"..objName.."\n\n**-Spawn Model:** "..model.."\n\n**-Entity ID:** "..entity.."\n\n**-Hash ID:** "..hash.."\n\n Enjoy Ban xD",10038562)
			TriggerEvent('DLMA:BCheater', src,"Block Object Spawning\nYou just try me :)")
			break
        end
    end
	for i, objName in ipairs(BlacklistedObject) do
        if model == GetHashKey(objName) then
			TriggerClientEvent("DLMA:DeleteEntity", src, entity)
			sendToDiscord(DiscordDLMAObject,src,"[BLOCK LIST ENTITY SPAWN]","**-Spawner Name: **"..SpawnerName.."\n\n**-Object Name: **"..objName.."\n\n**-Spawn Model:** "..model.."\n\n**-Entity ID:** "..entity.."\n\n**-Hash ID:** "..hash.."\n\n Enjoy Ban xD",10038562)
			TriggerEvent('DLMA:BCheater', src,"Block Object Spawning\nYou just try me :)")
			break
        end
    end
end)


RegisterServerEvent('DLMA:BCheater')
AddEventHandler('DLMA:BCheater', function(source,reason)
	local identifier
	local license
	local liveid    = "no info"
	local xblid     = "no info"
	local discord   = "no info"
	local playerip        
	local sourceplayername = GetPlayerName(source)
		for k,v in ipairs(GetPlayerIdentifiers(source))do
			if string.sub(v, 1, string.len("steam:")) == "steam:" then
				identifier = v
			elseif string.sub(v, 1, string.len("license:")) == "license:" then
				license = v
			elseif string.sub(v, 1, string.len("live:")) == "live:" then
				liveid = v
			elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
				xblid  = v
			elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
				discord = v
			elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
				playerip = v
			end
		end
		ban(identifier,license,liveid,xblid,discord,playerip,sourceplayername,reason)
		TriggerClientEvent('chatMessage', -1, "[DLMA Detected]", {255, 0, 0}, sourceplayername.." permanent Ban from server." )
		sendToDiscord(DiscordDLMABan,source,"[EXECUTOR BAN]","**Name :**"..sourceplayername.."\n\n**"..identifier.."**\n\n**"..license.."**\n\n**"..discord.."**\n\n**"..playerip.."**\n\n**Reason:**"..reason,15158332)
		DropPlayer(source, '[DLMA]: ' .. reason)
	end)

function ban(identifier,license,liveid,xblid,discord,playerip,sourceplayername,reason)		
			table.insert(BanList, {
				identifier = identifier,
				license    = license,
				liveid     = liveid,
				xblid      = xblid,
				discord    = discord,
				playerip   = playerip,
				reason     = reason,
			  })

			MySQL.Async.execute(
					'INSERT INTO dlma_ban (identifier,license,liveid,xblid,discord,playerip,sourceplayername,reason) VALUES (@identifier,@license,@liveid,@xblid,@discord,@playerip,@sourceplayername,@reason)',
					{ 
					['@identifier']       = identifier,
					['@license']          = license,
					['@liveid']           = liveid,
					['@xblid']            = xblid,
					['@discord']          = discord,
					['@playerip']         = playerip,
					['@sourceplayername'] = sourceplayername,
					['@reason']           = reason,
					},
					function ()
			end)
end	

function sendToDiscord(DiscordLog,source,title,des,color)
local nick = GetPlayerName(source) or "None"
  local embed = {
        {
            ["color"] = color,
            ["title"] = title,
            ["description"] = des,
            ["footer"] = {
                ["text"] = "DLMA ANTI-CHEAT | Dev: SoHeil#4935",
            },
        }
    }
  Wait(100)
  PerformHttpRequest(DiscordLog, function(err, text, headers) end, 'POST', json.encode({username = nick, embeds = embed}), { ['Content-Type'] = 'application/json' })
end

AddEventHandler('playerConnecting', function (playerName,setKickReason)
	local steamID  = "empty"
	local license  = "empty"
	local liveid   = "empty"
	local xblid    = "empty"
	local discord  = "empty"
	local playerip = "empty"

	for k,v in ipairs(GetPlayerIdentifiers(source))do
		if string.sub(v, 1, string.len("steam:")) == "steam:" then
			steamID = v
		elseif string.sub(v, 1, string.len("license:")) == "license:" then
			license = v
		elseif string.sub(v, 1, string.len("live:")) == "live:" then
			liveid = v
		elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
			xblid  = v
		elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
			discord = v
		elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
			playerip = v
		end
	end

	if (Banlist == {}) then
		Citizen.Wait(1000)
	end

	for i = 1, #BanList, 1 do
		if 
			((tostring(BanList[i].identifier)) == tostring(steamID) 
			or (tostring(BanList[i].license)) == tostring(license) 
			or (tostring(BanList[i].liveid)) == tostring(liveid) 
			or (tostring(BanList[i].xblid)) == tostring(xblid) 
			or (tostring(BanList[i].discord)) == tostring(discord) 
			or (tostring(BanList[i].playerip)) == tostring(playerip)) 
		then
			setKickReason("[DLMA]: You have been permanently banned for:\n".. BanList[i].reason)
			CancelEvent()
		end
	end
end)
