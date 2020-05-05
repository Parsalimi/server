ESX = nil
gangs = {}
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('gangprop:giveWeapon')
AddEventHandler('gangprop:giveWeapon', function(weapon, ammo)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addWeapon(weapon, ammo)
end)

RegisterServerEvent("gangprop:setArmor")
AddEventHandler("gangprop:setArmor", function()

  local xPlayer = ESX.GetPlayerFromId(source)
  
  if xPlayer.money >= 8000 then

    xPlayer.removeMoney(8000)
    TriggerClientEvent('setArmorHandler', source)
    TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, " ^0Shoma ba movafaghiat armor poshidid!")

  else
    TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, " ^0Shoma pol kafi baraye kharid jelighe zed golule nadarid gheymat jelighe ^220000$ ^0ast!")
  end

end)

ESX.RegisterServerCallback('gangprop:carAvalible', function(source, cb, plate)
  exports.ghmattimysql:scalar('SELECT `stored` FROM `owned_vehicles` WHERE plate = @plate', {
    ['@plate']  = plate
  }, function(stored)
      cb(stored)
  end)
end)

ESX.RegisterServerCallback('gangprop:getCars', function(source, cb)
	local ownedCars = {}
  local xPlayer = ESX.GetPlayerFromId(source)

  MySQL.Async.fetchAll('SELECT * FROM `owned_vehicles` WHERE owner = @player OR LOWER(owner) = @gang AND type = \'car\' AND @stored = @stored', {
    ['@player']  = xPlayer.identifier,
    ['@gang']    = string.lower(xPlayer.gang.name),
    ['@stored']  = true
  }, function(data)
    for _,v in pairs(data) do
      local vehicle = json.decode(v.vehicle)
      table.insert(ownedCars, {vehicle = vehicle, stored = v.stored, plate = v.plate})
    end
    cb(ownedCars)
  end)
end)

RegisterServerEvent('gangprop:handcuff')
AddEventHandler('gangprop:handcuff', function(target)
    TriggerClientEvent('gangprop:handcuff', target)
end)

RegisterServerEvent('gangprop:drag')
AddEventHandler('gangprop:drag', function(target)
    local _source = source
    TriggerClientEvent('gangprop:drag', target, _source)
end)

RegisterServerEvent('gangprop:putInVehicle')
AddEventHandler('gangprop:putInVehicle', function(target)
    TriggerClientEvent('gangprop:putInVehicle', target)
end)

RegisterServerEvent('gangprop:OutVehicle')
AddEventHandler('gangprop:OutVehicle', function(target)
    TriggerClientEvent('gangprop:OutVehicle', target)
end)


RegisterServerEvent('gangprop:stealPlayerItem')
AddEventHandler('gangprop:stealPlayerItem', function(target, itemType, itemName, amount)
	local _source 		= source
	local sourceXPlayer = ESX.GetPlayerFromId(_source)
	local targetXPlayer = ESX.GetPlayerFromId(target)
	local oocname 		=  GetPlayerName(source)
	local targetName 	=  GetPlayerName(target)

	if not targetXPlayer then
		return
	end 

	if true then
		--and not (targetXPlayer.getGroup() == 'admin' or targetXPlayer.getGroup() == 'superadmin')
		if itemType == 'item_standard' then
			local label = sourceXPlayer.getInventoryItem(itemName).label
			local itemLimit = sourceXPlayer.getInventoryItem(itemName).limit
			local sourceItemCount = sourceXPlayer.getInventoryItem(itemName).count
			local targetItemCount = targetXPlayer.getInventoryItem(itemName).count
			if amount > 0 and targetItemCount >= amount then
				if itemLimit ~= -1 and (sourceItemCount + amount) > itemLimit then
					TriggerClientEvent('esx:showNotification', targetXPlayer.source, 'Jaye khali nadari')
					TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Taraf jaye khali nadare')
				else
					targetXPlayer.removeInventoryItem(itemName, amount)
					sourceXPlayer.addInventoryItem(itemName, amount)

					TriggerEvent('DiscordBot:ToDiscord', 'loot', oocname, 'Stole '..amount ..'X '.. itemName .. ' from ' .. targetName,'user', true, source, false)
					TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'To az taraf ~g~x' .. amount .. ' ' .. label .. ' ~w~ dozdidi' )
					TriggerClientEvent('esx:showNotification', targetXPlayer.source, 'Yeki dozdi kard azat ~r~x'  .. amount .. ' ' .. label )

				end
			else
				TriggerClientEvent('esx:showNotification', _source, "Tedade eshtebah")
			end

		elseif itemType == 'item_money' then

			if amount > 0 and targetXPlayer.get('money') >= amount then
				targetXPlayer.removeMoney(amount)
				sourceXPlayer.addMoney(amount)

				TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'To az taraf ~g~$' .. amount .. ' ~w~ dozdidi' )
				TriggerClientEvent('esx:showNotification', targetXPlayer.source, 'Yeki dozdi kard azat' .. ' ~r~$'  .. amount )
				TriggerEvent('DiscordBot:ToDiscord', 'loot', oocname, 'Stole '..amount ..'$ from ' .. targetName,'user', true, source, false)
			else
				TriggerClientEvent('esx:showNotification', _source, "~r~:(")
			end

		elseif itemType == 'item_weapon' then
			local ammo = targetXPlayer.hasWeapon(itemName)

			if ammo then
				targetXPlayer.removeWeapon(itemName, ammo)
				sourceXPlayer.addWeapon(itemName, ammo)
		
				TriggerClientEvent('esx:showNotification', sourceXPlayer.source,'To az taraf ~g~x' .. ammo .. ' ' .. itemName .. ' ~w~ dozdidi' )
				TriggerClientEvent('esx:showNotification', targetXPlayer.source, 'Yeki dozdi kard azat' .. ' ~r~x'  .. ammo .. ' ' .. itemName )
				TriggerEvent('DiscordBot:ToDiscord', 'loot', oocname, 'Stole '.. itemName .. ' with ' .. ammo .. ' bullets from ' .. targetName,'user', true, source, false)
			end
		end 
	else
		TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Shoma Nemitonid in player ro robb konid. ~r~Qavanine robb ro bekhonid !')
	end
end)


ESX.RegisterServerCallback('gangprop:getOtherPlayerData', function(source, cb, target)
	local xPlayer = ESX.GetPlayerFromId(target)

	local data = {
		name 		= GetPlayerName(target),
		job 		= xPlayer.job.name,
		inventory 	= xPlayer.inventory,
		accounts 	= xPlayer.accounts,
		money 		= xPlayer.money,
		weapons		= xPlayer.loadout
	}

	cb(data)
end)