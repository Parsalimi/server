-- vBasic by Vespura.
-- v4.0 / 29-06-2018
-- No need to touch anything in here, use the convars instead.


local settings = {}
Citizen.CreateThread(function()
    -- Handler for whenever the settings are received from the server.
    RegisterNetEvent("vBasic:setSettings")
    AddEventHandler("vBasic:setSettings", function(data)
        settings = json.decode(data)
    end)
    
    -- Wait a little before requesting the settings.
    Citizen.Wait(100)
    TriggerServerEvent("vBasic:getSettings")
    
    -- Wait for the settings to be received.
    while settings.pvp == nil do
        Citizen.Wait(1)
    end
    
    -- Loop these things every 10 ticks.
    while true do
        Citizen.Wait(10) -- these things don't need to run every tick.
        
        -- manage pvp
        if (settings.pvp == 1) then
            SetCanAttackFriendly(PlayerPedId(), true, false)
            NetworkSetFriendlyFireOption(true)
        elseif (settings.pvp == 2) then
            SetCanAttackFriendly(PlayerPedId(), false, false)
            NetworkSetFriendlyFireOption(false)
        end
        
        -- manage godmode
        if (settings.godmode == 1) then
            SetPlayerInvincible(PlayerId(), true)
            SetEntityInvincible(PlayerPedId(), true)
        elseif (settings.godmode == 2) then
            SetPlayerInvincible(PlayerId(), false)
            SetEntityInvincible(PlayerPedId(), false)
        end
        
        -- manage unlimited stamina
        if (settings.unlimitedStamina) then
            ResetPlayerStamina(PlayerId())
        end
    end
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0) -- prevent crashing

		-- These natives have to be called every frame.
		SetVehicleDensityMultiplierThisFrame(0.0) -- set traffic density to 0 
		SetPedDensityMultiplierThisFrame(0.0) -- set npc/ai peds density to 0
		SetRandomVehicleDensityMultiplierThisFrame(0.0) -- set random vehicles (car scenarios / cars driving off from a parking spot etc.) to 0
		SetParkedVehicleDensityMultiplierThisFrame(0.0) -- set random parked vehicles (parked car scenarios) to 0
		SetScenarioPedDensityMultiplierThisFrame(0.0, 0.0) -- set random npc/ai peds or scenario peds to 0
		SetGarbageTrucks(false) -- Stop garbage trucks from randomly spawning
		SetRandomBoats(false) -- Stop random boats from spawning in the water.
		SetCreateRandomCops(false) -- disable random cops walking/driving around.
		SetCreateRandomCopsNotOnScenarios(false) -- stop random cops (not in a scenario) from spawning.
		SetCreateRandomCopsOnScenarios(false) -- stop random cops (in a scenario) from spawning.
		
		local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
		ClearAreaOfVehicles(x, y, z, 1000, false, false, false, false, false)
		RemoveVehiclesFromGeneratorsInArea(x - 500.0, y - 500.0, z - 500.0, x + 500.0, y + 500.0, z + 500.0);
	end
end)

--[[-- A second thread for running at a different delay.
Citizen.CreateThread(function()

    -- Wait until the settings have been loaded.
    while settings.trafficDensity == nil or settings.pedDensity == nil do
        Citizen.Wait(1)
    end
    
    -- Do this every tick.
    while true do
        Citizen.Wait(0) -- these things NEED to run every tick.
        
        -- Traffic and ped density management
        SetTrafficDensity(settings.trafficDensity)
        SetPedDensity(settings.pedDensity)
        
        -- Wanted level management
        if (settings.neverWanted and GetPlayerWantedLevel(PlayerId()) > 0) then
            SetPlayerWantedLevel(PlayerId(), 0, false)
            SetPlayerWantedLevelNow(PlayerId(), false)
        end
        
        -- Dispatch services management
        for i=0,255 do
            EnableDispatchService(i, not settings.noEmergencyServices)
        end
        
    end
end)


function SetTrafficDensity(density)
    SetParkedVehicleDensityMultiplierThisFrame(density)
    SetVehicleDensityMultiplierThisFrame(density)
    SetRandomVehicleDensityMultiplierThisFrame(density)
end

function SetPedDensity(density)
    SetPedDensityMultiplierThisFrame(density)
    SetScenarioPedDensityMultiplierThisFrame(density, density)
end
--]]
