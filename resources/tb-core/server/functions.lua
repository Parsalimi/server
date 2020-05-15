TBCore.Functions				= {}
TBCore.Commands 				= {}
TBCore.CommandsSuggestions      = {}
TBCore.UsableItemsCallbacks 	= {}
TBCore.Crypto 					= {}

TBCore.Functions.RegisterServerCallback = function(name, cb)
	TBCore.ServerCallbacks[name] = cb
end

TBCore.Functions.TriggerServerCallback = function(name, requestId, source, cb, ...)
	if TBCore.ServerCallbacks[name] ~= nil then
		TBCore.ServerCallbacks[name](source, cb, ...)
	end
end

TBCore.Functions.dropPlayer = function(target, msg)
	DropPlayer(target, msg)
end

TBCore.Functions.LoadPlayer = function(source, pData, cid)
	local src 			= source
	local identifier 	= pData.identifier
	
	Citizen.Wait(7)
	exports['ghmattimysql']:execute('SELECT * FROM players WHERE identifier = @identifier AND cid = @cid', {['@identifier'] = identifier, ['@cid'] = cid}, function(result)
		local userData = {
			inventory = {},
			weapons = {}
		}
		--Server
		exports['ghmattimysql']:execute('UPDATE players SET name = @name WHERE identifier = @identifier AND cid = @cid', { ['@identifier'] = identifier, ['@name'] = pData.name, ['@cid'] = cid})
		
		exports['ghmattimysql']:execute('SELECT * FROM player_inventory WHERE identifier = @identifier AND cid = @cid', {['@identifier'] = identifier, ['@cid'] = cid}, function(inventory)
			for i=1, #inventory, 1 do
				table.insert(userData.inventory, {
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
		end)

		exports['ghmattimysql']:execute('SELECT * FROM player_weapons WHERE identifier = @identifier AND cid = @cid', {['@identifier'] = identifier, ['@cid'] = cid}, function(weapons)
			for i=1, #weapons, 1 do
				table.insert(userData.weapons, {
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
		end)
		TBCore.Player.LoadData(source, identifier, userData.inventory, userData.weapons, cid)
		Citizen.Wait(7)
		--Client
		for k,v in pairs(TBCore.CommandsSuggestions) do
			TriggerClientEvent('chat:addSuggestion', src, "/"..k, v.help, v.params)
		end
		local player 		= TBCore.Functions.getPlayer(source)
		TriggerClientEvent('tb-core:client:setCharacterData', source, {
			identifier = result[1].identifier,
			license = result[1].license,
			name = result[1].name,
			lastPosition = json.decode(result[1].position),
			bsn = result[1].bsn,
			cash = result[1].cash,
			bank = result[1].bank,
			usergroup = result[1].usergroup
		})
		TriggerClientEvent('tb-core:client:PlayerLoaded', source)
		print('[^2TBCore^0] '..pData.name..', CID: '..cid..' was loaded successfully!')
		TriggerClientEvent('tb-ui:client:openUI:multichar', source)
		TriggerClientEvent('tb-healthbar:client:openUI:multichar', source)
	end)
end

TBCore.Functions.cryptoFloat = function(crypto)
	Citizen.Wait(7)
	exports['ghmattimysql']:execute('SELECT * FROM cryptos WHERE crypto = @crypto', {['@crypto'] = crypto}, function(result)
		local Crypto = TBConfig.Cryptos[result[1].crypto]

		local behavior = math.random(1, 100)
		local luck = math.random(1, 50)
		local amount
		local change

		if luck > 45 then
			amount = math.random(500, 1000)
		else
			amount = math.random(1, 500)
		end

		if behavior > 50 then
			if result[1].value + amount > Crypto.maxValue then
				change = result[1].value - amount 
				exports['ghmattimysql']:execute('UPDATE cryptos SET value = @value WHERE crypto = @crypto', {
					['@crypto'] = crypto, 
					['@value'] = change
				})
			else
				change = result[1].value + amount 
				exports['ghmattimysql']:execute('UPDATE cryptos SET value = @value WHERE crypto = @crypto', {
					['@crypto'] = crypto, 
					['@value'] = change
				})
			end
		else
			if result[1].value - amount < Crypto.minValue then
				change = result[1].value + amount 
				exports['ghmattimysql']:execute('UPDATE cryptos SET value = @value WHERE crypto = @crypto', {
					['@crypto'] = crypto, 
					['@value'] = change
				})
			else
				change = result[1].value - amount 
				exports['ghmattimysql']:execute('UPDATE cryptos SET value = @value WHERE crypto = @crypto', {
					['@crypto'] = crypto, 
					['@value'] = change
				})
			end
		end
		print(result[1].crypto_label..' changed to: '..change)
	end)	
end

TBCore.Functions.CreatePlayer = function(source, Data)
	local bsn = math.random(100000000, 999999999)
	local randomNum = math.random(100000000000, 999999999999)
	local giroNum = math.random(1, 9)
	exports['ghmattimysql']:execute('INSERT INTO players (`identifier`, `license`, `name`, `cash`, `bank`, `bsn`, `banknumber`) VALUES (@identifier, @license, @name, @cash, @bank, @bsn, @banknumber)', { 
		['identifier'] = Data.identifier, 
		['license'] = Data.license, 
		['name'] = Data.name,
		['cash'] = Data.cash,
		['bank'] = Data.bank,
		['bsn'] = bsn,
		['banknumber'] = "NL0" ..giroNum.. "TB" ..randomNum
	})

	exports['ghmattimysql']:execute('INSERT INTO player_cryptos (`identifier`, `crypto`, `amount`) VALUES (@identifier, @crypto, @amount)', { 
		['identifier'] = Data.identifier, 
		['crypto'] = 'tbcoin', 
		['amount'] = 0
	})

	print('[^2TBCore^0] '..Data.name..' was created successfully!')

	TBCore.Functions.LoadPlayer(source, Data)
end

TBCore.Functions.getPlayer = function(source)
	if TBCore.Players[source] ~= nil then
		return TBCore.Players[source]
	end
end

TBCore.Functions.SpawnVehicle = function(source, vehicle, name)
	TriggerClientEvent('tb-core:client:SpawnVehicle', source, vehicle, name)
end

TBCore.Functions.DeleteVehicle = function(source, vehicle)
	TriggerClientEvent('tb-core:client:DeleteVehicle', source)
end

TBCore.Functions.addMessage = function(type, target, prefix, author, msg)
	local output
	if author == nil then
		output = { prefix, msg }
	else
		output = { prefix, author..": "..msg }
	end
	
	if type == "PRIMARY" then
		TriggerClientEvent('chat:addMessage', target, {
			template = '<div style="padding: 8px; margin: 0.1vw; background-color: rgba(78, 114, 223, 0.75); border-radius: 6px;"><b>{0}</b> | {1}</div>',
			args = output
		})
	elseif type == "SUCCESS" then
		TriggerClientEvent('chat:addMessage', target, {
			template = '<div style="padding: 8px; margin: 0.1vw; background-color: rgba(28, 200, 138, 0.75); border-radius: 6px;"><b>{0}</b> | {1}</div>',
			args = output
		})
	elseif type == "INFO" then
		TriggerClientEvent('chat:addMessage', target, {
			template = '<div style="padding: 8px; margin: 0.1vw; background-color: rgba(54, 185, 204, 0.75); border-radius: 6px;"><b>{0}</b> | {1}</div>',
			args = output
		})
	elseif type == "WARNING" then
		TriggerClientEvent('chat:addMessage', target, {
			template = '<div style="padding: 8px; margin: 0.1vw; background-color: rgba(246, 194, 62, 0.75); border-radius: 6px;"><b>{0}</b> | {1}</div>',
			args = output
		})
	elseif type == "DANGER" then
		TriggerClientEvent('chat:addMessage', target, {
			template = '<div style="padding: 8px; margin: 0.1vw; background-color: rgba(231, 74, 59, 0.75); border-radius: 6px;"><b>{0}</b> | {1}</div>',
			args = output
		})
	elseif type == "SECONDARY" then
		TriggerClientEvent('chat:addMessage', target, {
			template = '<div style="padding: 8px; margin: 0.1vw; background-color: rgba(133, 135, 150, 0.75); border-radius: 6px;"><b>{0}</b> | {1}</div>',
			args = output
		})
	end
end

TBCore.Functions.addCommand = function(command, callback, suggestion, arguments)
	TBCore.Commands[command] = {}
	TBCore.Commands[command].cmd = callback
	TBCore.Commands[command].arguments = arguments or -1

	if suggestion then
		if not suggestion.params or not type(suggestion.params) == "table" then suggestion.params = {} end
		if not suggestion.help or not type(suggestion.help) == "string" then suggestion.help = "" end

		TBCore.CommandsSuggestions[command] = suggestion
	end

	RegisterCommand(command, function(source, args)
		if((#args <= TBCore.Commands[command].arguments and #args == TBCore.Commands[command].arguments) or TBCore.Commands[command].arguments == -1)then
			callback(source, args, TBCore.Players[source])
		end
	end, false)
end

TBCore.Functions.addGroupCommand = function(command, group, callback, callbackfailed, suggestion, arguments)
	TBCore.Commands[command] = {}
	TBCore.Commands[command].perm = math.maxinteger
	TBCore.Commands[command].group = group
	TBCore.Commands[command].cmd = callback
	TBCore.Commands[command].callbackfailed = callbackfailed
	TBCore.Commands[command].arguments = arguments or -1

	if suggestion then
		if not suggestion.params or not type(suggestion.params) == "table" then suggestion.params = {} end
		if not suggestion.help or not type(suggestion.help) == "string" then suggestion.help = "" end

		TBCore.CommandsSuggestions[command] = suggestion
	end

	ExecuteCommand('add_ace group.' .. group .. ' command.' .. command .. ' allow')

	RegisterCommand(command, function(source, args)
		local Source = source
		local pData = TBCore.Functions.getPlayer(Source)

		if(source ~= 0)then
			if pData ~= nil then
				if pData.Data.usergroup == TBCore.Commands[command].group then
					if((#args <= TBCore.Commands[command].arguments and #args == TBCore.Commands[command].arguments) or TBCore.Commands[command].arguments == -1)then
						callback(source, args, TBCore.Players[source])
					end
				else
					callbackfailed(source, args, TBCore.Players[source])
				end
			end
		else
			if((#args <= TBCore.Commands[command].arguments and #args == TBCore.Commands[command].arguments) or TBCore.Commands[command].arguments == -1)then
				callback(source, args, TBCore.Players[source])
			end
		end
	end, true)
end

-- CASH

TBCore.Functions.addCash = function(player, amount)
	local identifier = player.Data.identifier
	local pCid = player.Data.cid
	
	exports['ghmattimysql']:execute('SELECT * FROM players WHERE identifier = @identifier AND cid = @cid', {['@identifier'] = identifier, ['@cid'] = pCid}, function(result)
		exports['ghmattimysql']:execute('UPDATE players SET cash = @cash WHERE identifier = @identifier AND cid = @cid', {
			['@identifier'] = identifier, 
			['@cash'] = result[1].cash + amount,
			['@cid'] = pCid
		})
		TriggerClientEvent('tb-ui:client:updateCash', player.Data.PlayerId, result[1].cash + amount, "add", amount)
		TriggerClientEvent('tb-core:client:updateCash', player.Data.PlayerId, result[1].cash + amount)
	end)
end

TBCore.Functions.removeCash = function(player, amount)
	local identifier = player.Data.identifier
	local pCid = player.Data.cid
		
	exports['ghmattimysql']:execute('SELECT * FROM players WHERE identifier = @identifier AND cid = @cid', {['@identifier'] = identifier, ['@cid'] = pCid}, function(result)
		exports['ghmattimysql']:execute('UPDATE players SET cash = @cash WHERE identifier = @identifier AND cid = @cid', {
			['@identifier'] = identifier, 
			['@cid'] = pCid,
			['@cash'] = result[1].cash - amount
		})
		TriggerClientEvent('tb-ui:client:updateCash', player.Data.PlayerId, result[1].cash - amount, "remove", amount)
		TriggerClientEvent('tb-core:client:updateCash', player.Data.PlayerId, result[1].cash - amount)
	end)
end

TBCore.Functions.setCash = function(player, amount)
	local identifier = player.Data.identifier
	local pCid = player.Data.cid

	exports['ghmattimysql']:execute('UPDATE players SET cash = @cash WHERE identifier = @identifier AND cid = @cid', {
		['@identifier'] = identifier,
		['@cash'] = amount,
		['@cid'] = pCid
	})

	TBCore.Functions.addMessage('SUCCESS', player.Data.PlayerId, 'SYSTEM', nil, 'Your cash has been set to: ^*$'..amount)

	TriggerClientEvent('tb-ui:client:updateCash', player.Data.PlayerId, amount, "add", amount)
	TriggerClientEvent('tb-core:client:updateCash', player.Data.PlayerId, amount)
end

TBCore.Functions.setGroup = function(player, group)
	local identifier = player.Data.identifier
	local pCid = player.Data.cid

	exports['ghmattimysql']:execute('UPDATE players SET usergroup = @usergroup WHERE identifier = @identifier AND cid = @cid', {
		['@identifier'] = identifier,
		['@cid'] = pCid,
		['@usergroup'] = group
	})

	print('Function group: '..group)
	TriggerClientEvent('tb-core:client:updateGroup', player.Data.PlayerId, group)
end

TBCore.Functions.GiveCash = function(player, amount)
	local identifier = player.Data.identifier
	local pCid = player.Data.cid

	exports['ghmattimysql']:execute('SELECT * FROM players WHERE identifier = @identifier AND cid = @cid', {['@identifier'] = identifier, ['@cid'] = pCid}, function(user)
		local total = user[1].cash + amount
		exports['ghmattimysql']:execute('UPDATE players SET cash = @cash WHERE identifier = @identifier AND cid = @cid', {
			['@identifier'] = identifier,
			['@cash'] = total,
			['@cid'] = pCid
		})
		TBCore.Functions.addMessage('SUCCESS', player.Data.PlayerId, 'SYSTEM', nil, 'There is: ^*$'..amount..'^r added to your cash')
		TriggerClientEvent('tb-ui:client:updateCash', player.Data.PlayerId, total, "add", amount)
		TriggerClientEvent('tb-core:client:updateCash', player.Data.PlayerId, total)
	end)
end

-- BANK

TBCore.Functions.addBank = function(player, amount)
	local identifier = player.Data.identifier
	local pCid = player.Data.cid
	
	exports['ghmattimysql']:execute('SELECT * FROM players WHERE identifier = @identifier AND cid = @cid', {['@identifier'] = identifier, ['@cid'] = pCid}, function(result)
		local add = result[1].bank + amount
		exports['ghmattimysql']:execute('UPDATE players SET bank = @bank WHERE identifier = @identifier AND cid = @cid', {
			['@identifier'] = identifier, 
			['@bank'] = add,
			['@cid'] = pCid
		})

		TriggerClientEvent('tb-ui:client:updateBank', player.Data.PlayerId, add, "add", amount)
		TriggerClientEvent('tb-core:client:updateBank', player.Data.PlayerId, add)
	end)
end

TBCore.Functions.removeBank = function(player, amount)
	local identifier = player.Data.identifier
	local pCid = player.Data.cid
	
	exports['ghmattimysql']:execute('SELECT * FROM players WHERE identifier = @identifier AND cid = @cid', {['@identifier'] = identifier, ['@cid'] = pCid}, function(result)
		local add = result[1].bank - amount
		exports['ghmattimysql']:execute('UPDATE players SET bank = @bank WHERE identifier = @identifier AND cid = @cid', {
			['@identifier'] = identifier, 
			['@bank'] = add,
			['@cid'] = pCid
		})
		TriggerClientEvent('tb-ui:client:updateBank', player.Data.PlayerId, add, "remove", amount)
		TriggerClientEvent('tb-core:client:updateBank', player.Data.PlayerId, add)
	end)
end

TBCore.Functions.setBank = function(player, amount)
	local identifier = player.Data.identifier
	local pCid = player.Data.cid

	exports['ghmattimysql']:execute('UPDATE players SET bank = @bank WHERE identifier = @identifier AND cid = @cid', {
		['@identifier'] = identifier,
		['@bank'] = amount,
		['@cid'] = pCid
	})

	TBCore.Functions.addMessage('SUCCESS', player.Data.PlayerId, 'SYSTEM', nil, 'Your bank balance has been set to: ^*$'..amount)
	TriggerClientEvent('tb-core:client:updateBank', player.Data.PlayerId, amount)
end

TBCore.Functions.giveBank = function(player, amount)
	local identifier = player.Data.identifier
	local pCid = player.Data.cid

	exports['ghmattimysql']:execute('SELECT * FROM players WHERE identifier = @identifier AND cid = @cid', {['@identifier'] = identifier, ['@cid'] = pCid}, function(user)
		local total = user[1].bank + amount
		exports['ghmattimysql']:execute('UPDATE players SET bank = @bank WHERE identifier = @identifier AND cid = @cid', {
			['@identifier'] = identifier,
			['@bank'] = total,
			['@cid'] = pCid
		})
		TBCore.Functions.addMessage('SUCCESS', player.Data.PlayerId, 'SYSTEM', nil, 'There is: ^*$'..amount..'^r added to your bank balance')
		TriggerClientEvent('tb-core:client:updateBank', player.Data.PlayerId, total)
	end)
end

-- CRYPTO

TBCore.Functions.removeCrypto = function(player, crypto, amount)
	local identifier = player.Data.identifier
	local pCid = player.Data.cid
	
	exports['ghmattimysql']:execute('SELECT * FROM player_cryptos WHERE identifier = @identifier AND cid = @cid AND crypto = @crypto', {['@identifier'] = identifier, ['@crypto'] = crypto}, function(result)

		exports['ghmattimysql']:execute('UPDATE player_cryptos SET amount = @amount WHERE identifier = @identifier AND cid = @cid AND crypto = @crypto', {
			['@identifier'] = identifier,
			['@crypto'] = crypto, 
			['@amount'] = result[1].amount - amount,
			['@cid'] = pCid
		})

	end)
end

TBCore.Functions.addCrypto = function(player, crypto, amount)
	local identifier = player.Data.identifier
	local pCid = player.Data.cid
		
	exports['ghmattimysql']:execute('SELECT * FROM player_cryptos WHERE identifier = @identifier AND cid = @cid AND crypto = @crypto', {['@identifier'] = identifier, ['@crypto'] = crypto}, function(result)

		exports['ghmattimysql']:execute('UPDATE player_cryptos SET amount = @amount WHERE identifier = @identifier AND cid = @cid AND crypto = @crypto', {
			['@identifier'] = identifier,
			['@crypto'] = crypto, 
			['@amount'] = result[1].amount + amount,
			['@cid'] = pCid
		})

	end)
end

TBCore.Functions.giveItem = function(player, item, amount)
	local id 			= player.Data.identifier
	local pCid 			= player.Data.cid
	local pWeight 		= player.Functions.getWeight()
	local itemweight 	= amount * TBCore.Items[item].weight
	local itemlabel 	= TBCore.Items[item].label

	if pWeight + itemweight < TBInventory.MaxPlayerKG then
		exports['ghmattimysql']:execute('SELECT * FROM player_inventory WHERE identifier = @identifier AND cid = @cid AND item = @item', {['@identifier'] = id, ['@cid'] = pCid, ['@item'] = item}, function(result)
			if result[1] then
				exports['ghmattimysql']:execute('UPDATE player_inventory SET amount = @amount WHERE identifier = @identifier AND cid = @cid AND item = @item', {
					['@identifier'] = id,
					['@item'] = item, 
					['@amount'] = result[1].amount + amount,
					['@cid'] = pCid
				})
			else
				exports['ghmattimysql']:execute('INSERT INTO player_inventory (`identifier`, `item`, `amount`, `cid`) VALUES (@identifier, @item, @amount, @cid)', { 
					['identifier'] = id, 
					['item'] = item, 
					['amount'] = amount,
					['cid'] = pCid
				})
			end
		end)
		TriggerClientEvent('tb-inventory:client:addItem', player.Data.PlayerId, item, itemlabel)
	else
		TBCore.Functions.addMessage('DANGER', player.Data.PlayerId, 'SYSTEM', nil, 'You dont have enough space!')
	end
end

TBCore.Functions.giveWeapon = function(player, weapon, amount, weaponid)
	local id = player.Data.identifier
	local pCid = player.Data.cid
	local pWeight = player.Functions.getWeight()
	local itemweight = TBCore.Items[weapon].weight
	
	if pWeight + itemweight < TBInventory.MaxPlayerKG then
		exports['ghmattimysql']:execute('INSERT INTO player_weapons (`identifier`, `weapon`, `bullets`, `cid`, `weaponid`) VALUES (@identifier, @weapon, @bullets, @cid, @weaponid)', { 
			['identifier'] = id, 
			['weapon'] = weapon, 
			['bullets'] = amount,
			['cid'] = pCid,
			['weaponid'] = weaponid
		})
	else
		TBCore.Functions.addMessage('DANGER', player.Data.PlayerId, 'SYSTEM', nil, 'You dont have enough space!')
	end
end

TBCore.Functions.clearInventory = function(player, id)
	local pCid = player.Data.cid
	exports['ghmattimysql']:execute('DELETE FROM player_inventory WHERE identifier = @identifier AND cid = @cid', { ['@identifier'] = id})
end

TBCore.Functions.updateInventoryItem = function(pData, item, amount)
	local id = pData.Data.identifier
	local cid = pData.Data.cid

	print('yeet')

	exports['ghmattimysql']:execute('UPDATE player_inventory SET amount = @amount WHERE identifier = @identifier AND cid = @cid AND item = @item', {
		['@identifier'] = id, 
		['@cid'] = cid,
		['@item'] = item,
		['@amount'] = amount
	})
end

TBCore.Functions.removeInventoryItem = function(pData, item)
	local id = pData.Data.identifier
	local cid = pData.Data.cid

	exports['ghmattimysql']:execute('DELETE FROM player_inventory WHERE identifier = @identifier AND cid = @cid AND item = @item', {['@identifier'] = id, ['@cid'] = cid, ['@item'] = item})

	pData.inventory = {}
	Citizen.Wait(400)
	exports['ghmattimysql']:execute('SELECT * FROM player_inventory WHERE identifier = @identifier AND cid = @cid', {['@identifier'] = id, ['@cid'] = cid}, function(inventory)
		for i=1, #inventory, 1 do
			table.insert(pData.inventory, {
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
	end)
	TriggerClientEvent('tb-inventory:client:refreshInventory', pData.Data.PlayerId)
end

TBCore.Functions.removeWeaponItem = function(pData, weapon, weaponid)
	local id = pData.Data.identifier
	local cid = pData.Data.cid

	exports['ghmattimysql']:execute('DELETE FROM player_weapons WHERE identifier = @identifier AND cid = @cid AND weapon = @weapon AND weaponid = @weaponid', {['@identifier'] = id, ['@cid'] = cid, ['@weapon'] = weapon, ['@weaponid'] = weaponid})

	pData.weapons = {}
	Citizen.Wait(400)
	exports['ghmattimysql']:execute('SELECT * FROM player_weapons WHERE identifier = @identifier AND cid = @cid', {['@identifier'] = id, ['@cid'] = cid}, function(weapons)
		for i=1, #weapons, 1 do
			table.insert(pData.weapons, {
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
	end)
	TriggerClientEvent('tb-inventory:client:refreshInventory', pData.Data.PlayerId)
end

TBCore.Functions.CreatePickup = function(type, name, count, label, player)
	local pickupId = (TBCore.PickupId == 65635 and 0 or TBCore.PickupId + 1)

	if type == 'item' then
		TBCore.Pickups[pickupId] = {
			type  = type,
			name  = name,
			count = count,
			label = label
		}
	elseif type == 'weapon' then
		TBCore.Pickups[pickupId] = {
			type  = type,
			name  = name,
			count = count,
			label = label
		}
	end

	TriggerClientEvent('tb-core:client:pickup', -1, pickupId, player)
	TBCore.PickupId = pickupId
end