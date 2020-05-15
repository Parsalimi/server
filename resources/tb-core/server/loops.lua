RegisterServerEvent('tb-core:server:updateLocation')
AddEventHandler('tb-core:server:updateLocation', function(lastPosition)
    TBCore.lastPosition[source] = lastPosition
end)

Citizen.CreateThread(function()
    while true do
        TBCore.Functions.cryptoFloat('tbcoin')

        Citizen.Wait(TBConfig.DefaultSettings.floatDelay)
    end
end)