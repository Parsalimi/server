local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}
local blip = nil
local shown = false
local power = false
local radartablet = false
local blipcreat = false

Citizen.CreateThread(function()

	REQUEST_NUI_FOCUS(false) 

	while true do
		Citizen.Wait(1) 
		RemoveBlip(blip)
		if IsControlJustPressed(0, Keys['NENTER'])then
			if shown == true then 
				shown = false 
				SendNUIMessage({
					radar 		= shown, 
					fmodel 		= '', 
					plate 		= '', 
					patrolSpeed	= 0,
					speedkm 	= 0, 
					speedmph 	= 0,
					radartablet = radartablet
				})
			else 
				shown = true 	
			end
				
		end
		
		if shown == true then
			if IsControlJustPressed(0, Keys['N+'])then
				SendNUIMessage({
					type 	= 'limit', 
					status 	= 'up'
				})
			end

			if IsControlJustPressed(0, Keys['N-'])then
				SendNUIMessage({
					type 	= 'limit', 
					status 	= 'down'
				})
			end

			if IsControlJustPressed(0, Keys['N9'])then
				
				if power == true then 
					power = false
				else 
					power = true 
				end			

				SendNUIMessage({
					type 	= 'power',
					power 	= power
				})
			end

			if IsControlJustPressed(0, Keys['N7'])then

				if power == true then 
					power = false
				else 
					power = true 	
				end
				REQUEST_NUI_FOCUS(power) 
			end

			if shown then	
				local ped = GetPlayerPed(-1)
				local pos = GetEntityCoords(ped)
				
				if ( IsPedSittingInAnyVehicle( ped ) ) then 
					local vehicle = GetVehiclePedIsIn( ped, false )

					if ( GetPedInVehicleSeat( vehicle, -1 ) == ped and GetVehicleClass( vehicle ) == 18 ) then 
						-- Patrol speed 
						local vehicleSpeed = round( GetVehSpeed( vehicle ), 0 )

						patrolSpeed = FormatSpeed( vehicleSpeed )

						SendNUIMessage({ 
							patrolSpeed	= patrolSpeed,
							radar 		= shown
						})
											

						local carM = GetClosestVehicle(pos['x'], pos['y'], pos['z'], 15.0,0,70)
						
						if blipcreat == true then
							if patrolSpeed == '000' then
								RemoveBlip(blip)
								blip = AddBlipForEntity(ped)

								SetBlipColour(blip, 30)
								SetBlipSprite(blip, 56)
								SetBlipScale(blip, 0.5)
								BeginTextCommandSetBlipName("STRING")
								AddTextComponentString('Polis Radarı')
								EndTextCommandSetBlipName(blip)
							else
								RemoveBlip(blip)
							end
						end

						if carM ~=nil then
							local model = GetDisplayNameFromVehicleModel(GetEntityModel(carM))
							local plate=GetVehicleNumberPlateText(carM)
							local herSpeedKm= GetEntitySpeed(carM)*3.6
							local herSpeedMph= GetEntitySpeed(carM)*2.236936
						
							SendNUIMessage({
								radar 		= shown, 
								model 		= model, 
								patrolSpeed	= patrolSpeed,
								plate 		= plate, 
								speedkm 	= herSpeedKm, 
								speedmph 	= herSpeedMph,
								radartablet = radartablet
							})	
						end
					end
				end	
			end  
		end
	end
end)

RegisterNUICallback("yourpradar-callback",function(data)
	TriggerEvent('radartablet:radarget',data)	
end)


function REQUEST_NUI_FOCUS(bool)
	SetNuiFocus(bool, bool) -- focus, cursor
end

RegisterNUICallback("radar-callback",function(data)
	-- Do tablet hide shit
	if data.load then
		power = true
	elseif data.hide then
		REQUEST_NUI_FOCUS(false) -- Don't REQUEST_NUI_FOCUS here
		power = false
	elseif data.click then
	-- if u need click events
	end
end)

function round( num )
    return tonumber( string.format( "%.0f", num ) )
end

function GetVehSpeed( veh )
    return GetEntitySpeed( veh ) * 3.6
end

function oppang( ang )
    return ( ang + 180 ) % 360 
end 

function FormatSpeed( speed )
    return string.format( "%03d", speed )
end 
