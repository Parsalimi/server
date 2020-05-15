ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) 
	ESX = obj 
end)

function GetProperty(name)
	for i=1, #Config.Properties, 1 do
		if Config.Properties[i].name == name then
			return Config.Properties[i]
		end
	end
end

ESX.RegisterServerCallback("meeta_house:getHouseInventory", function(source, cb, name)

	MySQL.Async.fetchAll("SELECT * FROM owned_properties WHERE name = @name", {
		['@name'] = name
	}, function(result)

		if result[1] ~= nil then
			cb({result = true, data = result[1]})
		else
			cb({result = false})
		end
	end)
end)

ESX.RegisterServerCallback('meeta_house:getOwnedPropertiesByHouseName', function(source, cb, name)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.fetchAll('SELECT * FROM owned_properties WHERE name = @name AND owner = @owner', {
		['@name'] = name,
		['@owner'] = xPlayer.identifier
	}, function(ownedProperties)
		if ownedProperties[1] then
			local countVehicle = MySQL.Sync.fetchScalar("SELECT COUNT(1) FROM owned_vehicles WHERE properties = @id AND owner = @owner", {
				['@id'] = ownedProperties[1].id,
				['@owner'] = xPlayer.identifier
			})

			local data = {
				id = ownedProperties[1].id,
				count = countVehicle
			}
			
			cb(data)
		else
			cb(nil)
		end
	end)
end)

ESX.RegisterServerCallback('meeta_house:getAllProperties', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.fetchAll('SELECT * FROM owned_properties', {
		--['@owner'] = xPlayer.identifier
	}, function(ownedProperties)
		local properties = {}

		for i=1, #ownedProperties, 1 do
			table.insert(properties, { 
				name = ownedProperties[i].name,
				owner = ownedProperties[i].owner,
				islock = ownedProperties[i].islock
			})
		end

		cb(properties)
	end)
end)

ESX.RegisterServerCallback('meeta_house:getOwnedProperties', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.fetchAll('SELECT * FROM owned_properties WHERE owner = @owner', {
		['@owner'] = xPlayer.identifier
	}, function(ownedProperties)
		local properties = {}

		for i=1, #ownedProperties, 1 do
			table.insert(properties, ownedProperties[i].name)
		end

		cb(properties)
	end)
end)

ESX.RegisterServerCallback("meeta_house:getVehicleGarage", function(source, cb, target, name)
	local targetXPlayer = ESX.GetPlayerFromId(target)
	local Inventory = targetXPlayer.inventory

	local ped = GetPlayerIdentifiers(target)[1]	
	local vehicles = {}

	MySQL.Async.fetchAll("SELECT * FROM owned_properties WHERE name = @name AND owner = @identifier", {
		['@identifier'] = ped,
		['@name'] = name
	}, function(result)

		MySQL.Async.fetchAll("SELECT * FROM owned_vehicles WHERE state = true AND properties = @id", {
			['@id'] = result[1].id,
		}, function(result_garage)

			for _,v in pairs(result_garage) do
				table.insert(vehicles, {vehicle = v.vehicle, fourrieremecano = v.fourrieremecano, vehiclename =  v.vehiclename, plate = v.plate})
			end

			cb(vehicles)

		end)
	end)
end)

ESX.RegisterServerCallback("meeta_house:getHouseOwner", function(source, cb, target, name)
	local targetXPlayer = ESX.GetPlayerFromId(target)
	local Inventory = targetXPlayer.inventory

	local ped = GetPlayerIdentifiers(target)[1]	

	MySQL.Async.fetchAll("SELECT * FROM owned_properties WHERE name = @name AND owner = @identifier", {
		['@identifier'] = ped,
		['@name'] = name
	}, function(result)

		if result[1] ~= nil then
			TriggerClientEvent('meeta_house:setPropertyOwned', source, name, true)
			cb({result = true, data = result[1]})
		else
			cb({result = false})
		end
	end)
end)

ESX.RegisterServerCallback("meeta_house:getInventory", function(source, cb, id)
    MySQL.Async.fetchAll("SELECT * FROM properties_inventory WHERE propertie_id = @id", {
		['@id'] = id
	}, function(result)

		local blackMoney = 0
		local cash = 0
		local items = {}
		local weapons = {}
		
		if result ~= nil then

			for i = 1, #result, 1 do
				-- Load Items

				if result[i].item ~= "cash" and result[i].isweapon == 0 then

					table.insert(items, {name = result[i].item, count = result[i].count, label = ESX.GetItemLabel(result[i].item)})

				end
				-- Load Black Money
				if result[i].item == "black_money" and result[i].count > 0 and result[i].isweapon == 0 then
					blackMoney = result[i].count
				end

				if result[i].item == "cash" and result[i].count > 0 and result[i].isweapon == 0 then
					cash = result[i].count
				end

				if result[i].isweapon == 1 then
					local weaponHash = GetHashKey(result[i].item)
					if result[i].item ~= "WEAPON_UNARMED" then
						table.insert(
							weapons,
							{
								id = result[i].id,
								label = result[i].label_weapon,
								count = result[i].count,
								limit = -1,
								type = "item_weapon",
								name = result[i].item,
								usable = false,
								rare = false,
								canRemove = false
							}
						)
					end
				end

			end

			cb(
				{
					cash = cash,
					blackMoney = blackMoney,
					items = items,
					weapons = weapons
				}
			)
		else
			cb({result = false})
		end
	end)
end)

function SetPropertyOwned(name, price, rented, owner)
	MySQL.Async.execute('INSERT INTO owned_properties (name, price, rented, owner) VALUES (@name, @price, @rented, @owner)', {
		['@name']   = name,
		['@price']  = price,
		['@rented'] = (rented and 1 or 0),
		['@owner']  = owner
	}, function(rowsChanged)
		local xPlayer = ESX.GetPlayerFromIdentifier(owner)

		if xPlayer then
			TriggerClientEvent('meeta_house:setPropertyOwned', xPlayer.source, name, true)

			if rented then
				TriggerClientEvent('esx:showNotification', xPlayer.source, _U('rented_for', ESX.Math.GroupDigits(price)))
			else
				--TriggerClientEvent('esx:showNotification', xPlayer.source, _U('purchased_for', ESX.Math.GroupDigits(price)))
				TriggerClientEvent("pNotify:SendNotification", xPlayer.source, {
					text = '<strong class="green-text">ซื้อบ้านเรียบร้อยแล้ว ราคา : ' ..ESX.Math.GroupDigits(price).."</strong>",
					type = "success",
					timeout = 3000,
					layout = "bottomCenter",
					queue = "global"
				})
				TriggerClientEvent("esx_inventoryhud:getOwnerHouse", source)
			end
		end
	end)
end

RegisterServerEvent('meeta_house:buyProperty')
AddEventHandler('meeta_house:buyProperty', function(propertyName)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	local property = GetProperty(propertyName)
	
	if property.price <= xPlayer.getMoney() then
		MySQL.Async.fetchAll("SELECT * FROM owned_properties WHERE name = @name", {
			['@name'] = property.name
		}, function(result)
			if result[1] then
				TriggerClientEvent("pNotify:SendNotification", _source, {
					text = '<strong class="red-text">บ้านหลังนี้มีผู้อื่นซื้อแล้ว</span>',
					type = "error",
					timeout = 3000,
					layout = "bottomCenter",
					queue = "global"
				  })
			else

				if not property.job then
					xPlayer.removeMoney(property.price)
					TriggerClientEvent("esx_inventoryhud:getOwnerHouse", _source)
					SetPropertyOwned(propertyName, property.price, false, xPlayer.identifier)
				else
					local found = false
					for k,v in pairs(property.job) do
						if xPlayer.job.name == v then
							found = true
							break
						end
					end
					if found then
						xPlayer.removeMoney(property.price)
						TriggerClientEvent("esx_inventoryhud:getOwnerHouse", _source)
						SetPropertyOwned(propertyName, property.price, false, xPlayer.identifier)
					else
						TriggerClientEvent("pNotify:SendNotification", _source, {
							text = '<strong class="red-text">คุณไม่มีสิทธิ์ซื้อบ้านหลังนี้ได้</span>',
							type = "error",
							timeout = 3000,
							layout = "bottomCenter",
							queue = "global"
						  })
					end
				end
			end
		end)
	else
		TriggerClientEvent("pNotify:SendNotification", _source, {
			text = '<strong class="red-text">เงินไม่เพียงพอ</span>',
			type = "error",
			timeout = 3000,
			layout = "bottomCenter",
			queue = "global"
		  })
	end
end)

RegisterServerEvent("meeta_house:reloadInventory")
AddEventHandler("meeta_house:reloadInventory", function(cb, id)
	MySQL.Async.fetchAll("SELECT * FROM properties_inventory WHERE propertie_id = @id", {
		['@id'] = id
	}, function(result)

		local blackMoney = 0
		local cash = 0
		local items = {}
		local weapons = {}
		
		if result ~= nil then

			for i = 1, #result, 1 do
				-- Load Items
				if result[i].item ~= "cash" and result[i].isweapon == 0 then

					table.insert(items, {name = result[i].item, count = result[i].count, label = ESX.GetItemLabel(result[i].item)})

				end
				-- Load Black Money
				if result[i].item == "black_money" and result[i].count > 0 and result[i].isweapon == 0 then
					blackMoney = result[i].count
				end

				if result[i].item == "cash" and result[i].count > 0 and result[i].isweapon == 0 then
					cash = result[i].count
				end

				if result[i].isweapon == 1 then
					local weaponHash = GetHashKey(result[i].item)
					if result[i].item ~= "WEAPON_UNARMED" then
						table.insert(
							weapons,
							{
								id = result[i].id,
								label = result[i].label_weapon,
								count = result[i].count,
								limit = -1,
								type = "item_weapon",
								name = result[i].item,
								usable = false,
								rare = false,
								canRemove = false
							}
						)
					end
				end
			end

			cb(
				{
					cash = cash,
					blackMoney = blackMoney,
					items = items,
					weapons = weapons
				}
			)
		else
			cb({result = false})
		end

	end)
end)

RegisterServerEvent('meeta_house:putItem')
AddEventHandler('meeta_house:putItem', function(id, type, name, count, label)
	local xPlayer = ESX.GetPlayerFromId(source)
	local count = count
	if count > 2147483647 then
		count = 2147483647
	end
	
	if type == "item_standard" then 
		local xItem = xPlayer.getInventoryItem(name)
		if xItem == nil then
			TriggerClientEvent("pNotify:SendNotification", xPlayer.source, {
				text = '<strong class="red-text">คุณไม่มีไอเทมนี้</strong>',
				type = "error",
				timeout = 3000,
				layout = "bottomCenter",
				queue = "global"
			})
		elseif xItem.count < count then
			TriggerClientEvent("pNotify:SendNotification", xPlayer.source, {
				text = '<strong class="red-text">'..label..' จำนวนไม่ถูกต้อง</strong>',
				type = "error",
				timeout = 3000,
				layout = "bottomCenter",
				queue = "global"
			})
		else
			
			MySQL.Async.fetchAll('SELECT * FROM properties_inventory WHERE propertie_id = @id AND item = @item', {
				['@id']   = id,
				['@item']  = name
			}, function(result)
				if result[1] ~= nil then
					MySQL.Async.execute('UPDATE properties_inventory SET count = count+@count  WHERE propertie_id = @id AND item = @item', {
						['@id']   = id,
						['@item']  = name,
						['@count'] = count,
						['@owner']  = xPlayer.identifier
					}, function(rows)
						local xPlayer = ESX.GetPlayerFromIdentifier(xPlayer.identifier)
						if xPlayer ~= nil and rows ~= nil then
							xPlayer.removeInventoryItem(name, count)
							TriggerEvent("meeta_house:reloadInventory", function(inventory)
								TriggerClientEvent("esx_inventoryhud:refreshHouseInventory", xPlayer.source, id, inventory.cash, inventory.blackMoney, inventory.items, inventory.weapons)
							end, id)
							TriggerClientEvent("pNotify:SendNotification", xPlayer.source, {
								text = 'เก็บ <strong class="green-text">'..label..'</strong> จำนวน <strong class="green-text">'..count..'</strong> เรียบร้อยแล้ว',
								type = "success",
								timeout = 3000,
								layout = "bottomCenter",
								queue = "global"
							})
						end
					end)
				else
					MySQL.Async.execute('INSERT INTO properties_inventory (propertie_id, item, count, owner) VALUES (@id, @item, @count, @owner)', {
						['@id']   = id,
						['@item']  = name,
						['@count'] = count,
						['@owner']  = xPlayer.identifier
					}, function(rows)
						local xPlayer = ESX.GetPlayerFromIdentifier(xPlayer.identifier)
						if xPlayer ~= nil and rows ~= nil then
							xPlayer.removeInventoryItem(name, count)
							TriggerEvent("meeta_house:reloadInventory", function(inventory)
								TriggerClientEvent("esx_inventoryhud:refreshHouseInventory", xPlayer.source, id, inventory.cash, inventory.blackMoney, inventory.items, inventory.weapons)
							end, id)
							
							TriggerClientEvent("pNotify:SendNotification", xPlayer.source, {
								text = 'เก็บ <strong class="green-text">'..label..'</strong> จำนวน <strong class="green-text">'..count..'</strong> เรียบร้อยแล้ว',
								type = "success",
								timeout = 3000,
								layout = "bottomCenter",
								queue = "global"
							})
						end
					end)
				end
			end)
		end
	elseif type == "item_weapon" then 
		if xPlayer.hasWeapon(name) then
			MySQL.Async.fetchAll('SELECT * FROM properties_inventory WHERE propertie_id = @id AND item = @item', {
				['@id']   = id,
				['@item']  = name
			}, function(result)
				local ammo = 0
				--ammo = ESX.GetPlayerFromId(xPlayer.source).getMoney()
				if count then
					MySQL.Async.execute('INSERT INTO properties_inventory (propertie_id, item, count, isweapon, owner, label_weapon) VALUES (@id, @item, @count, 1, @owner, @label)', {
						['@id']   = id,
						['@item']  = name,
						['@count'] = count,
						['@owner']  = xPlayer.identifier,
						['@label']  = label
					}, function(rows)
						local xPlayer = ESX.GetPlayerFromIdentifier(xPlayer.identifier)
						if xPlayer ~= nil and rows ~= nil then
	
							xPlayer.removeWeapon(name)
	
							TriggerEvent("meeta_house:reloadInventory", function(inventory)
								TriggerClientEvent("esx_inventoryhud:refreshHouseInventory", xPlayer.source, id, inventory.cash, inventory.blackMoney, inventory.items, inventory.weapons)
							end, id)
							
							TriggerClientEvent("pNotify:SendNotification", xPlayer.source, {
								text = 'เก็บ <strong class="green-text">'..label..'</strong> จำนวน <strong class="green-text">1</strong> เรียบร้อยแล้ว',
								type = "success",
								timeout = 3000,
								layout = "bottomCenter",
								queue = "global"
							})
						end
					end)
				else
					TriggerClientEvent("pNotify:SendNotification", xPlayer.source, {
						text = '<strong class="red-text">'..label..' จำนวนไม่ถูกต้อง</strong>',
						type = "error",
						timeout = 3000,
						layout = "bottomCenter",
						queue = "global"
					})
				end
			end)
		else
			TriggerClientEvent("pNotify:SendNotification", xPlayer.source, {
				text = '<strong class="red-text">คุณไม่มีอาวุธ '..label..'</strong>',
				type = "error",
				timeout = 3000,
				layout = "bottomCenter",
				queue = "global"
			})
		end
	else
		
		MySQL.Async.fetchAll('SELECT * FROM properties_inventory WHERE propertie_id = @id AND item = @item', {
			['@id']   = id,
			['@item']  = name
		}, function(result)
			local money = 0
			if type == "item_account" then
				money = xPlayer.getAccount(name).money
			elseif type == "item_money" then
				money = ESX.GetPlayerFromId(xPlayer.source).getMoney()
			end
			if money < count then
				TriggerClientEvent("pNotify:SendNotification", xPlayer.source, {
					text = '<strong class="red-text">'..label..' จำนวนไม่ถูกต้อง</strong>',
					type = "error",
					timeout = 3000,
					layout = "bottomCenter",
					queue = "global"
				})
			else
				if result[1] ~= nil then
					MySQL.Async.execute('UPDATE properties_inventory SET count = count+@count  WHERE propertie_id = @id AND item = @item', {
						['@id']   = id,
						['@item']  = name,
						['@count'] = count,
						['@owner']  = xPlayer.identifier
					}, function(rows)
						local xPlayer = ESX.GetPlayerFromIdentifier(xPlayer.identifier)
						if xPlayer ~= nil and rows ~= nil then

							if type == "item_account" then
								xPlayer.removeAccountMoney(name, count)
							elseif type == "item_money" then
								xPlayer.removeMoney(count)
							end

							TriggerEvent("meeta_house:reloadInventory", function(inventory)
								TriggerClientEvent("esx_inventoryhud:refreshHouseInventory", xPlayer.source, id, inventory.cash, inventory.blackMoney, inventory.items, inventory.weapons)
							end, id)
							TriggerClientEvent("pNotify:SendNotification", xPlayer.source, {
								text = 'เก็บ <strong class="green-text">'..label..'</strong> จำนวน <strong class="green-text">'..count..'</strong> เรียบร้อยแล้ว',
								type = "success",
								timeout = 3000,
								layout = "bottomCenter",
								queue = "global"
							})
						end
					end)
				else
					MySQL.Async.execute('INSERT INTO properties_inventory (propertie_id, item, count, owner) VALUES (@id, @item, @count, @owner)', {
						['@id']   = id,
						['@item']  = name,
						['@count'] = count,
						['@owner']  = xPlayer.identifier
					}, function(rows)
						local xPlayer = ESX.GetPlayerFromIdentifier(xPlayer.identifier)
						if xPlayer ~= nil and rows ~= nil then

							if type == "item_account" then
								xPlayer.removeAccountMoney(name, count)
							elseif type == "item_money" then
								xPlayer.removeMoney(count)
							end

							TriggerEvent("meeta_house:reloadInventory", function(inventory)
								TriggerClientEvent("esx_inventoryhud:refreshHouseInventory", xPlayer.source, id, inventory.cash, inventory.blackMoney, inventory.items, inventory.weapons)
							end, id)
							
							TriggerClientEvent("pNotify:SendNotification", xPlayer.source, {
								text = 'เก็บ <strong class="green-text">'..label..'</strong> จำนวน <strong class="green-text">'..count..'</strong> เรียบร้อยแล้ว',
								type = "success",
								timeout = 3000,
								layout = "bottomCenter",
								queue = "global"
							})
						end
					end)
				end
			end
		end)
	end
end)

RegisterServerEvent('meeta_house:getItem')
AddEventHandler('meeta_house:getItem', function(item_id, id, type, name, count, label)

	local xPlayer = ESX.GetPlayerFromId(source)
	local count = count
	if count > 2147483647 then
		count = 2147483647
	end
	
	if type == "item_standard" then 
		local xItem = xPlayer.getInventoryItem(name)
		if xItem == nil  then
			TriggerClientEvent("pNotify:SendNotification", xPlayer.source, {
				text = '<strong class="red-text">ไม่มีไอเทมนี้อยู่ในช่องเก็บของ</strong>',
				type = "error",
				timeout = 3000,
				layout = "bottomCenter",
				queue = "global"
			})
		elseif count+xItem.count > xItem.limit and (xItem.limit ~= -1) then
			TriggerClientEvent("pNotify:SendNotification", xPlayer.source, {
				text = '<strong class="red-text">'..label..' สามารถเก็บในตัวได้แค่ '..xItem.limit..'</strong>',
				type = "error",
				timeout = 3000,
				layout = "bottomCenter",
				queue = "global"
			})
		else
			
			MySQL.Async.fetchAll('SELECT * FROM properties_inventory WHERE propertie_id = @id AND item = @item', {
				['@id']   = id,
				['@item']  = name
			}, function(result)
				if result[1].count < count then
					TriggerClientEvent("pNotify:SendNotification", xPlayer.source, {
						text = '<strong class="red-text">'..label..' จำนวนไม่ถูกต้อง</strong>',
						type = "error",
						timeout = 3000,
						layout = "bottomCenter",
						queue = "global"
					})
				else
					if result[1].count == count then
						MySQL.Async.execute('DELETE FROM properties_inventory WHERE propertie_id = @id AND item = @item', {
							['@id']   = id,
							['@item']  = name
						}, function(rows)
							local xPlayer = ESX.GetPlayerFromIdentifier(xPlayer.identifier)
							if xPlayer ~= nil and rows ~= nil then
								xPlayer.addInventoryItem(name, count)
								TriggerEvent("meeta_house:reloadInventory", function(inventory)
									TriggerClientEvent("esx_inventoryhud:refreshHouseInventory", xPlayer.source, id, inventory.cash, inventory.blackMoney, inventory.items, inventory.weapons)
								end, id)
								
								TriggerClientEvent("pNotify:SendNotification", xPlayer.source, {
									text = 'นำ <strong class="green-text">'..label..'</strong> จำนวน <strong class="green-text">'..count..'</strong> เก็บใส่ตัวเรียบร้อยแล้ว',
									type = "success",
									timeout = 3000,
									layout = "bottomCenter",
									queue = "global"
								})
							end
						end)
					else
						MySQL.Async.execute('UPDATE properties_inventory SET count = count-@count  WHERE propertie_id = @id AND item = @item', {
							['@id']   = id,
							['@item']  = name,
							['@count'] = count,
							['@owner']  = xPlayer.identifier
						}, function(rows)
							local xPlayer = ESX.GetPlayerFromIdentifier(xPlayer.identifier)
							if xPlayer ~= nil and rows ~= nil then
								xPlayer.addInventoryItem(name, count)
								TriggerEvent("meeta_house:reloadInventory", function(inventory)
									TriggerClientEvent("esx_inventoryhud:refreshHouseInventory", xPlayer.source, id, inventory.cash, inventory.blackMoney, inventory.items, inventory.weapons)
								end, id)
								TriggerClientEvent("pNotify:SendNotification", xPlayer.source, {
									text = 'นำ <strong class="green-text">'..label..'</strong> จำนวน <strong class="green-text">'..count..'</strong> เก็บใส่ตัวเรียบร้อยแล้ว',
									type = "success",
									timeout = 3000,
									layout = "bottomCenter",
									queue = "global"
								})
							end
						end)
					end
				end
			end)
		end
	elseif type == "item_weapon" then 

		if xPlayer.hasWeapon(name) then
			TriggerClientEvent("pNotify:SendNotification", xPlayer.source, {
				text = '<strong class="red-text">คุณมีอาวุธนี้อยู่ในตัวแล้ว</strong>',
				type = "error",
				timeout = 3000,
				layout = "bottomCenter",
				queue = "global"
			})
		else
			MySQL.Async.fetchAll('SELECT * FROM properties_inventory WHERE id = @id_item AND propertie_id = @id AND item = @item AND isweapon = 1', {
				['@id_item']   = item_id,
				['@id']   = id,
				['@item']  = name
			}, function(result)
				if count ~= 1 then
					TriggerClientEvent("pNotify:SendNotification", xPlayer.source, {
						text = '<strong class="red-text">'..label..' จำนวนไม่ถูกต้อง</strong>',
						type = "error",
						timeout = 3000,
						layout = "bottomCenter",
						queue = "global"
					})
				else
					if result[1] ~= nil then
						MySQL.Async.execute('DELETE FROM properties_inventory WHERE id = @id_item AND propertie_id = @id AND item = @item AND isweapon = 1', {
							['@id_item']   = item_id,
							['@id']   = id,
							['@item']  = name
						}, function(rows)
							local xPlayer = ESX.GetPlayerFromIdentifier(xPlayer.identifier)
							if xPlayer ~= nil and rows ~= nil then
	
								xPlayer.addWeapon(name, result[1].count)
								
								TriggerEvent("meeta_house:reloadInventory", function(inventory)
									TriggerClientEvent("esx_inventoryhud:refreshHouseInventory", xPlayer.source, id, inventory.cash, inventory.blackMoney, inventory.items, inventory.weapons)
								end, id)
								
								TriggerClientEvent("pNotify:SendNotification", xPlayer.source, {
									text = 'นำ <strong class="green-text">'..label..'</strong> จำนวน <strong class="green-text">'..count..'</strong> เก็บใส่ตัวเรียบร้อยแล้ว',
									type = "success",
									timeout = 3000,
									layout = "bottomCenter",
									queue = "global"
								})
							end
						end)
					end
				end
			end)
		end

	else
		
		MySQL.Async.fetchAll('SELECT * FROM properties_inventory WHERE propertie_id = @id AND item = @item', {
			['@id']   = id,
			['@item']  = name
		}, function(result)
			if result[1].count < count then
				TriggerClientEvent("pNotify:SendNotification", xPlayer.source, {
					text = '<strong class="red-text">'..label..' จำนวนไม่ถูกต้อง</strong>',
					type = "error",
					timeout = 3000,
					layout = "bottomCenter",
					queue = "global"
				})
			else
				if result[1].count == count then
					MySQL.Async.execute('DELETE FROM properties_inventory WHERE propertie_id = @id AND item = @item', {
						['@id']   = id,
						['@item']  = name
					}, function(rows)
						local xPlayer = ESX.GetPlayerFromIdentifier(xPlayer.identifier)
						if xPlayer ~= nil and rows ~= nil then

							if type == "item_account" then
								xPlayer.addAccountMoney(name, count)
							elseif type == "item_money" then
								xPlayer.addMoney(count)
							end
							
							TriggerEvent("meeta_house:reloadInventory", function(inventory)
								TriggerClientEvent("esx_inventoryhud:refreshHouseInventory", xPlayer.source, id, inventory.cash, inventory.blackMoney, inventory.items, inventory.weapons)
							end, id)
							
							TriggerClientEvent("pNotify:SendNotification", xPlayer.source, {
								text = 'นำ <strong class="green-text">'..label..'</strong> จำนวน <strong class="green-text">'..count..'</strong> เก็บใส่ตัวเรียบร้อยแล้ว',
								type = "success",
								timeout = 3000,
								layout = "bottomCenter",
								queue = "global"
							})
						end
					end)
				else
					MySQL.Async.execute('UPDATE properties_inventory SET count = count-@count  WHERE propertie_id = @id AND item = @item', {
						['@id']   = id,
						['@item']  = name,
						['@count'] = count,
						['@owner']  = xPlayer.identifier
					}, function(rows)
						local xPlayer = ESX.GetPlayerFromIdentifier(xPlayer.identifier)
						if xPlayer ~= nil and rows ~= nil then

							if type == "item_account" then
								xPlayer.addAccountMoney(name, count)
							elseif type == "item_money" then
								xPlayer.addMoney(count)
							end

							TriggerEvent("meeta_house:reloadInventory", function(inventory)
								TriggerClientEvent("esx_inventoryhud:refreshHouseInventory", xPlayer.source, id, inventory.cash, inventory.blackMoney, inventory.items, inventory.weapons)
							end, id)
							TriggerClientEvent("pNotify:SendNotification", xPlayer.source, {
								text = 'นำ <strong class="green-text">'..label..'</strong> จำนวน <strong class="green-text">'..count..'</strong> เก็บใส่ตัวเรียบร้อยแล้ว',
								type = "success",
								timeout = 3000,
								layout = "bottomCenter",
								queue = "global"
							})
						end
					end)
				end
			end
		end)

	end
end)


ESX.RegisterServerCallback('meeta_house:getPlayerDressing', function(source, cb)
	local xPlayer  = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
		local count  = store.count('dressing')
		local labels = {}

		for i=1, count, 1 do
			local entry = store.get('dressing', i)
			table.insert(labels, entry.label)
		end

		cb(labels)
	end)
end)

ESX.RegisterServerCallback('meeta_house:getPlayerOutfit', function(source, cb, type)
	-- local xPlayer  = ESX.GetPlayerFromId(source)

	-- TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
	-- 	local outfit = store.get('dressing', num)
	-- 	cb(outfit.skin)
	-- end)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.fetchAll('SELECT * FROM meeta_accessory_inventory WHERE owner = @owner AND type = @type', {
		['@owner'] = xPlayer.identifier,
		['@type'] = type
	}, function(result)
		cb(result)
	end)
end)

RegisterServerEvent('meeta_house:renameOutfit')
AddEventHandler('meeta_house:renameOutfit', function(label, id)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.execute('UPDATE meeta_accessory_inventory SET label = @label WHERE id = @id AND owner = @owner', {
		['@label'] = label,
		['@id'] = id,
		['@owner'] = xPlayer.identifier
	})

	TriggerClientEvent("esx_inventoryhud:getOwnerAccessories", source)
end)

RegisterServerEvent('meeta_house:deleteOutfit')
AddEventHandler('meeta_house:deleteOutfit', function(id)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.execute('DELETE FROM meeta_accessory_inventory WHERE id = @id AND owner = @owner', {
		['@id'] = id,
		['@owner'] = xPlayer.identifier
	})
	
	TriggerClientEvent("esx_inventoryhud:getOwnerAccessories", source)
end)

RegisterServerEvent('meeta_house:removeOutfit')
AddEventHandler('meeta_house:removeOutfit', function(label)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
		local dressing = store.get('dressing') or {}

		table.remove(dressing, label)
		store.set('dressing', dressing)
	end)
end)

RegisterServerEvent('meeta_house:saveLastProperty')
AddEventHandler('meeta_house:saveLastProperty', function(property)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.execute('UPDATE users SET last_property = @last_property WHERE identifier = @identifier', {
		['@last_property'] = property,
		['@identifier']    = xPlayer.identifier
	})
end)

RegisterServerEvent('meeta_house:deleteLastProperty')
AddEventHandler('meeta_house:deleteLastProperty', function()
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.execute('UPDATE users SET last_property = NULL WHERE identifier = @identifier', {
		['@identifier'] = xPlayer.identifier
	})
end)

ESX.RegisterServerCallback('meeta_house:getLastProperty', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.fetchAll('SELECT last_property FROM users WHERE identifier = @identifier', {
		['@identifier'] = xPlayer.identifier
	}, function(users)
		cb(users[1].last_property)
	end)
end)
