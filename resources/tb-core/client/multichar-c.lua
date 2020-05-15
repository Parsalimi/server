local selectingChar = false

local cam = nil
local cam2 = nil

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if NetworkIsSessionStarted() then
            TriggerServerEvent('tb-core:multichar:server:playerJoin')
            TriggerEvent('tb-core:multichar:client:startCam')
            TriggerEvent('tb-ui:client:closeUI:multichar')
            ShowChar(true)
			return
		end
	end
end)

RegisterNetEvent('tb-core:multichar:client:selectChar')
AddEventHandler('tb-core:multichar:client:selectChar', function()
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = "charSelect",
        status = true
    })
    selectingChar = true
end)

RegisterNetEvent('tb-core:multichar:client:setupCharacters')
AddEventHandler('tb-core:multichar:client:setupCharacters', function()
    TBCore.Functions.TriggerServerCallback('tb-core:multichar:server:getChar', function(data)
        SendNUIMessage({type = "setupCharacters", characters = data})
    end)
end)

RegisterNUICallback('closeCharSelection', function()
    ShowChar(false)
end)

RegisterNUICallback('refreshCharacters', function()
    TBCore.Functions.TriggerServerCallback('tb-core:multichar:server:refreshChars', function(data)
        SendNUIMessage({type = "refreshCharacters", characters = data})

        print('Het hele kanker zooitje is ge refreshed')
    end)
end)

RegisterNUICallback('selectCharacter', function(data)
    local cid = tonumber(data.cid)
    ShowChar(false)
    TriggerServerEvent('tb-core:multichar:server:charSelect', cid)
    TriggerEvent('tb-spawnlocation:client:openUI', true)
    SetTimecycleModifier('default')
    SetCamActive(cam, false)
    DestroyCam(cam, true)
end)

RegisterNUICallback('deleteCharacter', function(data)
    local cid = tonumber(data.cid)

    TriggerServerEvent('tb-core:multichar:server:deleteChar', cid)
end)

RegisterNUICallback('createCharacter', function(data)
    local charData = data.charData

    TriggerServerEvent('tb-core:multichar:server:createCharacter', charData)
    TriggerEvent('tb-core:multichar:client:setupCharacters')
end)

function ShowChar(value)
    SetNuiFocus(value, value)
    SendNUIMessage({
        type = "charSelect",
        status = value
    })
    selectingChar = value
end

RegisterNetEvent('tb-core:multichar:client:startCam')
AddEventHandler('tb-core:multichar:client:startCam', function()
    DoScreenFadeIn(10)
    SetTimecycleModifier('hud_def_blur')
    SetTimecycleModifierStrength(1.0)
    FreezeEntityPosition(GetPlayerPed(-1), true)
    cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", -358.56, -981.96, 286.25, 320.00, 0.00, -50.00, 90.00, false, 0)
    SetCamActive(cam, true)
    RenderScriptCams(true, false, 1, true, true)
end)

















-- RegisterNetEvent('tb-core:multichar:client:destroyCam')
-- AddEventHandler('tb-core:multichar:client:destroyCam', function(spawn)
--     SetTimecycleModifier('default')
--     local pos = spawn
--     SetEntityCoords(GetPlayerPed(-1), pos.x, pos.y, pos.z)
--     DoScreenFadeIn(500)
--     Citizen.Wait(500)
--     cam2 = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", -358.56, -981.96, 286.25, 300.00,0.00,0.00, 100.00, false, 0)
--     PointCamAtCoord(cam2, pos.x,pos.y,pos.z+200)
--     SetCamActiveWithInterp(cam2, cam, 900, true, true)
--     Citizen.Wait(900)

--     cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", pos.x,pos.y,pos.z+200, 300.00,0.00,0.00, 100.00, false, 0)
--     PointCamAtCoord(cam, pos.x,pos.y,pos.z+2)
--     SetCamActiveWithInterp(cam, cam2, 3700, true, true)
--     Citizen.Wait(3700)
--     PlaySoundFrontend(-1, "Zoom_Out", "DLC_HEIST_PLANNING_BOARD_SOUNDS", 1)
--     RenderScriptCams(false, true, 500, true, true)
--     PlaySoundFrontend(-1, "CAR_BIKE_WHOOSH", "MP_LOBBY_SOUNDS", 1)
--     FreezeEntityPosition(GetPlayerPed(-1), false)
--     Citizen.Wait(500)
--     SetCamActive(cam, false)
--     DestroyCam(cam, true)
--     DisplayHud(true)
--     DisplayRadar(true)

--     print('yes 2345')
-- end)