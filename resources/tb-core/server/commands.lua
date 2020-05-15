TriggerEvent('tb-core:server:addGroupCommand', 'sv', 'admin', function(source, args, user)
	TBCore.Functions.SpawnVehicle(source, args[1], args[1])
end, function(source, args, user)
	TBCore.Functions.addMessage('DANGER', source, 'SYSTEM', nil, 'You dont have enough permissions')
end, {help = "Spawn a vehicle", params = {{name = "vehicle", help = "Name of the vehicle"}}})

TriggerEvent('tb-core:server:addGroupCommand', 'dv', 'admin', function(source, args, user)
	TBCore.Functions.DeleteVehicle(source)
end, function(source, args, user)
	TBCore.Functions.addMessage('DANGER', source, 'SYSTEM', nil, 'You dont have enough permissions')
end, {help = "Delete nearest vehicle"})

TriggerEvent('tb-core:server:addGroupCommand', 'cac', 'admin', function(source, args, user)
	TriggerClientEvent('chat:clear', -1)
end, function(source, args, user)
	TBCore.Functions.addMessage('DANGER', source, 'SYSTEM', nil, 'You dont have enough permissions')
end, {help = "Clear the chat"})

TriggerEvent('tb-core:server:addGroupCommand', 'save', 'admin', function(source, args, user)
	local identifier = GetPlayerIdentifiers(source)[1]

	TBCore.DB.SavePlayer(source, identifier, TBCore.lastPosition[source])

	TBCore.Functions.addMessage('WARNING', source, 'SYSTEM', nil, 'You saved '..GetPlayerName(source))
end, function(source, args, user)
	TBCore.Functions.addMessage('DANGER', source, 'SYSTEM', nil, 'You dont have enough permissions')
end, {help = "Save a player"})

TriggerEvent('tb-core:server:addGroupCommand', 'setcash', 'admin', function(source, args, user)
	local user 		= tonumber(args[1])
	local amount 	= tonumber(args[2])
	local Player 	= TBCore.Functions.getPlayer(user)

	if user and amount then
		if Player then
			Player.Functions.setCash(amount)
		else
			TBCore.Functions.addMessage('WARNING', source, 'SYSTEM', nil, 'Player not online')
		end
	end
end, function(source, args, user)
	TBCore.Functions.addMessage('DANGER', source, 'SYSTEM', nil, 'You dont have enough permissions')
end, {help = "Set cash amount of a player", params = {{name = "id", help = "Player ID"}, {name = "amount", help = "The amount of money"}}})

TriggerEvent('tb-core:server:addGroupCommand', 'givecash', 'admin', function(source, args, user)
	local user 		= tonumber(args[1])
	local amount 	= tonumber(args[2])
	local Player 	= TBCore.Functions.getPlayer(user)

	if user and amount then
		if Player then
			Player.Functions.GiveCash(amount)
		else
			TBCore.Functions.addMessage('WARNING', source, 'SYSTEM', nil, 'Player not online')
		end
	end
end, function(source, args, user)
	TBCore.Functions.addMessage('DANGER', source, 'SYSTEM', nil, 'You dont have enough permissions')
end, {help = "Set cash amount of a player", params = {{name = "id", help = "Player ID"}, {name = "amount", help = "The amount of money"}}})

TriggerEvent('tb-core:server:addGroupCommand', 'setbank', 'admin', function(source, args, user)
	local user 		= tonumber(args[1])
	local amount 	= tonumber(args[2])
	local Player 	= TBCore.Functions.getPlayer(user)

	if user and amount then
		if Player then
			Player.Functions.setBank(amount)
		else
			TBCore.Functions.addMessage('WARNING', source, 'SYSTEM', nil, 'Player not online')
		end
	end
end, function(source, args, user)
	TBCore.Functions.addMessage('DANGER', source, 'SYSTEM', nil, 'You dont have enough permissions')
end, {help = "Set bank amount of a player", params = {{name = "id", help = "Player ID"}, {name = "amount", help = "The amount of money"}}})

TriggerEvent('tb-core:server:addGroupCommand', 'givebank', 'admin', function(source, args, user)
	local user 		= tonumber(args[1])
	local amount 	= tonumber(args[2])
	local Player 	= TBCore.Functions.getPlayer(user)

	if user and amount then
		if Player then
			Player.Functions.giveBank(amount)
		else
			TBCore.Functions.addMessage('WARNING', source, 'SYSTEM', nil, 'Player not online')
		end
	end
end, function(source, args, user)
	TBCore.Functions.addMessage('DANGER', source, 'SYSTEM', nil, 'You dont have enough permissions')
end, {help = "Set cash amount of a player", params = {{name = "id", help = "Player ID"}, {name = "amount", help = "The amount of money"}}})

TriggerEvent('tb-core:server:addGroupCommand', 'giveitem', 'admin', function(source, args, user)
	local user 		= tonumber(args[1])
	local item 		= args[2]
	local amount 	= tonumber(args[3])
	local Player 	= TBCore.Functions.getPlayer(user)

	if user then
		if Player then
			if item then
				if amount then
					if TBCore.Items[item] then
						local itemweight = amount * TBCore.Items[item].weight
						if Player.Functions.getWeight() + itemweight < TBInventory.MaxPlayerKG then
							Player.Functions.giveItem(item, amount)
							TriggerClientEvent('tb-core:client:notify', user, 'success', 'You\'ve been given '..amount..'x '..TBCore.Items[item].label)
							TBCore.Functions.addMessage('SUCCESS', source, 'SYSTEM', nil, 'You gave ^*'..amount..'^rx ^*'..TBCore.Items[item].label..'^r to ^*'..GetPlayerName(user))
							if user ~= source then
								TBCore.Functions.addMessage('SUCCESS', source, 'SYSTEM', nil, 'You recieved ^*'..amount..'^rx ^*'..TBCore.Items[item].label..'^r from ^*'..GetPlayerName(source))
							end
						else
							TBCore.Functions.addMessage('DANGER', source, 'SYSTEM', nil, 'This player does not have enough space!')
						end
					else
						TBCore.Functions.addMessage('DANGER', source, 'SYSTEM', nil, 'This is a invalid item!')
					end
				else
					TBCore.Functions.addMessage('WARNING', source, 'SYSTEM', nil, 'Specify a amount')
				end
			else
				TBCore.Functions.addMessage('WARNING', source, 'SYSTEM', nil, 'Specify a item')
			end
		else
			TBCore.Functions.addMessage('WARNING', source, 'SYSTEM', nil, 'Player not online')
		end
	else
		TBCore.Functions.addMessage('WARNING', source, 'SYSTEM', nil, 'Specify a player')
	end
end, function(source, args, user)
	TBCore.Functions.addMessage('DANGER', source, 'SYSTEM', nil, 'You dont have enough permissions')
end, {help = "Give a item to a player", params = {{name = "id", help = "Player ID"}, {name = "item", help = "The name of the item"}, {name = "amount", help = "The amount of the item"}}})

TriggerEvent('tb-core:server:addGroupCommand', 'giveweapon', 'admin', function(source, args, user)
	local user 		= tonumber(args[1])
	local item 		= args[2]
	local amount 	= tonumber(args[3])
	local Player 	= TBCore.Functions.getPlayer(user)

	if user then
		if Player then
			if item then
				if amount then
					if TBCore.Items[item] then
						local itemweight = TBCore.Items[item].weight
						if Player.Functions.getWeight() + itemweight < TBInventory.MaxPlayerKG then
							Player.Functions.giveWeapon(item, amount)
							TriggerClientEvent('tb-core:client:notify', user, 'success', 'You\'ve been given '..amount..'x '..TBCore.Items[item].label)
							TBCore.Functions.addMessage('SUCCESS', source, 'SYSTEM', nil, 'You gave a ^*'..TBCore.Items[item].label..'^r to ^*'..GetPlayerName(user)..' with ^*'..amount..'^r bullets ^*')
							if user ~= source then
								TBCore.Functions.addMessage('SUCCESS', source, 'SYSTEM', nil, 'You recieved a ^*'..TBCore.Items[item].label..'^r from ^*'..GetPlayerName(source)..' with ^*'..amount..'^r bullets ^*')
							end
						else
							TBCore.Functions.addMessage('DANGER', source, 'SYSTEM', nil, 'This player does not have enough space!')
						end
					else
						TBCore.Functions.addMessage('DANGER', source, 'SYSTEM', nil, 'This is a invalid item!')
					end
				else
					TBCore.Functions.addMessage('WARNING', source, 'SYSTEM', nil, 'Specify a amount')
				end
			else
				TBCore.Functions.addMessage('WARNING', source, 'SYSTEM', nil, 'Specify a item')
			end
		else
			TBCore.Functions.addMessage('WARNING', source, 'SYSTEM', nil, 'Player not online')
		end
	else
		TBCore.Functions.addMessage('WARNING', source, 'SYSTEM', nil, 'Specify a player')
	end
end, function(source, args, user)
	TBCore.Functions.addMessage('DANGER', source, 'SYSTEM', nil, 'You dont have enough permissions')
end, {help = "Give a item to a player", params = {{name = "id", help = "Player ID"}, {name = "weapon", help = "The weapon name (weapon_<name>)"}, {name = "bullets", help = "The amount of bullets"}}})

TriggerEvent('tb-core:server:addGroupCommand', 'refreshplayer', 'admin', function(source, args, user)
	local target = tonumber(args[1])
	local player = TBCore.Functions.getPlayer(target)
	if target ~= nil then
		if player then
			TriggerClientEvent('tb-core:client:refreshPlayer', target)
			TBCore.Functions.addMessage('SUCCESS', source, 'SYSTEM', nil, 'You refreshed '..GetPlayerName(target)..'\'s data!')
		else
			TBCore.Functions.addMessage('WARNING', source, 'SYSTEM', nil, 'Player not online')
		end
	else
		TBCore.Functions.addMessage('WARNING', source, 'SYSTEM', nil, 'Specify a player')
	end
end, function(source, args, user)
	TBCore.Functions.addMessage('DANGER', source, 'SYSTEM', nil, 'You dont have enough permissions')
end, {help = "Refresh a player by ID", params = {{name = "id", help = "ID of the Player"}}})

TriggerEvent('tb-core:server:addGroupCommand', 'setgroup', 'admin', function(source, args, user)
	local target = tonumber(args[1])
	local group = tostring(args[2])
	local player = TBCore.Functions.getPlayer(target)
	if target ~= nil then
		if player then
			if TBConfig.UserGroups[group] then
				player.Functions.setGroup(group)
				TBCore.Functions.addMessage('SUCCESS', target, 'SYSTEM', nil, 'Your usergroup has been set to: '..TBConfig.UserGroups[group].label)
			else
				TBCore.Functions.addMessage('WARNING', source, 'SYSTEM', nil, group..' is not a valid usergroup')
			end
		else
			TBCore.Functions.addMessage('WARNING', source, 'SYSTEM', nil, 'Player not online')
		end
	else
		TBCore.Functions.addMessage('WARNING', source, 'SYSTEM', nil, 'Specify a player')
	end
end, function(source, args, user)
	TBCore.Functions.addMessage('DANGER', source, 'SYSTEM', nil, 'You dont have enough permissions')
end, {help = "Set a player's usergroup", params = {{name = "id", help = "ID of the Player"}, {name = "usergroup", help = "Name of the usergroup"}}})

TriggerEvent('tb-core:server:addCommand', 'id', function(source, args, user)
	TBCore.Functions.addMessage('INFO', source, 'SYSTEM', nil, 'Server ID: '..source)
end, {help = "Get your own Player ID"})

-- TriggerEvent('tb-core:server:addCommand', 'clearinventory', function(source, args, user)
-- 	local target = tonumber(args[1])
-- 	local player = TBCore.Functions.getPlayer(target)
-- 	if target ~= nil then
-- 		if player then
-- 			player.Functions.clearInventory()
-- 		else
-- 			TBCore.Functions.addMessage('WARNING', source, 'SYSTEM', nil, 'Player not online')
-- 		end
-- 	else
-- 		TBCore.Functions.addMessage('WARNING', source, 'SYSTEM', nil, 'Specify a player')
-- 	end
-- end, {help = "Refresh a player by ID", params = {{name = "id", help = "ID of the Player"}}})

-- TriggerEvent('tb-core:server:addCommand', 'health', function(source, args, user)
-- 	TriggerClientEvent('tb-core:client:isDead', -1)
-- end, {help = "Print current health"})
