local MFD = DnaTracker

RegisterNetEvent('DnaTracker:PlaceEvidenceS')
AddEventHandler('DnaTracker:PlaceEvidenceS', function(pos, obj, weapon, weaponType) 
  local xPlayer = ESX.GetPlayerFromId(source)
  while not xPlayer do Citizen.Wait(0); ESX.GetPlayerFromId(source); end
  local playername = ''
  MySQL.Async.fetchAll("SELECT * FROM users WHERE identifier=@identifier",{['@identifier'] = xPlayer.identifier},function(data)
    for key,val in pairs(data) do
      playername = val.firstname .. " " .. val.lastname
    end
    TriggerClientEvent('DnaTracker:PlaceEvidenceC', -1, pos, obj, playername, weapon, weaponType)
  end)
end)

ESX.RegisterServerCallback('DnaTracker:PickupEvidenceS', function(source, cb, evidence)
  local xPlayer = ESX.GetPlayerFromId(source)
  while not xPlayer do Citizen.Wait(0); ESX.GetPlayerFromId(source); end
  local cbData
  if evidence.obj == MFD.BloodObject then
    local count = xPlayer.getInventoryItem('bloodsample')
    if count and count.count and count.count > 0 then cbData = false
    else
      xPlayer.addInventoryItem('bloodsample', 1)
      TriggerClientEvent('DnaTracker:PickupEvidenceC', -1, evidence)
      cbData = true
    end
  elseif evidence.obj == MFD.ResidueObject then
    local count = xPlayer.getInventoryItem('bulletsample')
    if count and count.count and count.count > 0 then cbData = false
    else
      xPlayer.addInventoryItem('bulletsample', 1)
      TriggerClientEvent('DnaTracker:PickupEvidenceC', -1, evidence)
      cbData = true
    end
  end
  cb(cbData)
end)

ESX.RegisterServerCallback('DnaTracker:GetJob', function(source, cb, evidence)
  local xPlayer = ESX.GetPlayerFromId(source)
  while not xPlayer do Citizen.Wait(0); ESX.GetPlayerFromId(source); end
  local cbData = xPlayer.getJob()
  cb(cbData)
end)

ESX.RegisterUsableItem('dnaanalyzer', function(source)
  local xPlayer = ESX.GetPlayerFromId(source)
  while not xPlayer do Citizen.Wait(0); ESX.GetPlayerFromId(source); end
  if xPlayer.getInventoryItem('bloodsample').count > 0 then 
    xPlayer.removeInventoryItem('bloodsample', 1)
    TriggerClientEvent('DnaTracker:AnalyzeDNA', source)
  end
end)

ESX.RegisterUsableItem('ammoanalyzer', function(source)
  local xPlayer = ESX.GetPlayerFromId(source)
  while not xPlayer do Citizen.Wait(0); ESX.GetPlayerFromId(source); end
  if xPlayer.getInventoryItem('bulletsample').count > 0 then 
    xPlayer.removeInventoryItem('bulletsample', 1)
    TriggerClientEvent('DnaTracker:AnalyzeAmmo', source)
  end
end)

AddEventHandler('playerConnected', function(...) MFD:DoLogin(source); end)