local Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

TBCore = nil
local isLoggedIn = true

Citizen.CreateThread(function()
	while TBCore == nil do
		TriggerEvent('tb-core:client:getObject', function(obj) TBCore = obj end)
		Citizen.Wait(0)
    end
end)

RegisterNetEvent('tb-core:client:setCharacterData')
AddEventHandler('tb-core:client:setCharacterData', function(Player)
    pData = Player
end)

RegisterNetEvent('tb-core:client:PlayerLoaded')
AddEventHandler('tb-core:client:PlayerLoaded', function()
    isLoggedIn = true
end)

--CODE

local inInventory = false

RegisterNUICallback("exit", function(data)
    SetTimecycleModifier('default')
    SetNuiFocus(false, false)
    SendNUIMessage({
        type = "ui",
        status = false
    })
    inInventory = false

    TriggerServerEvent('tb-inventory:server:saveInventory')
end)

RegisterNUICallback('updateSlot', function(data)
    print('Item slot updated')
    TriggerServerEvent('tb-inventory:server:updateSlot', data.name, data.slot)
end)

RegisterNUICallback('updateWeaponSlot', function(data)
    TriggerServerEvent('tb-inventory:server:updateWeaponSlot', data.weaponid, data.slot)
end)

RegisterNUICallback('useItem', function(data)
    local itemData = data.data

    TriggerEvent('tb-inventory:usableItem:'..itemData.item, itemData.item)
    Citizen.Wait(100)
    loadPlayerInventory()
end)

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(100)
    end
end

RegisterNUICallback('dropItem', function(data)
    local itemData = data.data

    local ad = "pickup_object"
    local playerPed = GetPlayerPed(-1)

    
    if tonumber(data.amount) ~= 0 then
        if data.amount ~= nil then
            loadAnimDict(ad)
            TaskPlayAnim(playerPed, ad, 'pickup_low', 8.0, 8.0, -1, 50, 0, false, false, false)
            Citizen.Wait(700)
            TriggerServerEvent('tb-core:server:removeInventoryItem', itemData.type, itemData.item, data.amount, itemData)
            Citizen.Wait(100)
            loadPlayerInventory()
            Citizen.Wait(1100)
            TaskPlayAnim(playerPed, ad, 'exit', 8.0, 8.0, -1, 50, 0, false, false, false)
        else
            TriggerEvent('chat:addMessage', {
                template = '<div style="padding: 8px; font-weight: bold; margin: 0.1vw; background-color: rgba(231, 74, 59, 0.75); border-radius: 6px;"><b>{0}</b> | {1}</div>',
                args = {'SYSTEM', 'Je moet een hoeveelheid invoeren'}
            })
        end
    else
        TriggerEvent('chat:addMessage', {
            template = '<div style="padding: 8px; font-weight: bold; margin: 0.1vw; background-color: rgba(231, 74, 59, 0.75); border-radius: 6px;"><b>{0}</b> | {1}</div>',
            args = {'SYSTEM', 'Je moet een hoeveelheid invoeren'}
        })
    end
    
end)

function SetDisplay(bool)
    SetTimecycleModifier('hud_def_blur')
    inInventory = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "ui",
        status = bool
    })
    SendNUIMessage({type = "setupSlots", maxslots = TBInventory.MaxPlayerSlots})
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(7)         
        if IsDisabledControlJustPressed(0, Keys["F2"]) then 
            if isLoggedIn then              
                loadPlayerInventory()
                SetDisplay(true)
            else
                print('No data found')
            end
        end
    end
end)

RegisterNetEvent('tb-inventory:client:openHouseInventory')
AddEventHandler('tb-inventory:client:openHouseInventory', function(house)
    if isLoggedIn then
        loadPlayerInventory()
        loadHouseInventory(house)
        SetDisplay(true)
        Citizen.Wait(1000)
    else
        print('No data found')
    end
end)

Citizen.CreateThread(function()
    while inInventory do
        Citizen.Wait(0)

        DisableAllControlActions(0)
    end
end)

function loadPlayerInventory()
    TBCore.Functions.TriggerServerCallback('tb-inventory:server:getPlayerInventory', function(data)
        items = {}
        inventory = data.inventory
        weapons = data.weapons
        local weight = 0

        if inventory ~= nil then
            for k, v in pairs(inventory) do
                table.insert(items, inventory[k])
                weight = weight + (inventory[k].amount * inventory[k].weight)
            end
        end

        if weapons ~= nil then
            for k, v in pairs(weapons) do    
                table.insert(items, weapons[k])
            end
        end
        SendNUIMessage({type = "setItems", itemList = items, maxplayerkg = TBInventory.MaxPlayerKG, playerkg = weight, pBSN = 34634438})
    end, GetPlayerServerId(PlayerId()))
end

function loadHouseInventory(house)
    TBCore.Functions.TriggerServerCallback('tb-inventory:server:getHouseInventory', function(data)
        items = {}
        inventory = data.inventory
        weapons = data.weapons
        local weight = 0

        if inventory ~= nil then
            for k, v in pairs(inventory) do
                table.insert(items, inventory[k])
            end
        end

        if weapons ~= nil then
            for k, v in pairs(weapons) do    
                table.insert(items, weapons[k])
            end
        end

        SendNUIMessage({type = "setupHouseSlots", houseslots = 80})
        SendNUIMessage({type = "setHouseItems", itemListHouse = items})
    end, GetPlayerServerId(PlayerId()), house)
end

RegisterNetEvent('tb-inventory:client:refreshInventory')
AddEventHandler('tb-inventory:client:refreshInventory', function()
    Citizen.Wait(500)
    loadPlayerInventory()
    print('yeet')
end)

RegisterNetEvent('tb-inventory:client:addItem')
AddEventHandler('tb-inventory:client:addItem', function(itemname, itemlabel)
    local data = { name = itemname, label = itemlabel }
    SendNUIMessage({type = "addInventoryItem", addItemData = data})
end)

-- HOTBAR

local currentWeapon = nil
local currentWeaponModel = nil
local currentSlot = 0
local takingWeapon = false

RegisterNetEvent('tb-inventory:client:takingWeapon')
AddEventHandler('tb-inventory:client:takingWeapon', function(bool)
    takingWeapon = bool
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if isLoggedIn then
            if IsDisabledControlJustPressed(0, Keys["1"]) then
                TBCore.Functions.TriggerServerCallback('tb-inventory:server:getHotbarItem', function(data, value, wepbullets)
                    if value then
                        if data.usable then
                            if data.type == "weapon" then
                                if not takingWeapon then
                                    local ped = GetPlayerPed(-1)
                                    local wep = GetHashKey(data.name)

                                    if not HasPedGotWeapon(ped, currentWeapon, false) then
                                        currentWeapon = wep
                                        currentWeaponModel = data.name
                                        print(currentWeaponModel)
                                        currentSlot = 1
                                        GiveWeaponToPed(ped, wep, 0, false, true)
                                        SetPedAmmo(ped, wep, wepbullets)
                                        SendNUIMessage({type = "useHBItem", itemData = data})
                                    else
                                        RemoveWeaponFromPed(ped, currentWeapon)
                                        currentWeapon = nil
                                        currentWeaponModel = nil
                                    end
                                end
                            elseif data.type == "item" then
                                if currentWeapon ~= nil then
                                    local ped = GetPlayerPed(-1)
                                    RemoveWeaponFromPed(ped, currentWeapon)
                                    currentWeapon = nil
                                else
                                    SendNUIMessage({type = "useHBItem", itemData = data})
                                    TriggerEvent('tb-inventory:usableItem:'..data.name, data.name)
                                    Citizen.Wait(100)
                                    loadPlayerInventory()
                                end
                            end
                        end
                    else
                        print('No item found')
                    end
                end, 1)
            end

            if IsDisabledControlJustPressed(0, Keys["2"]) then
                TBCore.Functions.TriggerServerCallback('tb-inventory:server:getHotbarItem', function(data, value, wepbullets)
                    if value then
                        if data.usable then
                            if data.type == "weapon" then
                                if not takingWeapon then
                                    local ped = GetPlayerPed(-1)
                                    local wep = GetHashKey(data.name)
                                    

                                    if not HasPedGotWeapon(ped, currentWeapon, false) then
                                        currentWeapon = wep
                                        currentWeaponModel = data.name
                                        currentSlot = 2
                                        GiveWeaponToPed(ped, wep, 0, false, true)
                                        SetPedAmmo(ped, wep, wepbullets)
                                        SendNUIMessage({type = "useHBItem", itemData = data})
                                    else
                                        RemoveWeaponFromPed(ped, currentWeapon)
                                        currentWeapon = nil
                                        currentWeaponModel = nil
                                    end
                                end
                            elseif data.type == "item" then
                                if currentWeapon ~= nil then
                                    local ped = GetPlayerPed(-1)
                                    RemoveWeaponFromPed(ped, currentWeapon)
                                    currentWeapon = nil
                                else
                                    SendNUIMessage({type = "useHBItem", itemData = data})
                                    TriggerEvent('tb-inventory:usableItem:'..data.name, data.name)
                                    Citizen.Wait(100)
                                    loadPlayerInventory()
                                end
                            end
                        end
                    else
                        print('No item found')
                    end
                end, 2)
            end

            if IsDisabledControlJustPressed(0, Keys["3"]) then
                TBCore.Functions.TriggerServerCallback('tb-inventory:server:getHotbarItem', function(data, value, wepbullets)
                    if value then
                        if data.usable then
                            if data.type == "weapon" then
                                if not takingWeapon then
                                    local ped = GetPlayerPed(-1)
                                    local wep = GetHashKey(data.name)
                                    

                                    if not HasPedGotWeapon(ped, currentWeapon, false) then
                                        currentWeapon = wep
                                        currentWeaponModel = data.name
                                        currentSlot = 3
                                        GiveWeaponToPed(ped, wep, 0, false, true)
                                        SetPedAmmo(ped, wep, wepbullets)
                                        SendNUIMessage({type = "useHBItem", itemData = data})
                                    else
                                        RemoveWeaponFromPed(ped, currentWeapon)
                                        currentWeapon = nil
                                        currentWeaponModel = nil
                                    end
                                end
                            elseif data.type == "item" then
                                if currentWeapon ~= nil then
                                    local ped = GetPlayerPed(-1)
                                    RemoveWeaponFromPed(ped, currentWeapon)
                                    currentWeapon = nil
                                else
                                    SendNUIMessage({type = "useHBItem", itemData = data})
                                    TriggerEvent('tb-inventory:usableItem:'..data.name, data.name)
                                    Citizen.Wait(100)
                                    loadPlayerInventory()
                                end
                            end
                        end
                    else
                        print('No item found')
                    end
                end, 3)
            end

            if IsDisabledControlJustPressed(0, Keys["4"]) then
                TBCore.Functions.TriggerServerCallback('tb-inventory:server:getHotbarItem', function(data, value, wepbullets)
                    if value then
                        if data.usable then
                            if data.type == "weapon" then
                                if not takingWeapon then
                                    local ped = GetPlayerPed(-1)
                                    local wep = GetHashKey(data.name)
                                    

                                    if not HasPedGotWeapon(ped, currentWeapon, false) then
                                        currentWeapon = wep
                                        currentWeaponModel = data.name
                                        currentSlot = 4
                                        GiveWeaponToPed(ped, wep, 0, false, true)
                                        SetPedAmmo(ped, wep, wepbullets)
                                        SendNUIMessage({type = "useHBItem", itemData = data})
                                    else
                                        RemoveWeaponFromPed(ped, currentWeapon)
                                        currentWeapon = nil
                                        currentWeaponModel = nil
                                    end
                                end
                            elseif data.type == "item" then
                                if currentWeapon ~= nil then
                                    local ped = GetPlayerPed(-1)
                                    RemoveWeaponFromPed(ped, currentWeapon)
                                    currentWeapon = nil
                                else
                                    SendNUIMessage({type = "useHBItem", itemData = data})
                                    TriggerEvent('tb-inventory:usableItem:'..data.name, data.name)
                                    Citizen.Wait(100)
                                    loadPlayerInventory()
                                end
                            end
                        end
                    else
                        print('No item found')
                    end
                end, 4)
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(7)

        local ped = GetPlayerPed(-1)

        while IsPedShooting(ped) do
            local currentWeaponAmmo = GetAmmoInPedWeapon(ped, currentWeapon)
            TriggerServerEvent('tb-inventory:server:updateAmmo', currentWeaponModel, currentWeaponAmmo, currentSlot)
            Citizen.Wait(250)
        end
    end
end)

----- USABLE ITEMS: >
