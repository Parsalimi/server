-- Simple 911 Command (With Location & Blip) -- 
		-- Made By Chezza --

displayTime = 300 -- Refreshes Blips every 5 Minutes by Default --  

-- Code --

blip = nil
blips = {}

local group 

RegisterNetEvent('es_admin:setGroup')
AddEventHandler('es_admin:setGroup', function(g)
	print('group setted ' .. g)
	group = g
end)

Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/entorno', 'Manda un reporte a la policia!', {
    { name="Reporte", help="Enter the incident/report here!" }
})
end)

RegisterNetEvent('911:setBlip')
AddEventHandler('911:setBlip', function(name, x, y, z)
    local name = GetPlayerName(PlayerId())
    blip = AddBlipForCoord(x, y, z)
    SetBlipSprite(blip, 66)
    SetBlipScale(blip, 1.0)
    SetBlipColour(blip, 3)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('911 Call - ' .. name)
    EndTextCommandSetBlipName(blip)
    table.insert(blips, blip)
    Wait(displayTime * 1000)
    for i, blip in pairs(blips) do 
        RemoveBlip(blip)
    end
end)

-- Command -- 

RegisterCommand('entorno', function(source, args)
    
        --local name = GetPlayerName(PlayerId())
        local ped = GetPlayerPed(PlayerId())
        local x, y, z = table.unpack(GetEntityCoords(ped, true))
        local coords = GetEntityCoords(ped, true)
        -- VARIABLES QUE PUEDE QUE USE
        --local coords = Vector3(x, y, z)
        --local coords = GetEntityCoords(ped, true)
        local street = GetStreetNameAtCoord(x, y, z)
        local location = GetStreetNameFromHashKey(street)
        local msg = table.concat(args, ' ')
        if args[1] == nil then
            TriggerEvent('chatMessage', '^5911', {255,255,255}, ' ^7Please enter your ^1report/issue.')
        else
            if group ~= 'police' then  
               
                --TriggerServerEvent('911', location, msg, x, y, z, name)
                TriggerServerEvent('911', msg, x, y, z)
                --PRUEBAS PARA QUE LOS ENTORNOS SEAN SOLO A LA POLICIA.
                --TriggerServerEvent('esx_gcphone:send', "police", "Llamada al 911 desde " .. location .. | Reporte: **' .. msg)
                TriggerServerEvent('esx_phone:send', "police", "Llamada al 911 " .. msg, true, coords)
                --ESX.ShowNotification('~g~Has mandado tu mensaje al 911. Gracias.')
            end
        end
end)

