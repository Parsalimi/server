ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

--Send the message to your discord server
function sendToDiscord(url,name, message, color)

    -- Modify here your discordWebHook username = name, content = message,embeds = embeds

    local embeds = {
        {
            ["title"] = message,
            ["type"] = "rich",
            ["color"] = color,
            ["footer"] = {
                ["text"] = "PeaceLand LOG",
            },
        }
    }

    if message == nil or message == '' then return FALSE end
    PerformHttpRequest(url, function(err, text, headers) end, 'POST', json.encode({ username = name, embeds = embeds }), { ['Content-Type'] = 'application/json' })
end


-- Send the first notification
sendToDiscord(_U('server'), _U('server_start'), Config.green)

-- Event when a player is writing
AddEventHandler('chatMessage', function(author, color, message)
    local ChatURL = "https://discordapp.com/api/webhooks/709111050569646201/WOotVVxTBD5efcuPs13JTWUWc1l4J7JkNUP1JiCaaHDJzHP8n1J4kSiQO2DGlBExjEMh"
    if (settings.LogChatServer) then
        local player = ESX.GetPlayerFromId(author)
        sendToDiscord(ChatURL,_U('server_chat'), player.name .. " : " .. message, Config.grey)
    end
end)


-- Event when a player is connecting
RegisterServerEvent("esx:playerconnected")
AddEventHandler('esx:playerconnected', function()
    local LoginLogoutLog = "https://discordapp.com/api/webhooks/709109994783506444/0-yt2E-_7Yyt78vD6GQ5qdmsC0qeHg1Od7dgHxXsTC8q5JLZYwkWVeNr2MXVkkNjwC0-"
    if (settings.LogLoginServer) then
        sendToDiscord(LoginLogoutLog, _U('server_connecting'), GetPlayerName(source) .. " " .. _('user_connecting'), Config.grey)
    end
end)

-- Event when a player is disconnecting
AddEventHandler('playerDropped', function(reason)
    local LoginLogoutLog = "https://discordapp.com/api/webhooks/709109994783506444/0-yt2E-_7Yyt78vD6GQ5qdmsC0qeHg1Od7dgHxXsTC8q5JLZYwkWVeNr2MXVkkNjwC0-"
    if (settings.LogLoginServer) then
        sendToDiscord(LoginLogoutLog,_U('server_disconnecting'), GetPlayerName(source) .. " " .. _('user_disconnecting') .. "(" .. reason .. ")", Config.grey)
    end
end)



-- Add event when a player give an item
--  TriggerEvent("esx:giveitemalert",sourceXPlayer.name,targetXPlayer.name,ESX.Items[itemName].label,itemCount) -> ESX_extended
RegisterServerEvent("esx:giveitemalert")
AddEventHandler("esx:giveitemalert", function(name, nametarget, itemname, amount)
    local GiveItemLog = "https://discordapp.com/api/webhooks/709109994783506444/0-yt2E-_7Yyt78vD6GQ5qdmsC0qeHg1Od7dgHxXsTC8q5JLZYwkWVeNr2MXVkkNjwC0-"
    if (settings.LogItemTransfer) then
        sendToDiscord(GiveItemLog,_U('server_item_transfer'), name .. _('user_gives_to') .. nametarget .. " " .. amount .. " " .. itemname, Config.orange)
    end
end)

-- Add event when a player give money
-- TriggerEvent("esx:givemoneyalert",sourceXPlayer.name,targetXPlayer.name,itemCount) -> ESX_extended
RegisterServerEvent("esx:givemoneyalert")
AddEventHandler("esx:givemoneyalert", function(name, nametarget, amount)
    local GiveMoneyLog = "https://discordapp.com/api/webhooks/709112056321671242/541x1PJPKRPMVHaSEtLCEW5M6Dsl6dzj2Ik_uNtqVGyEB-J56i8Pswf2eOKaqpq4_l-f"
    if (settings.LogMoneyTransfer) then
        sendToDiscord(GiveMoneyLog,_U('server_money_transfer'), name .. " " .. _('user_gives_to') .. " " .. nametarget .. " " .. amount .. " dollars", Config.orange)
    end
end)

-- Add event when a player give money
-- TriggerEvent("esx:givemoneyalert",sourceXPlayer.name,targetXPlayer.name,itemCount) -> ESX_extended
RegisterServerEvent("esx:givemoneybankalert")
AddEventHandler("esx:givemoneybankalert", function(name, nametarget, amount)
    local GiveMoneyLog = "https://discordapp.com/api/webhooks/709112056321671242/541x1PJPKRPMVHaSEtLCEW5M6Dsl6dzj2Ik_uNtqVGyEB-J56i8Pswf2eOKaqpq4_l-f"
    if (settings.LogMoneyBankTransfert) then
        sendToDiscord(GiveMoneyLog,_U('server_moneybank_transfer'), name .. " " .. _('user_gives_to') .. " " .. nametarget .. " " .. amount .. " dollars", Config.orange)
    end
end)


-- Add event when a player give weapon
--  TriggerEvent("esx:giveweaponalert",sourceXPlayer.name,targetXPlayer.name,weaponLabel) -> ESX_extended
RegisterServerEvent("esx:giveweaponalert")
AddEventHandler("esx:giveweaponalert", function(name, nametarget, weaponlabel)
    local WeaponLog = "https://discordapp.com/api/webhooks/709112738659434536/QrckUK6Tiv_MZ42VFQlWDY0e0eAmlKy6ZrttnG7iOxaeBwMtuuEPNFkL_2E1VLznQYIJ"
    if (settings.LogWeaponTransfer) then
        sendToDiscord(WeaponLog,_U('server_weapon_transfer'), name .. " " .. _('user_gives_to') .. " " .. nametarget .. " " .. weaponlabel, Config.orange)
    end
end)

-- Add event when a player is washing money
--  TriggerEvent("esx:washingmoneyalert",xPlayer.name,amount) -> ESX_society
RegisterServerEvent("esx:washingmoneyalert")
AddEventHandler("esx:washingmoneyalert", function(name, amount)
    local WeashLog = "https://discordapp.com/api/webhooks/709112850429247588/yEfYD0f_kOYLcTO5xoDEq-riMxrjnJfaPpDXEJUO5RqrXi9T6KvAb2Kptgi0iL2B3G4C"
    sendToDiscord(WeashLog,_U('server_washingmoney'), name .. " " .. _('user_washingmoney') .. " " .. amount .. " dollars", Config.orange)
end)

-- Event when a player is in a blacklisted vehicle
RegisterServerEvent("esx:enterblacklistedcar")
AddEventHandler("esx:enterblacklistedcar", function(model)
    local BlackListCar = "https://discordapp.com/api/webhooks/709112936953675786/gzNkICAIhfVwroCQWhujQrRlE8qDP3tgTC9ZnWipbl9jTnDXMC1vNEx4xZY7EMRPXUnb"
    local xPlayer = ESX.GetPlayerFromId(source)
    sendToDiscord(BlackListCar,_U('server_blacklistedvehicle'), xPlayer.name .. " " .. _('user_entered_in') .. " " .. model, Config.red)
end)


-- Event when a player (not policeman) is in a police vehicle
RegisterServerEvent("esx:enterpolicecar")
AddEventHandler("esx:enterpolicecar", function(model)
    local xPlayer = ESX.GetPlayerFromId(source)
    local policeCar = "https://discordapp.com/api/webhooks/709113020697149481/7eGwpUpGUlbOr8ZcqgfZrELBCv_FWjrLO6QWhofy1l_spFsJv7__E5jPfafUo7Wb8TkF"
    sendToDiscord(policeCar,_U('server_policecar'), xPlayer.name .. " " .. _('user_entered_in') .. " " .. model, Config.blue)
end)


-- Event when a player is jacking a car
RegisterServerEvent("esx:jackingcar")
AddEventHandler("esx:jackingcar", function(model)
    local JackCar = "https://discordapp.com/api/webhooks/709113134618771537/U7POdbKpLso22akS2Y2h-NZiLqm_OkKnEdd9xTV7WxCA5t8_nm5ZHNKMQJabde71n15f"
    local xPlayer = ESX.GetPlayerFromId(source)
    sendToDiscord(JackCar,_U('server_carjacking'), xPlayer.name .. " " .. _('user_carjacking') .. " " .. model, Config.purple)
end)


-- Event when a player is killing an other one

RegisterServerEvent('esx:killerlog')
AddEventHandler('esx:killerlog', function(t, killer, kilerT) -- t : 0 = NPC, 1 = player
    local KillerLog = "https://discordapp.com/api/webhooks/709113225039577180/WtqtSu6hOuU5Ge1VKEugzX3LVqPSafqWjFeLHE5AkG0PBCso3gS9BomqNGj62Q_mIUdu"
    local xPlayer = ESX.GetPlayerFromId(source)
    if (t == 1) then
        local xPlayer = ESX.GetPlayerFromId(source)
        local xPlayerKiller = ESX.GetPlayerFromId(killer)

        if (xPlayerKiller.name ~= nil and xPlayer.name ~= nil) then

            if (kilerT.killerinveh) then
                local model = kilerT.killervehname

                sendToDiscord(KillerLog,_U('server_kill'), xPlayer.name .. " " .. _('user_kill') .. " " .. xPlayerKiller.name .. " " .. _('with') .. " " .. model, Config.red)



            else
                sendToDiscord(KillerLog,_U('server_kill'), xPlayer.name .. " " .. _('user_kill') .. " " .. xPlayerKiller.name, Config.red)
            end
        end
    else
        sendToDiscord(KillerLog,_U('server_kill'), xPlayer.name .. " " .. _('user_kill_environnement'), Config.red)
    end
end)
