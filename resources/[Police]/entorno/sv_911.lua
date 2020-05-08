-- Simple 911 Command (With Location & Blip) -- 
		-- Made By Chezza --

displayLocation = false  -- By Changing this to 'false' it will make it so your location is not displayed in chat --
blips = false -- By Changing this to 'false' it will disable 911 call blips meaning your location will not be shown on the map --
disableChatCalls = false -- By Chaning this to 'false' it will make it so 911 call are not displayed in chat (Recommended to have Discord Webhook setup if disabling this) --
webhookurl = 'Insert Webhook URL Here' -- Add your discord webhook url here, if you do not want this leave it blank (More info on FiveM post) --

-- Code --

RegisterServerEvent('911')
--AddEventHandler('911', function(location, msg, x, y, z, name, ped)
AddEventHandler('911', function(msg, x, y, z, ped)
	local playername = GetPlayerName(source)
	local ped = GetPlayerPed(source)
	if displayLocation == false then
		if disableChatCalls == false then
			TriggerClientEvent('chatMessage', -1, '', {255,255,255}, '^*^4EL AVISO HA SIDO MANDANDO A LAS PATRULLAS DISPONIBLES.')
			--TriggerClientEvent('chatMessage', -1, '', {255,255,255}, '^*^4911 | Caller ID: ^r' .. playername .. '^*^4 | Report: ^r' .. msg)
			--sendDiscord('911 Communications', '**911 | Caller ID: **' .. playername .. '** | Report: **' .. msg)
			sendDiscord('911 Communications', '**911 | Report: **' .. msg)  
			--TriggerServerEvent('esx_phone:send', "police", "Llamada al 911 " .. msg, true, coords)
		else
			--sendDiscord('911 Communications', '**911 | Caller ID: **' .. playername .. '** | Report: **' .. msg)
			sendDiscord('911 Communications', '**911 | Report: **' .. msg)
			--TriggerServerEvent('esx_phone:send', "police", "Llamada al 911 " .. msg, true, coords)  
		end
	else
		if disableChatCalls == false then
			TriggerClientEvent('chatMessage', -1, '', {255,255,255}, '^*^4EL AVISO HA SIDO MANDANDO A LAS PATRULLAS DISPONIBLES.')
			--TriggerClientEvent('chatMessage', -1, '', {255,255,255}, '^*^4911 | Caller ID: ^r' .. playername .. '^*^4 | Location: ^r' .. location .. '^*^4 | Report: ^r' .. msg)
			--LAS LINEAS COMENTADAS SON LAS QUE MUESTRAN EL ID DEL QUE LLAMA AL 911 ¿COMO PONERLAS SOLO PARA LA POLICIA?
			--sendDiscord('911 Communications', '**911 | Caller ID: **' .. playername .. '** | Location: **' .. location .. '** | Report: **' .. msg)
			sendDiscord('911 Communications', '**911 | Report: **' .. msg)
			--TriggerServerEvent('esx_phone:send', "police", "Llamada al 911 " .. msg, true, coords)
		else
			--sendDiscord('911 Communications', '**911 | Caller ID: **' .. playername .. '** | Location: **' .. location .. '** | Report: **' .. msg)
			sendDiscord('911 Communications', '**911 | Report: **' .. msg)
			--TriggerServerEvent('esx_phone:send', "police", "Llamada al 911 " .. msg, true, coords)
		end
		if blips == true then
			--TriggerClientEvent('911:setBlip', -1, name, x, y, z)
			--TriggerClientEvent('911:setBlip', -1, x, y, z)
			-- ESTO ES UNA PRUEBA. NO DESCOMENTAR
			--TriggerServerEvent('esx_gcphone:send', "police", "Llamada al 911 desde " .. location .. | Report: **' .. msg)
		end
	end
end)

--EVENTO QUE MANDARIA EL MENSAJE A LA POLICIA DEL 911

--RegisterServerEvent('esx_phone:send')
--AddEventHandler('esx_phone:send', function(number, message, _, coords)
  	--local source = source

  --if PhoneNumbers[number] ~= nil then
    --getPhoneNumber(source, function (phone) 
      --notifyAlertSMS(number, {
       -- message = message,
        --coords = coords,
        --numero = phone,
     -- }, PhoneNumbers[number].sources)
   -- end)
 -- else
    -- print('esx_phone:send | Appels sur un service non enregistre => numero : ' .. number)
  --end
--end)


--function sendDiscord(name, message)
function sendDiscord(message)
	  PerformHttpRequest(webhookurl, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	  --PerformHttpRequest(webhookurl, function(err, text, headers) end, 'POST', json.encode({username = name, content = message}), { ['Content-Type'] = 'application/json' })
end


	