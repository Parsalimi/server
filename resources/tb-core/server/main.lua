TBCore						= {}
TBCore.Items 				= {}
TBCore.Players				= {}
TBCore.PlayerInventory 		= {}
TBCore.lastPosition         = {}
TBCore.ServerCallbacks 		= {}
TBCore.Pickups              = {}
TBCore.PickupId             = 0

RegisterServerEvent('tb-core:server:getObject')
AddEventHandler('tb-core:server:getObject', function(callback)
	callback(TBCore)
end)

Citizen.CreateThread(function()
	ItemsLoaded = false
	while true do
		Citizen.Wait(0)
		if not ItemsLoaded then
			local items = TBConfig.InventoryItems
			for i=1, #items, 1 do
				TBCore.Items[items[i].name] = {
					name 		= items[i].name,
					label 		= items[i].label,
					type 		= items[i].type,
					usable 		= items[i].usable,
					label 		= items[i].label,
					weight 		= items[i].weight,
					stackable   = items[i].stackable,
					description = items[i].description,
				}
			end

			print('[^2TBCore^7] Items are successfully loaded!')

			ItemsLoaded = true
		end
	end
end)

RegisterServerEvent('tb-core:server:useItem')
AddEventHandler('tb-core:server:useItem', function(item)
	local pData = TBCore.Functions.getPlayer(source)

	if item.usable then
		TBCore.Functions.UseItem(source, item.name)
	else
		print('joee')
	end
end)



RegisterServerEvent('tb-core:server:PlayerJoin')
AddEventHandler('tb-core:server:PlayerJoin', function()
	local src = source
	Citizen.CreateThread(function()
		local identifier = GetPlayerIdentifiers(src)[1]
		local license = GetPlayerIdentifiers(src)[2]

		if not identifier then
			TBCore.Functions.dropPlayer(src, "[TBCore] SteamID not found, try reconnecting with Steam open.")
		end

		return
	end)
end)

AddEventHandler('playerDropped', function()
	local player 		= TBCore.Functions.getPlayer(source)
	if player then
		local identifier 	= player.Data.identifier

		TBCore.DB.SavePlayer(source, identifier, TBCore.lastPosition[source])

		TBCore.Players[source] = nil
	end
end)

AddEventHandler('tb-core:server:doesUserExist', function(identifier, callback)
	exports['ghmattimysql']:execute('SELECT * FROM players WHERE identifier = @identifier', {['@identifier'] = identifier}, function(users)
		if users[1] then
			callback(true)
		else
			callback(false)
		end
	end)
end)

RegisterServerEvent('tb-core:server:addMessage')
AddEventHandler('tb-core:server:addMessage', function(type, target, prefix, author, message)
	TBCore.Functions.addMessage(type, target, prefix, author, message)
end)

RegisterServerEvent('tb-core:client:refreshPlayer')
AddEventHandler('tb-core:client:refreshPlayer', function(pData)
	local src = source
	TBCore.Functions.LoadPlayer(src, pData, "refresh")
end)

AddEventHandler('tb-core:server:addCommand', function(command, callback, suggestion, arguments)
	TBCore.Functions.addCommand(command, callback, suggestion, arguments)
end)

AddEventHandler('tb-core:server:addGroupCommand', function(command, group, callback, callbackfailed, suggestion, arguments)
	TBCore.Functions.addGroupCommand(command, group, callback, callbackfailed, suggestion, arguments)
end)

RegisterServerEvent('tb-core:server:triggerServerCallback')
AddEventHandler('tb-core:server:triggerServerCallback', function(name, requestId, ...)
	local _source = source

	TBCore.Functions.TriggerServerCallback(name, requestID, _source, function(...)
		TriggerClientEvent('tb-core:client:serverCallback', _source, requestId, ...)
	end, ...)
end)

RegisterServerEvent('tb-core:server:removeInventoryItem')
AddEventHandler('tb-core:server:removeInventoryItem', function(type, itemName, itemAmount, itemData)
	local src = source

	local pData = TBCore.Functions.getPlayer(src)

	if type == 'item' then
		local itemData = pData.getInventoryItem(itemName)
		if (itemAmount > itemData.amount) then
			print('snirker')
		else
			pData.removeInventoryItem(itemName, itemAmount)
			TBCore.Functions.CreatePickup('item', itemName, itemAmount, itemData.label, src)
		end
	elseif type == 'weapon' then
		pData.removeInventoryWeapon(itemName, itemData.weaponid)
		TBCore.Functions.CreatePickup('weapon', itemName, itemData.amount, itemData.label, src)
	end
end)

RegisterServerEvent('tb-core:server:removeUsedItem')
AddEventHandler('tb-core:server:removeUsedItem', function(itemName, amount)
	local src = source

	local pData = TBCore.Functions.getPlayer(src)
	pData.removeInventoryItem(itemName, amount)
end)

RegisterServerEvent('tb-core:server:onPickup')
AddEventHandler('tb-core:server:onPickup', function(id)
	local src 		= source
	local pickup  	= TBCore.Pickups[id]
	local pData 	= TBCore.Functions.getPlayer(src)

	if pickup.type == 'item' then
		local item      = pData.getInventoryItem(pickup.name)
		TriggerClientEvent('tb-inventory:client:addItem', src, pickup.name, pickup.label)
		TriggerClientEvent('tb-core:client:removePickup', -1, id)
		pData.Functions.giveItem(pickup.name, pickup.count)
	elseif pickup.type == 'weapon' then
		TriggerClientEvent('tb-inventory:client:addItem', src, pickup.name, pickup.label)
		TriggerClientEvent('tb-core:client:removePickup', -1, id)
		pData.Functions.giveWeapon(pickup.name, pickup.count)
	end
end)