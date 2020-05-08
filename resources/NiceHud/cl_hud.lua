----- Made by Tovermannetje For the People -> Tover's Services https://discord.me/tover

ESX = nil
local isPlayerLoaded = false
local xPlayer = nil
local screenRes = {
	x = nil, 
	y = nil
}

-- talking
local prox = 0.0
local isTalking = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	isPlayerLoaded = true
	TriggerEvent('es:setMoneyDisplay', 0.0)
	ESX.UI.HUD.SetDisplay(0.0)
	xPlayer = xPlayer

	prox = Config.proximity.whisper
	NetworkSetTalkerProximity(prox)
end)

Citizen.CreateThread(function()
	while true do 
		if isPlayerLoaded then 
			local resX, resY = GetActiveScreenResolution()
			if screenRes.x == nil or screenRes.x ~= resX or screenRes.y == nil or screenRes.y ~= resY then 
				MoveHudToCorrectPos()
			end
		end
		Citizen.Wait(10000)
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(250)
		if NetworkIsPlayerTalking(PlayerId()) then 
			isTalking = true
		else
			isTalking = false
		end

		local pH = GetEntityHealth(PlayerPedId())
		local pA = GetPedArmour(PlayerPedId())
		SendNUIMessage({action = "setTalking", value = isTalking})
		SendNUIMessage({action = "updatePlayerHealth", values = {health = pH-100, armor = pA}})	
	end
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(7)
		if Config.allowProximityChange then 
			if IsControlJustPressed(1, 243) then
				if prox <= Config.proximity.whisper then
					prox = Config.proximity.normal
					vprox = "normal"
				elseif prox == Config.proximity.normal then
					prox = Config.proximity.shout
					vprox = "shout"
				elseif prox >= Config.proximity.shout then
					prox = Config.proximity.whisper
					vprox = "whisper"
				end
				NetworkSetTalkerProximity(prox)
				SendNUIMessage({action = "setProximity", value = vprox})
			end
		end
	end
end)

function MoveHudToCorrectPos()
	local safezone = GetSafeZoneSize()
	local safezone_x = 1.0 / 20.0
	local safezone_y = 1.0 / 20.0
	local aspect_ratio = GetAspectRatio(0)
	screenRes.x, screenRes.y = GetActiveScreenResolution()
	local xscale = 1.0 / screenRes.x
	local yscale = 1.0 / screenRes.y
	local Minimap = {}
	Minimap.width = (xscale * (screenRes.x / (4 * aspect_ratio)))
	Minimap.height = yscale * (screenRes.y / 5.674)
	Minimap.left_x = (xscale * (screenRes.x * (safezone_x * ((math.abs(safezone - 1.0)) * 10))))
	Minimap.bottom_y = (1.0 - yscale * (screenRes.y * (safezone_y * ((math.abs(safezone - 1.0)) * 10))))
	Minimap.right_x = Minimap.left_x + Minimap.width
	Minimap.top_y = Minimap.bottom_y - Minimap.height
	Minimap.xunit = xscale
	Minimap.yunit = yscale
	SendNUIMessage({action = "updateHudPosition", value=Minimap})
end

RegisterNetEvent('tover_hud:toggle')
AddEventHandler('tover_hud:toggle', function(show)
	SendNUIMessage({action = "toggle", show = show})
	DisplayRadar(show)
end)

--RegisterNetEvent('esx_status:onTick')
AddEventHandler('esx_status:onTick', function(status)
	SendNUIMessage({action = "updateStatus", status = status})
end)
