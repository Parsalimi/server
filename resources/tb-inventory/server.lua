TBCore = nil

TriggerEvent('tb-core:server:getObject', function(obj) TBCore = obj end)

--CODE

TBCore.Functions.RegisterServerCallback("tb-inventory:server:getHotbarItem", function(source, cb, slot)
	local pData = TBCore.Functions.getPlayer(source)
	local id 	= pData.Data.identifier

	exports['ghmattimysql']:execute('SELECT * FROM player_inventory WHERE identifier = @identifier AND itemslot = @itemslot', {['@identifier'] = id, ['@itemslot'] = slot}, function(item)
		exports['ghmattimysql']:execute('SELECT * FROM player_weapons WHERE identifier = @identifier AND itemslot = @itemslot', {['@identifier'] = id, ['@itemslot'] = slot}, function(weapon)
			local item = item[1]
			local weapon = weapon[1]

			if item then
				cb(TBCore.Items[item.item], true, nil)
			elseif weapon then
				cb(TBCore.Items[weapon.weapon], true, weapon.bullets)
			else
				cb(nil, false, 0)
			end

		end)
	end)
end)

TBCore.Functions.RegisterServerCallback("tb-inventory:server:getPlayerInventory", function(source, cb, target)
	local pData = TBCore.Functions.getPlayer(target)

	if pData ~= nil then
		cb({inventory = pData.inventory, weapons = pData.weapons})
	else
		cb(nil)
	end
end)

TBCore.Functions.RegisterServerCallback("tb-inventory:server:getHouseInventory", function(source, cb, target, house)
	local property = {
		inventory = {},
		weapons = {}
	}

	exports['ghmattimysql']:execute('SELECT * FROM house_inventory WHERE house = @house', {['@house'] = house}, function(inventory)
		exports['ghmattimysql']:execute('SELECT * FROM house_weapons WHERE house = @house', {['@house'] = house}, function(weapons)
			for i=1, #inventory, 1 do
				table.insert(property.inventory, {
					item      	= inventory[i].item,
					amount     	= inventory[i].amount,
					slot 		= (inventory[i].itemslot - 1),
					label 		= TBCore.Items[inventory[i].item].label,
					weight 		= TBCore.Items[inventory[i].item].weight,
					description = TBCore.Items[inventory[i].item].description,
					type 		= TBCore.Items[inventory[i].item].type,
					usable 		= TBCore.Items[inventory[i].item].usable,
					stackable   = TBCore.Items[inventory[i].item].stackable,
					unique 		= TBCore.Items[inventory[i].item].unique,
				})
			end

			for i=1, #weapons, 1 do
				table.insert(property.weapons, {
					item      	= weapons[i].weapon,
					amount     	= weapons[i].bullets,
					slot 		= (weapons[i].itemslot - 1),
					label 		= TBCore.Items[weapons[i].weapon].label,
					weight 		= TBCore.Items[weapons[i].weapon].weight,
					description = TBCore.Items[weapons[i].weapon].description,
					type 		= TBCore.Items[weapons[i].weapon].type,
					usable 		= TBCore.Items[weapons[i].weapon].usable,
					stackable   = TBCore.Items[weapons[i].weapon].stackable,
					unique 		= TBCore.Items[weapons[i].weapon].unique,
					weaponid    = weapons[i].weaponid,
				})
			end

			cb({inventory = property.inventory, weapons = property.weapons})
		end)
	end)
end)

RegisterServerEvent('tb-inventory:server:updateSlot')
AddEventHandler('tb-inventory:server:updateSlot', function(itemname, itemslot)
	local src = source
	local pData = TBCore.Functions.getPlayer(src)
	local newslot = tonumber(itemslot)

	pData.changeItemSlot(itemname, newslot)
end)

RegisterServerEvent('tb-inventory:server:updateWeaponSlot')
AddEventHandler('tb-inventory:server:updateWeaponSlot', function(weaponid, itemslot)
	local src = source
	local pData = TBCore.Functions.getPlayer(src)
	local newslot = tonumber(itemslot)

	pData.changeWeaponSlot(weaponid, newslot)
end)

RegisterServerEvent('tb-inventory:server:saveInventory')
AddEventHandler('tb-inventory:server:saveInventory', function()
	local src = source
	local xPlayer = TBCore.Functions.getPlayer(src)
	local identifier = xPlayer.Data.identifier

	for i=1, #xPlayer.inventory, 1 do
		exports['ghmattimysql']:execute('UPDATE player_inventory SET amount = @amount WHERE identifier = @identifier AND item = @item', {
			['@identifier'] = identifier,
			['@item'] 		= xPlayer.inventory[i].item,
			['@amount'] 	= tonumber(xPlayer.inventory[i].amount)
		})

		exports['ghmattimysql']:execute('UPDATE player_inventory SET itemslot = @itemslot WHERE identifier = @identifier AND item = @item', {
			['@identifier'] = identifier,
			['@item'] 		= xPlayer.inventory[i].item,
			['@itemslot'] 	= tonumber((xPlayer.inventory[i].slot + 1))
		})
	end

	for i=1, #xPlayer.weapons, 1 do
		exports['ghmattimysql']:execute('UPDATE player_weapons SET itemslot = @itemslot WHERE identifier = @identifier AND weaponid = @weaponid', {
			['@identifier'] = identifier,
			['@weaponid'] 	= xPlayer.weapons[i].weaponid,
			['@itemslot'] 	= tonumber((xPlayer.weapons[i].slot + 1))
		})
	end
end)

RegisterServerEvent('tb-inventory:server:updateAmmo')
AddEventHandler('tb-inventory:server:updateAmmo', function(weaponName, weaponAmmo, slot)
	local src 		   	= source
	local pData 	   	= TBCore.Functions.getPlayer(src)
	local identifier   	= pData.Data.identifier
	local cid 		   	= pData.Data.cid

	if slot ~= nil then
		exports['ghmattimysql']:execute('SELECT * FROM player_weapons WHERE identifier = @identifier AND itemslot = @itemslot', {['@identifier'] = identifier, ['@itemslot'] = slot}, function(result)
			local weaponid = result[1].weaponid
			exports['ghmattimysql']:execute('UPDATE player_weapons SET bullets = @bullets WHERE identifier = @identifier AND weaponid = @weaponid AND cid = @cid', {
				['@identifier'] = identifier,
				['@cid']		= cid,
				['@weaponid'] 	= weaponid, 
				['@bullets'] 	= tonumber(weaponAmmo)
			})

			pData.updateWeaponBullets(weaponid, tonumber(weaponAmmo))
		end)
	end
end)

