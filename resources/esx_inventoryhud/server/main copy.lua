ESX = nil
local KeyItems = {}
local HouseItems = {}
local AccessoriesItems = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_inventoryhud:getOwnerVehicle')
AddEventHandler('esx_inventoryhud:getOwnerVehicle', function()

	local xPlayer = ESX.GetPlayerFromId(source)

	KeyItems = MySQL.Sync.fetchAll('SELECT * FROM owned_vehicles WHERE owner = @identifier', {
		['@identifier'] = xPlayer.identifier
	})

end)

RegisterServerEvent('esx_inventoryhud:getOwnerHouse')
AddEventHandler('esx_inventoryhud:getOwnerHouse', function()

	local xPlayer = ESX.GetPlayerFromId(source)

	HouseItems = MySQL.Sync.fetchAll('SELECT * FROM owned_properties WHERE owner = @identifier', {
		['@identifier'] = xPlayer.identifier
	})

end)

RegisterServerEvent('esx_inventoryhud:updateKey')
AddEventHandler('esx_inventoryhud:updateKey', function(target, type, itemName)

	local _source = source

	local sourceXPlayer = ESX.GetPlayerFromId(_source)
	local targetXPlayer = ESX.GetPlayerFromId(target)

	local identifier = GetPlayerIdentifiers(source)[1]
	local identifier_target = GetPlayerIdentifiers(target)[1]
	if type == "item_key" then -- MEETA GiveKey

		MySQL.Async.execute("UPDATE owned_vehicles SET owner = @newplayer, buyer = @newplayer WHERE owner = @identifier AND plate = @plate",
		{
			['@identifier']		= identifier,
			['@newplayer']		= identifier_target,
			['@plate']		= itemName
		})
		
		TriggerClientEvent("pNotify:SendNotification", source, {
			text = 'ส่ง <strong class="amber-text">กุญแจรถ</strong> ทะเบียน <strong class="yellow-text">'..itemName..'</strong> ให้คุณ <strong class="green-text">'.. targetXPlayer.name ..'</strong>',
			type = "success",
			timeout = 3000,
			layout = "bottomCenter",
			queue = "global"
		})
		TriggerClientEvent("pNotify:SendNotification", target, {
			text = 'ได้รับ <strong class="amber-text">กุญแจรถ</strong> ทะเบียน <strong class="yellow-text">'..itemName..'</strong> จากคุณ <strong class="green-text">'.. sourceXPlayer.name ..'</strong>',
			type = "success",
			timeout = 3000,
			layout = "bottomCenter",
			queue = "global"
		})
		
		TriggerClientEvent("esx_trunk_inventory:getOwnedVehicule", source)
		TriggerClientEvent("esx_trunk_inventory:getOwnedVehicule", target)
		
	elseif type == "item_keyhouse" then -- MEETA GiveKeyHouse

		MySQL.Async.execute("UPDATE owned_properties SET owner = @newplayer WHERE owner = @identifier AND id = @id",
		{
			['@identifier']		= identifier,
			['@newplayer']		= identifier_target,
			['@id']		= itemName
		})

		TriggerClientEvent("pNotify:SendNotification", source, {
			text = 'ส่ง <strong class="amber-text">กุญแจบ้าน</strong> ให้คุณ <strong class="green-text">'.. targetXPlayer.name ..'</strong>',
			type = "success",
			timeout = 3000,
			layout = "bottomCenter",
			queue = "global"
		})
		TriggerClientEvent("pNotify:SendNotification", target, {
			text = 'ได้รับ <strong class="amber-text">กุญแจบ้าน</strong> จากคุณ <strong class="green-text">'.. sourceXPlayer.name ..'</strong>',
			type = "success",
			timeout = 3000,
			layout = "bottomCenter",
			queue = "global"
		})

	end
end)

ESX.RegisterServerCallback("esx_inventoryhud:getPlayerInventory", function(source, cb, target, data)

	local targetXPlayer = ESX.GetPlayerFromId(target)
	local Inventory = targetXPlayer.inventory

	if data == nil then
		if targetXPlayer ~= nil then
			cb({inventory = Inventory, money = targetXPlayer.getMoney(), accounts = targetXPlayer.accounts, weapons = targetXPlayer.loadout})
		else
			cb(nil)
		end
	else

		if data.vehicle == true then
			for i=1, #KeyItems, 1 do
				table.insert(Inventory, {
					label = KeyItems[i].plate,
					count = 1,
					limit = -1,
					type = "item_key",
					name = "key",
					usable = true,
					rare = false,
					canRemove = false
				})
			end
		end

		if data.house == true then
			for i=1, #HouseItems, 1 do
				table.insert(Inventory, {
					label = HouseItems[i].name,
					count = 1,
					limit = -1,
					type = "item_keyhouse",
					name = "keyhouse",
					usable = false,
					rare = false,
					canRemove = false,
					house_id = HouseItems[i].id
				})
			end
		end

		if targetXPlayer ~= nil then
			cb({inventory = Inventory, money = targetXPlayer.getMoney(), accounts = targetXPlayer.accounts, weapons = targetXPlayer.loadout})
		else
			cb(nil)
		end

		-- MySQL.Async.fetchAll("SELECT * FROM owned_vehicles WHERE owner = @identifier", {
		-- 	['@identifier'] = targetXPlayer.identifier
		-- }, function(result)

		-- 	if data.vehicle == true then

		-- 		for i=1, #result, 1 do
		-- 			table.insert(Inventory, {
		-- 				label = result[i].plate,
		-- 				count = 1,
		-- 				limit = -1,
		-- 				type = "item_key",
		-- 				name = "key",
		-- 				usable = true,
		-- 				rare = false,
		-- 				canRemove = false
		-- 			})
		-- 		end

		-- 	end

		-- 	if data.house == true then

		-- 		local result_house = MySQL.Sync.fetchAll('SELECT * FROM owned_properties WHERE owner = @identifier', {
		-- 			['@identifier'] = targetXPlayer.identifier
		-- 		})

		-- 		for i=1, #result_house, 1 do
		-- 			table.insert(Inventory, {
		-- 				label = result_house[i].name,
		-- 				count = 1,
		-- 				limit = -1,
		-- 				type = "item_keyhouse",
		-- 				name = "keyhouse",
		-- 				usable = false,
		-- 				rare = false,
		-- 				canRemove = false,
		-- 				house_id = result_house[i].id
		-- 			})
		-- 		end

		-- 	end

		-- 	-- Accessories Helmet
		-- 	TriggerEvent('esx_datastore:getDataStore', 'user_helmet', targetXPlayer.identifier, function(store)
		-- 		local hasAccessory = (store.get('hasHelmet') and store.get('hasHelmet') or false)
		-- 		local skin = (store.get('skin') and store.get('skin') or {})
		-- 		if hasAccessory then

		-- 			table.insert(Inventory, {
		-- 				label = "หมวก",
		-- 				count = 1,
		-- 				limit = -1,
		-- 				type = "item_accessories",
		-- 				name = "helmet",
		-- 				usable = true,
		-- 				rare = false,
		-- 				canRemove = false,
		-- 				itemnum = skin["helmet_1"],
		-- 				itemskin = skin["helmet_2"]
		-- 			})

		-- 		end
		-- 	end)

		-- 	-- Accessories Mask
		-- 	TriggerEvent('esx_datastore:getDataStore', 'user_mask', targetXPlayer.identifier, function(store)
		-- 		local hasAccessory = (store.get('hasMask') and store.get('hasMask') or false)
		-- 		local skin = (store.get('skin') and store.get('skin') or {})
		-- 		if hasAccessory then

		-- 			table.insert(Inventory, {
		-- 				label = "หน้ากาก",
		-- 				count = 1,
		-- 				limit = -1,
		-- 				type = "item_accessories",
		-- 				name = "mask",
		-- 				usable = true,
		-- 				rare = false,
		-- 				canRemove = false,
		-- 				itemnum = skin["mask_1"],
		-- 				itemskin = skin["mask_2"]
		-- 			})

		-- 		end
		-- 	end)

		-- 	-- Accessories Glasses
		-- 	TriggerEvent('esx_datastore:getDataStore', 'user_glasses', targetXPlayer.identifier, function(store)
		-- 		local hasAccessory = (store.get('hasGlasses') and store.get('hasGlasses') or false)
		-- 		local skin = (store.get('skin') and store.get('skin') or {})
		-- 		if hasAccessory then

		-- 			table.insert(Inventory, {
		-- 				label = "แว่นตา",
		-- 				count = 1,
		-- 				limit = -1,
		-- 				type = "item_accessories",
		-- 				name = "glasses",
		-- 				usable = true,
		-- 				rare = false,
		-- 				canRemove = false,
		-- 				itemnum = skin["glasses_1"],
		-- 				itemskin = skin["glasses_2"]
		-- 			})

		-- 		end
		-- 	end)

		-- 	-- Accessories Earring
		-- 	TriggerEvent('esx_datastore:getDataStore', 'user_ears', targetXPlayer.identifier, function(store)
		-- 		local hasAccessory = (store.get('hasEars') and store.get('hasEars') or false)
		-- 		local skin = (store.get('skin') and store.get('skin') or {})
		-- 		if hasAccessory then

		-- 			table.insert(Inventory, {
		-- 				label = "ตุ้มหู",
		-- 				count = 1,
		-- 				limit = -1,
		-- 				type = "item_accessories",
		-- 				name = "earring",
		-- 				usable = true,
		-- 				rare = false,
		-- 				canRemove = false,
		-- 				itemnum = skin["ears_1"],
		-- 				itemskin = skin["ears_2"]
		-- 			})

		-- 		end
		-- 	end)

		-- 	if targetXPlayer ~= nil then
		-- 		cb({inventory = targetXPlayer.inventory, money = targetXPlayer.getMoney(), accounts = targetXPlayer.accounts, weapons = targetXPlayer.loadout})
		-- 	else
		-- 		cb(nil)
		-- 	end
		-- end)
	end

	--print("USER:"..targetXPlayer.identifier.." Open Inventory!")

end)