ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function getIdentity(source)
    local identifier = GetPlayerIdentifiers(source)[1]
    local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {['@identifier'] = identifier})
    if result[1] ~= nil then
        local identity = result[1]
        return identity
    else
        return nil
    end
end


ESX.RegisterServerCallback('esx_phone:getItemAmount', function(source, cb, item)
    local xPlayer = ESX.GetPlayerFromId(source)
    local qtty = xPlayer.getInventoryItem(item).count
    cb(qtty)
end)

RegisterServerEvent('esx_dowod:dajitemOdznaka')
AddEventHandler('esx_dowod:dajitemOdznaka', function()
	local XPlayer = ESX.GetPlayerFromId(source)

	local qtty = XPlayer.getInventoryItem('odznaka').count
	if qtty > 1 then
		XPlayer.removeInventoryItem('odznaka', 1)

	elseif qtty < 1 then
		XPlayer.addInventoryItem('odznaka', 1)
	end
end)

ESX.RegisterUsableItem('odznaka', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local job = xPlayer.job
	local name = getIdentity(source)
	local czy_wazna
	if job.name == "police" then
		czy_wazna = "~g~Tak"
	else
		job.grade_label = "~r~Brak informacji"
		czy_wazna = "~r~Nie"
	end
	TriggerClientEvent('esx:dowod_pokazOdznake', -1,_source, '~h~'..name.firstname..' '..name.lastname, 'Odznaka LSPD' , 'Stopień ~b~'..job.grade_label..'~s~~n~Odznaka jest ważna '..czy_wazna)
end)
