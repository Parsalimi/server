ESX = nil
local FuelHandeler

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

exports.ghmattimysql:execute('SELECT * FROM capture WHERE name = "fuel"', {}
, function(fuel)
	FuelHandeler = 'gang_' .. string.lower(fuel[1].handeler)
end)

RegisterServerEvent('fuel:ChangeHandeler')
AddEventHandler('fuel:ChangeHandeler', function(newHandler)
	FuelHandeler = 'gang_' .. string.lower(newHandler)
	exports.ghmattimysql:execute('UPDATE capture SET handeler = @handeler WHERE name = "fuel"', {
		['@handeler']	= newHandler
	})
end)

RegisterServerEvent('fuel:pay')
AddEventHandler('fuel:pay', function(price)
	local xPlayer = ESX.GetPlayerFromId(source)
	local amount = ESX.Math.Round(price)

	if price > 0 then
		xPlayer.removeMoney(amount)
		-- TriggerEvent('gangaccount:getGangAccount', FuelHandeler, function(account)
		-- 	account.addMoney(amount)
		-- end)
	end
end)
