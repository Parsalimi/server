TBCore.DB 						= {}
TBCore.Player					= {}

TBCore.DB.LoadCharacter = function(source, license, identifier, cid)
	local src = source
	local PlayerData = {
		identifier = identifier,
		license = license,
		name = GetPlayerName(src),
		cash = TBConfig.DefaultSettings.defaultCash,
		bank = TBConfig.DefaultSettings.defaultBank
	}

	TBCore.Functions.LoadPlayer(source, PlayerData, cid)
end

TBCore.DB.doesUserExist = function(identifier, callback)
	TriggerEvent('tb-core:server:doesUserExist', identifier, callback)
end

TBCore.DB.SavePlayer = function(source, identifier, position)
	exports['ghmattimysql']:execute('UPDATE players SET position = @position WHERE identifier = @identifier', {
		['@identifier'] = identifier, 
		['@position'] = json.encode(position)
	})

	print('[^2TBCore^0] '..GetPlayerName(source)..' was saved successfully!')
end