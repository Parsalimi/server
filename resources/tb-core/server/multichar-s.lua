RegisterServerEvent('tb-core:multichar:server:playerJoin')
AddEventHandler('tb-core:multichar:server:playerJoin', function()
    local src = source
    local id
    for k,v in ipairs(GetPlayerIdentifiers(src))do
        if string.sub(v, 1, string.len("steam:")) == "steam:" then
            id = v
            break
        end
    end

    if not id then
        DropPlayer(src, "[TBCore] We were unable to detect your SteamID, try to reconnect with Steam open.")
    else
        TriggerClientEvent('tb-core:multichar:client:setupCharacters', src)
    end
end)

RegisterServerEvent('tb-core:multichar:server:charSelect')
AddEventHandler('tb-core:multichar:server:charSelect', function(cid)
    local src = source
    local identifier = GetPlayerIdentifiers(src)[1]
    local license = GetPlayerIdentifiers(src)[2]

    TBCore.DB.LoadCharacter(src, license, identifier, cid)
end)

TBCore.Functions.RegisterServerCallback('tb-core:multichar:server:getChar', function(source, cb)
    local id = GetPlayerIdentifiers(source)[1]

    exports['ghmattimysql']:execute('SELECT * FROM players WHERE identifier = @identifier', {['@identifier'] = id}, function(result)
        if result then
            cb(result)
        end
    end)
end)

TBCore.Functions.RegisterServerCallback('tb-core:multichar:server:refreshChars', function(source, cb)
    local id = GetPlayerIdentifiers(source)[1]

    exports['ghmattimysql']:execute('SELECT * FROM players WHERE identifier = @identifier', {['@identifier'] = id}, function(result)
        if result then
            cb(result)
        end
    end)
end)

RegisterServerEvent('tb-core:multichar:server:deleteChar')
AddEventHandler('tb-core:multichar:server:deleteChar', function(cid)
    local src = source
    local identifier = GetPlayerIdentifiers(src)[1]

    exports['ghmattimysql']:execute('DELETE FROM players WHERE identifier = @identifier AND cid = @cid', {['@identifier'] = identifier, ['@cid'] = cid})
end)

RegisterServerEvent('tb-core:multichar:server:createCharacter')
AddEventHandler('tb-core:multichar:server:createCharacter', function(cData)
    local src = source
    local identifier = GetPlayerIdentifiers(src)[1]
    local license = GetPlayerIdentifiers(src)[2]
    local name = GetPlayerName(src)
    local cid = cData.cid

    local bsn = math.random(100000000, 999999999)
    local randomNum = math.random(100000000000, 999999999999)
    local giroNum = math.random(1, 9)

    exports['ghmattimysql']:execute('INSERT INTO players (`identifier`, `license`, `name`, `cid`, `cash`, `bank`, `bsn`, `banknumber`, `slotname`, `firstname`, `tussenvoegsel`, `lastname`, `sex`, `dob`, `position`, `phone`) VALUES (@identifier, @license, @name, @cid, @cash, @bank, @bsn, @banknumber, @slotname, @firstname, @tussenvoegsel, @lastname, @sex, @dob, @position, @phone)', {
        ['identifier'] = identifier,
        ['license'] = license,
        ['name'] = name,
        ['cid'] = cid,
        ['cash'] = TBConfig.DefaultSettings.defaultCash,
        ['bank'] = TBConfig.DefaultSettings.defaultBank,
        ['bsn'] = bsn,
        ['banknumber'] = "NL0" ..giroNum.. "TB" ..randomNum,
        ['slotname'] = cData.slotname,
        ['firstname'] = cData.firstname,
        ['tussenvoegsel'] = cData.tussenvoegsel,
        ['lastname'] = cData.lastname,
        ['sex'] = cData.sex,
        ['dob'] = cData.dob,
        ['position'] = json.encode(TBConfig.spawnPosition),
        ['phone'] = "0" .. math.random(600000000,699999999)
    })
end)
