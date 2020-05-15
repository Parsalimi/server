-- CREATE BY THANAWUT PROMRAUNGDET
ESX = nil
local arrayWeight = Config.localWeight

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function getItemWeight(item)
    local weight = 0
    local itemWeight = 0
    if item ~= nil then
        itemWeight = Config.DefaultWeight
        if arrayWeight[item] ~= nil then
            itemWeight = arrayWeight[item]
        end
    end
    return itemWeight
end

function getInventoryWeight(inventory)
    local weight = 0
    local itemWeight = 0
    if inventory ~= nil then
        for i = 1, #inventory, 1 do
            if inventory[i] ~= nil then
                itemWeight = Config.DefaultWeight
                if arrayWeight[inventory[i].name] ~= nil then
                    itemWeight = arrayWeight[inventory[i].name]
                end
                if inventory[i].type == "item_weapon" then
                    weight = weight + (itemWeight * 1)
                else
                    weight = weight + (itemWeight * (inventory[i].count or 1))
                end
                
            end
        end
    end
    return weight
end

function getTotalInventoryWeight(plate)
    local weight = 0
    local result = MySQL.Sync.fetchAll("SELECT * FROM meeta_vehicle_trunk WHERE plate = @plate", {
		['@plate'] = plate
    })
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

        local weight_weapon = getInventoryWeight(weapons or {})
        local weight_items = getInventoryWeight(items or {})

        weight = weight_weapon + weight_items
    end
    
    return weight
end

ESX.RegisterServerCallback("meeta_carinventory:getInventory", function(source, cb, plate)
    MySQL.Async.fetchAll("SELECT * FROM meeta_vehicle_trunk WHERE plate = @plate", {
		['@plate'] = plate
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
            
            local weight

            local weight_weapon = getInventoryWeight(weapons or {})
            local weight_items = getInventoryWeight(items or {})

            weight = weight_weapon + weight_items

			cb(
				{
					cash = cash,
					blackMoney = blackMoney,
					items = items,
                    weapons = weapons,
                    weight = weight
				}
			)
		else
			cb({result = false})
		end
	end)
end)

RegisterServerEvent("meeta_carinventory:reloadInventory")
AddEventHandler("meeta_carinventory:reloadInventory", function(cb, plate)
    MySQL.Async.fetchAll("SELECT * FROM meeta_vehicle_trunk WHERE plate = @plate", {
		['@plate'] = plate
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
            
            local weight

            local weight_weapon = getInventoryWeight(weapons or {})
            local weight_items = getInventoryWeight(items or {})

            weight = weight_weapon + weight_items

			cb(
				{
					cash = cash,
					blackMoney = blackMoney,
					items = items,
                    weapons = weapons,
                    weight = weight
				}
			)
		else
			cb({result = false})
		end
	end)
end)

RegisterServerEvent('meeta_carinventory:putItem')
AddEventHandler('meeta_carinventory:putItem', function(plate, type, name, count, label, max)
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
			
			MySQL.Async.fetchAll('SELECT * FROM meeta_vehicle_trunk WHERE plate = @plate AND item = @item', {
				['@plate'] = plate,
				['@item']  = name
			}, function(result)
                if result[1] ~= nil then
                    if (getTotalInventoryWeight(plate) + (getItemWeight(name) * count)) > max then
                        TriggerClientEvent("pNotify:SendNotification", xPlayer.source, {
                            text = 'ท้ายรถของคุณ<strong class="red-text">เต็ม</strong>',
                            type = "success",
                            timeout = 3000,
                            layout = "bottomCenter",
                            queue = "global"
                        })
                    else
                        MySQL.Async.execute('UPDATE meeta_vehicle_trunk SET count = count+@count  WHERE plate = @plate AND item = @item', {
                            ['@plate'] = plate,
                            ['@item']  = name,
                            ['@count'] = count,
                            ['@owner']  = xPlayer.identifier
                        }, function(rows)
                            local xPlayer = ESX.GetPlayerFromIdentifier(xPlayer.identifier)
                            if xPlayer ~= nil and rows ~= nil then
                                xPlayer.removeInventoryItem(name, count)
                                TriggerEvent("meeta_carinventory:reloadInventory", function(inventory)
                                    text = plate.." ความจุ: "..(inventory.weight / 1000).." / "..(max / 1000)
                                    data = {plate = plate, max = max, text = text}
                                    TriggerClientEvent("esx_inventoryhud:refreshTrunkInventory", xPlayer.source, data, inventory.cash, inventory.blackMoney, inventory.items, inventory.weapons)
                                end, plate)
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
                else
                    if (getTotalInventoryWeight(plate) + (getItemWeight(name) * count)) > max then
                        TriggerClientEvent("pNotify:SendNotification", xPlayer.source, {
                            text = 'ท้ายรถของคุณ<strong class="red-text">เต็ม</strong>',
                            type = "success",
                            timeout = 3000,
                            layout = "bottomCenter",
                            queue = "global"
                        })
                    else
                        MySQL.Async.execute('INSERT INTO meeta_vehicle_trunk (plate, item, count, owner) VALUES (@plate, @item, @count, @owner)', {
                            ['@plate'] = plate,
                            ['@item']  = name,
                            ['@count'] = count,
                            ['@owner']  = xPlayer.identifier
                        }, function(rows)
                            local xPlayer = ESX.GetPlayerFromIdentifier(xPlayer.identifier)
                            if xPlayer ~= nil and rows ~= nil then
                                xPlayer.removeInventoryItem(name, count)
                                TriggerEvent("meeta_carinventory:reloadInventory", function(inventory)
                                    text = plate.." ความจุ: "..(inventory.weight / 1000).." / "..(max / 1000)
                                    data = {plate = plate, max = max, text = text}
                                    TriggerClientEvent("esx_inventoryhud:refreshTrunkInventory", xPlayer.source, data, inventory.cash, inventory.blackMoney, inventory.items, inventory.weapons)
                                end, plate)
                                
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
	elseif type == "item_weapon" then 
		if xPlayer.hasWeapon(name) then
			MySQL.Async.fetchAll('SELECT * FROM meeta_vehicle_trunk WHERE plate = @plate AND item = @item', {
				['@plate'] = plate,
				['@item']  = name
			}, function(result)
				local ammo = 0
				--ammo = ESX.GetPlayerFromId(xPlayer.source).getMoney()
                if count then
                    if (getTotalInventoryWeight(plate) + (getItemWeight(name))) > max then
                        TriggerClientEvent("pNotify:SendNotification", xPlayer.source, {
                            text = 'ท้ายรถของคุณ<strong class="red-text">เต็ม</strong>',
                            type = "success",
                            timeout = 3000,
                            layout = "bottomCenter",
                            queue = "global"
                        })
                    else
                        MySQL.Async.execute('INSERT INTO meeta_vehicle_trunk (plate, item, count, isweapon, owner, label_weapon) VALUES (@plate, @item, @count, 1, @owner, @label)', {
                            ['@plate'] = plate,
                            ['@item']  = name,
                            ['@count'] = count,
                            ['@owner']  = xPlayer.identifier,
                            ['@label']  = label
                        }, function(rows)
                            local xPlayer = ESX.GetPlayerFromIdentifier(xPlayer.identifier)
                            if xPlayer ~= nil and rows ~= nil then
        
                                xPlayer.removeWeapon(name)
        
                                TriggerEvent("meeta_carinventory:reloadInventory", function(inventory)
                                    text = plate.." ความจุ: "..(inventory.weight / 1000).." / "..(max / 1000)
                                    data = {plate = plate, max = max, text = text}
                                    TriggerClientEvent("esx_inventoryhud:refreshTrunkInventory", xPlayer.source, data, inventory.cash, inventory.blackMoney, inventory.items, inventory.weapons)
                                end, plate)
                                
                                TriggerClientEvent("pNotify:SendNotification", xPlayer.source, {
                                    text = 'เก็บ <strong class="green-text">'..label..'</strong> จำนวน <strong class="green-text">1</strong> เรียบร้อยแล้ว',
                                    type = "success",
                                    timeout = 3000,
                                    layout = "bottomCenter",
                                    queue = "global"
                                })
                            end
                        end)
                    end
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
		
		MySQL.Async.fetchAll('SELECT * FROM meeta_vehicle_trunk WHERE plate = @plate AND item = @item', {
			['@plate'] = plate,
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
                    if (getTotalInventoryWeight(plate) + (getItemWeight(name) * count)) > max then
                        TriggerClientEvent("pNotify:SendNotification", xPlayer.source, {
                            text = 'ท้ายรถของคุณ<strong class="red-text">เต็ม</strong>',
                            type = "success",
                            timeout = 3000,
                            layout = "bottomCenter",
                            queue = "global"
                        })
                    else
                        MySQL.Async.execute('UPDATE meeta_vehicle_trunk SET count = count+@count  WHERE plate = @plate AND item = @item', {
                            ['@plate'] = plate,
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

                                TriggerEvent("meeta_carinventory:reloadInventory", function(inventory)
                                    text = plate.." ความจุ: "..(inventory.weight / 1000).." / "..(max / 1000)
                                    data = {plate = plate, max = max, text = text}
                                    TriggerClientEvent("esx_inventoryhud:refreshTrunkInventory", xPlayer.source, data, inventory.cash, inventory.blackMoney, inventory.items, inventory.weapons)
                                end, plate)
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
                else
                    if (getTotalInventoryWeight(plate) + (getItemWeight(name) * count)) > max then
                        TriggerClientEvent("pNotify:SendNotification", xPlayer.source, {
                            text = 'ท้ายรถของคุณ<strong class="red-text">เต็ม</strong>',
                            type = "success",
                            timeout = 3000,
                            layout = "bottomCenter",
                            queue = "global"
                        })
                    else
                        MySQL.Async.execute('INSERT INTO meeta_vehicle_trunk (plate, item, count, owner) VALUES (@plate, @item, @count, @owner)', {
                            ['@plate'] = plate,
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

                                TriggerEvent("meeta_carinventory:reloadInventory", function(inventory)
                                    text = plate.." ความจุ: "..(inventory.weight / 1000).." / "..(max / 1000)
                                    data = {plate = plate, max = max, text = text}
                                    TriggerClientEvent("esx_inventoryhud:refreshTrunkInventory", xPlayer.source, data, inventory.cash, inventory.blackMoney, inventory.items, inventory.weapons)
                                end, plate)
                                
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
			end
		end)
	end
end)

RegisterServerEvent('meeta_carinventory:getItem')
AddEventHandler('meeta_carinventory:getItem', function(item_id, plate, type, name, count, label, max)

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
			
			MySQL.Async.fetchAll('SELECT * FROM meeta_vehicle_trunk WHERE plate = @plate AND item = @item', {
				['@plate'] = plate,
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
						MySQL.Async.execute('DELETE FROM meeta_vehicle_trunk WHERE plate = @plate AND item = @item', {
							['@plate'] = plate,
							['@item']  = name
						}, function(rows)
							local xPlayer = ESX.GetPlayerFromIdentifier(xPlayer.identifier)
							if xPlayer ~= nil and rows ~= nil then
								xPlayer.addInventoryItem(name, count)
								TriggerEvent("meeta_carinventory:reloadInventory", function(inventory)
                                    text = plate.." ความจุ: "..(inventory.weight / 1000).." / "..(max / 1000)
                                    data = {plate = plate, max = max, text = text}
                                    TriggerClientEvent("esx_inventoryhud:refreshTrunkInventory", xPlayer.source, data, inventory.cash, inventory.blackMoney, inventory.items, inventory.weapons)
                                end, plate)
								
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
						MySQL.Async.execute('UPDATE meeta_vehicle_trunk SET count = count-@count  WHERE plate = @plate AND item = @item', {
							['@plate'] = plate,
							['@item']  = name,
							['@count'] = count,
							['@owner']  = xPlayer.identifier
						}, function(rows)
							local xPlayer = ESX.GetPlayerFromIdentifier(xPlayer.identifier)
							if xPlayer ~= nil and rows ~= nil then
								xPlayer.addInventoryItem(name, count)
								TriggerEvent("meeta_carinventory:reloadInventory", function(inventory)
                                    text = plate.." ความจุ: "..(inventory.weight / 1000).." / "..(max / 1000)
                                    data = {plate = plate, max = max, text = text}
                                    TriggerClientEvent("esx_inventoryhud:refreshTrunkInventory", xPlayer.source, data, inventory.cash, inventory.blackMoney, inventory.items, inventory.weapons)
                                end, plate)
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
			MySQL.Async.fetchAll('SELECT * FROM meeta_vehicle_trunk WHERE id = @id AND plate = @plate AND item = @item AND isweapon = 1', {
				['@id']   = item_id,
				['@plate'] = plate,
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
						MySQL.Async.execute('DELETE FROM meeta_vehicle_trunk WHERE id = @id AND plate = @plate AND item = @item AND isweapon = 1', {
							['@id']   = item_id,
							['@plate'] = plate,
							['@item']  = name
						}, function(rows)
							local xPlayer = ESX.GetPlayerFromIdentifier(xPlayer.identifier)
							if xPlayer ~= nil and rows ~= nil then
	
								xPlayer.addWeapon(name, result[1].count)
								
								TriggerEvent("meeta_carinventory:reloadInventory", function(inventory)
                                    text = plate.." ความจุ: "..(inventory.weight / 1000).." / "..(max / 1000)
                                    data = {plate = plate, max = max, text = text}
                                    TriggerClientEvent("esx_inventoryhud:refreshTrunkInventory", xPlayer.source, data, inventory.cash, inventory.blackMoney, inventory.items, inventory.weapons)
                                end, plate)
								
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
		
		MySQL.Async.fetchAll('SELECT * FROM meeta_vehicle_trunk WHERE plate = @plate AND item = @item', {
			['@plate'] = plate,
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
					MySQL.Async.execute('DELETE FROM meeta_vehicle_trunk WHERE plate = @plate AND item = @item', {
						['@plate'] = plate,
						['@item']  = name
					}, function(rows)
						local xPlayer = ESX.GetPlayerFromIdentifier(xPlayer.identifier)
						if xPlayer ~= nil and rows ~= nil then

							if type == "item_account" then
								xPlayer.addAccountMoney(name, count)
							elseif type == "item_money" then
								xPlayer.addMoney(count)
							end
							
							TriggerEvent("meeta_carinventory:reloadInventory", function(inventory)
                                text = plate.." ความจุ: "..(inventory.weight / 1000).." / "..(max / 1000)
                                data = {plate = plate, max = max, text = text}
                                TriggerClientEvent("esx_inventoryhud:refreshTrunkInventory", xPlayer.source, data, inventory.cash, inventory.blackMoney, inventory.items, inventory.weapons)
                            end, plate)
							
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
					MySQL.Async.execute('UPDATE meeta_vehicle_trunk SET count = count-@count  WHERE plate = @plate AND item = @item', {
						['@plate'] = plate,
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

							TriggerEvent("meeta_carinventory:reloadInventory", function(inventory)
                                text = plate.." ความจุ: "..(inventory.weight / 1000).." / "..(max / 1000)
                                data = {plate = plate, max = max, text = text}
                                TriggerClientEvent("esx_inventoryhud:refreshTrunkInventory", xPlayer.source, data, inventory.cash, inventory.blackMoney, inventory.items, inventory.weapons)
                            end, plate)
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