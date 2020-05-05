ObjetcSpawn = {}
ESX                           = nil


Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(10)
  end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
  if Config[PlayerData.job.name]~=nil then
    ObjetcSpawn = Config[PlayerData.job.name]
  end
end)



RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  ObjetcSpawn = {}
  PlayerData.job = job
  if Config[PlayerData.job.name]~=nil then
    ObjetcSpawn = Config[PlayerData.job.name]
  end
end)

function DeleteObjetc()
  if ObjetcSpawn[1]~=nil then
    local object = nil
    local coords = GetEntityCoords(GetPlayerPed(-1))
    for i=1,#ObjetcSpawn do
      object = GetClosestObjectOfType(coords.x,  coords.y,  coords.z,  3.0,  GetHashKey(ObjetcSpawn[i].value), false, false, false)
      if DoesEntityExist(object) then
          DeleteEntity(object)
        break
      end
    end
  else
    ESX.ShowNotification('Pas d\'objet')
  end
end

RegisterNetEvent('esx_object:menu')
AddEventHandler('esx_object:menu',function()
  if ObjetcSpawn[1]~=nil then
    local options = {}
    for i = 1,#ObjetcSpawn do
      table.insert(options,ObjetcSpawn[i])
    end
    table.insert(options,{label='Supprimer',value='delete'})
    ESX.UI.Menu.CloseAll()
    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'spawn',
      {
        title    = 'Objets',
        align    = 'top-left',
        elements = options
      },
      function(data, menu)

        if data.current.value ~= 'delete' then
          local model     = data.current.value
          local playerPed = GetPlayerPed(-1)
          local coords    = GetEntityCoords(playerPed)
          local forward   = GetEntityForwardVector(playerPed)
          local x, y, z   = table.unpack(coords + forward * 1.0)
          z=z + data.current.zcoord

          ESX.Game.SpawnObject(model, {
            x = x,
            y = y,
            z = z
          }, function(obj)
            PlaceObjectOnGroundProperly(obj)
            SetEntityHeading(obj, GetEntityHeading(playerPed))
          end)
        else
          DeleteObjetc()
        end

      end,
      function(data, menu)
        menu.close()
      end
    )
  end
end)
