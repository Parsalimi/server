  local blips = {
  -- Example {title="", colour=, id=, x=, y=, z=},
  -- Postes de polices
  {title="Race", colour=2, id=523, x=479.18, y=-3111.54, z=6.08},
  {title="Bank", colour=2, id=106, x=236.43, y=217.4, z=106.29},
  {title="Casino & Resort", colour=27, id=590, x=918.84, y=51.46, z=80.9},

  }
Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.9)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)
