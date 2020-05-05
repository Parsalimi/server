-- BU EKLENTİ OTUKEN ROLEPLAY SUNUCUSU ADINA YAPILMIŞ DÜZENLENMİŞTİR.
-- www.fivemturk.com | FORUMU ÜYELERİ İCİN ÜCRETSİZ OLARAK VERİLMEKTEDİR.
-- İletişim icin : Raider#1531
-- www.otukenweb.com

PedStatus = 0

raiderWeapons={ "WEAPON_SNIPERRIFLE", "WEAPON_HEAVYSNIPER", "WEAPON_MARKSMANRIFLE", "WEAPON_MARKSMANRIFLE_MK2", "WEAPON_RPG", "WEAPON_GRENADELAUNCHER", "WEAPON_GRENADELAUNCHER_SMOKE", "WEAPON_MINIGUN", "WEAPON_FIREWORK", "WEAPON_RAILGUN", "WEAPON_HOMINGLAUNCHER", "WEAPON_COMPACTLAUNCHER", "WEAPON_RAYMINIGUN", "WEAPON_GRENADE", "WEAPON_BZGAS", "WEAPON_MOLOTOV", "WEAPON_STICKYBOMB", "WEAPON_PROXMINE", "WEAPON_SNOWBALL", "WEAPON_PIPEBOMB", "WEAPON_BALL", "WEAPON_SMOKEGRENADE", "WEAPON_ROCKET", "WEAPON_EXPLOSION ", "WEAPON_FLARE", "WEAPON_MUSKET" }

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)
		for k,v in ipairs(raiderWeapons) do
			Citizen.Wait(1)
			N_0x4757f00bc6323cfe(GetHashKey(v), 0.0)
			if HasPedGotWeapon(PlayerPedId(),GetHashKey(v),false) == 1 then
				RemoveWeaponFromPed(PlayerPedId(),GetHashKey(v))
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
			Citizen.Wait(1)
			N_0x4757f00bc6323cfe(-1553120962, 0.0) 
			N_0x4757f00bc6323cfe(539292904, 0.0)
			N_0x4757f00bc6323cfe(487013001, 1.2)    
			N_0x4757f00bc6323cfe(324506233, 0.0) 
			N_0x4757f00bc6323cfe(-544306709, 0.0) 
			N_0x4757f00bc6323cfe(GetHashKey("WEAPON_NIGHTSTICK"), 0.1) 
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- raiderLIST OBJECTS -- CEKİLEN SİLAHLARI DİREKT OLARAK HİLECİNİN VEYA TÜM OYUNCULARIN ÜZERİNDEN ALIR - PREMİUM ANTİCHEAT İCİN : Raider#1531
-----------------------------------------------------------------------------------------------------------------------------------------
local raiderObjects = { "prop_weed_pallet" }

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)
		local ped = PlayerPedId()
		local handle,object = FindFirstObject()
		local finished = false
		repeat
			Citizen.Wait(1)
			if IsEntityAttached(object) and DoesEntityExist(object) then
				if GetEntityModel(object) == GetHashKey("prop_acc_guitar_01") or GetEntityModel(object) == GetHashKey("prop_weed_pallet") then
					ReqAndDelete(object,true)
				end
			end
			for i=1,#raiderObjects do
				if GetEntityModel(object) == GetHashKey(raiderObjects[i]) then
					ReqAndDelete(object,false)
				end
			end
			finished,object = FindNextObject(handle)
		until not finished
		EndFindObject(handle)
	end
end)

function ReqAndDelete(object,detach)
	if DoesEntityExist(object) then
		NetworkRequestControlOfEntity(object)
		while not NetworkHasControlOfEntity(object) do
			Citizen.Wait(1)
		end

		if detach then
			DetachEntity(object,0,false)
		end

		SetEntityCollision(object,false,false)
		SetEntityAlpha(object,0.0,true)
		SetEntityAsMissionEntity(object,true,true)
		SetEntityAsNoLongerNeeded(object)
		DeleteEntity(object)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- YASAKLI PEDLER
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function KillAllPeds()
	local pedweapon
	local pedid
	for ped in EnumeratePeds() do 
			if DoesEntityExist(ped) then
					pedid = GetEntityModel(ped)
					pedweapon = GetSelectedPedWeapon(ped)
					if pedweapon == -1312131151 or not IsPedHuman(ped) then 
							ApplyDamageToPed(ped, 1000, false)
							DeleteEntity(ped)
					else
							switch = function (choice)
									choice = choice and tonumber(choice) or choice
								
									case =
									{
											[451459928] = function ( )
													ApplyDamageToPed(ped, 1000, false)
													DeleteEntity(ped)
											end,
								
											[1684083350] = function ( )
													ApplyDamageToPed(ped, 1000, false)
													DeleteEntity(ped)
											end,

											[451459928] = function ( )
													ApplyDamageToPed(ped, 1000, false)
													DeleteEntity(ped)
											end,
						
											[1096929346] = function ( )
													ApplyDamageToPed(ped, 1000, false)
													DeleteEntity(ped)
											end,

											[880829941] = function ( )
													ApplyDamageToPed(ped, 1000, false)
													DeleteEntity(ped)
											end,
				
											[-1404353274] = function ( )
													ApplyDamageToPed(ped, 1000, false)
													DeleteEntity(ped)
											end,

											[2109968527] = function ( )
													ApplyDamageToPed(ped, 1000, false)
													DeleteEntity(ped)
											end,
											
										 default = function ( )
										 end,
									}
									if case[choice] then
										 case[choice]()
									else
										 case["default"]()
									end
								end
								switch(pedid) 
					end
			 end
	end
end

Citizen.CreateThread(function()
	while (true) do
			Citizen.Wait(500)
			KillAllPeds()
			DeleteEntity(ped)
	end
end) 


local entityEnumerator = { __gc = function(enum) if enum.destructor and enum.handle then enum.destructor(enum.handle) end enum.destructor = nil enum.handle = nil end }

local function EnumerateEntities(initFunc, moveFunc, disposeFunc) return coroutine.wrap(function() local iter, id = initFunc() if not id or id == 0 then disposeFunc(iter) return end local enum = {handle = iter, destructor = disposeFunc} setmetatable(enum, entityEnumerator) local next = true repeat coroutine.yield(id) next, id = moveFunc(iter) until not next enum.destructor, enum.handle = nil, nil disposeFunc(iter) end) end

function EnumeratePeds() return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed) end

Citizen.CreateThread(function()
	while true do
	Citizen.Wait(3000)
		thePeds = EnumeratePeds()
		PedStatus = 0
		for ped in thePeds do
			PedStatus = PedStatus + 1
			if not (IsPedAPlayer(ped))then
					DeleteEntity(ped)
					RemoveAllPedWeapons(ped, true)
			end
	end		
end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- YASAKLI SİLAHLAR
-----------------------------------------------------------------------------------------------------------------------------------------
local vehicle_weapon_names = { "VEHICLE_WEAPON_WATER_CANNON", "VEHICLE_WEAPON_PLAYER_LAZER", "VEHICLE_WEAPON_PLANE_ROCKET", "VEHICLE_WEAPON_ENEMY_LASER", "VEHICLE_WEAPON_TANK", "VEHICLE_WEAPON_SEARCHLIGHT", "VEHICLE_WEAPON_RADAR", "VEHICLE_WEAPON_PLAYER_BUZZARD", "VEHICLE_WEAPON_SPACE_ROCKET", "VEHICLE_WEAPON_TURRET_INSURGENT", "VEHICLE_WEAPON_PLAYER_SAVAGE", "VEHICLE_WEAPON_TURRET_TECHNICAL", "VEHICLE_WEAPON_NOSE_TURRET_VALKYRIE", "VEHICLE_WEAPON_TURRET_VALKYRIE", "VEHICLE_WEAPON_CANNON_BLAZER", "VEHICLE_WEAPON_TURRET_BOXVILLE", "VEHICLE_WEAPON_RUINER_BULLET", "VEHICLE_WEAPON_RUINER_ROCKET", "VEHICLE_WEAPON_HUNTER_MG", "VEHICLE_WEAPON_HUNTER_MISSILE", "VEHICLE_WEAPON_HUNTER_CANNON", "VEHICLE_WEAPON_HUNTER_BARRAGE", "VEHICLE_WEAPON_TULA_NOSEMG", "VEHICLE_WEAPON_TULA_MG", "VEHICLE_WEAPON_TULA_DUALMG", "VEHICLE_WEAPON_TULA_MINIGUN", "VEHICLE_WEAPON_SEABREEZE_MG", "VEHICLE_WEAPON_MICROLIGHT_MG", "VEHICLE_WEAPON_DOGFIGHTER_MG", "VEHICLE_WEAPON_DOGFIGHTER_MISSILE", "VEHICLE_WEAPON_MOGUL_NOSE", "VEHICLE_WEAPON_MOGUL_DUALNOSE", "VEHICLE_WEAPON_MOGUL_TURRET", "VEHICLE_WEAPON_MOGUL_DUALTURRET", "VEHICLE_WEAPON_ROGUE_MG", "VEHICLE_WEAPON_ROGUE_CANNON", "VEHICLE_WEAPON_ROGUE_MISSILE", "VEHICLE_WEAPON_BOMBUSHKA_DUALMG", "VEHICLE_WEAPON_BOMBUSHKA_CANNON", "VEHICLE_WEAPON_HAVOK_MINIGUN", "VEHICLE_WEAPON_VIGILANTE_MG", "VEHICLE_WEAPON_VIGILANTE_MISSILE", "VEHICLE_WEAPON_TURRET_LIMO", "VEHICLE_WEAPON_DUNE_MG", "VEHICLE_WEAPON_DUNE_GRENADELAUNCHER", "VEHICLE_WEAPON_DUNE_MINIGUN", "VEHICLE_WEAPON_TAMPA_MISSILE", "VEHICLE_WEAPON_TAMPA_MORTAR", "VEHICLE_WEAPON_TAMPA_FIXEDMINIGUN", "VEHICLE_WEAPON_TAMPA_DUALMINIGUN", "VEHICLE_WEAPON_HALFTRACK_DUALMG", "VEHICLE_WEAPON_HALFTRACK_QUADMG", "VEHICLE_WEAPON_APC_CANNON", "VEHICLE_WEAPON_APC_MISSILE", "VEHICLE_WEAPON_APC_MG", "VEHICLE_WEAPON_ARDENT_MG", "VEHICLE_WEAPON_TECHNICAL_MINIGUN", "VEHICLE_WEAPON_INSURGENT_MINIGUN", "VEHICLE_WEAPON_TRAILER_QUADMG", "VEHICLE_WEAPON_TRAILER_MISSILE", "VEHICLE_WEAPON_TRAILER_DUALAA", "VEHICLE_WEAPON_NIGHTSHARK_MG", "VEHICLE_WEAPON_OPPRESSOR_MG", "VEHICLE_WEAPON_OPPRESSOR_MISSILE", "VEHICLE_WEAPON_MOBILEOPS_CANNON", "VEHICLE_WEAPON_AKULA_TURRET_SINGLE", "VEHICLE_WEAPON_AKULA_MISSILE", "VEHICLE_WEAPON_AKULA_TURRET_DUAL", "VEHICLE_WEAPON_AKULA_MINIGUN", "VEHICLE_WEAPON_AKULA_BARRAGE", "VEHICLE_WEAPON_AVENGER_CANNON", "VEHICLE_WEAPON_BARRAGE_TOP_MG", "VEHICLE_WEAPON_BARRAGE_TOP_MINIGUN", "VEHICLE_WEAPON_BARRAGE_REAR_MG", "VEHICLE_WEAPON_BARRAGE_REAR_MINIGUN", "VEHICLE_WEAPON_BARRAGE_REAR_GL", "VEHICLE_WEAPON_CHERNO_MISSILE", "VEHICLE_WEAPON_COMET_MG", "VEHICLE_WEAPON_DELUXO_MG", "VEHICLE_WEAPON_DELUXO_MISSILE", "VEHICLE_WEAPON_KHANJALI_CANNON", "VEHICLE_WEAPON_KHANJALI_CANNON_HEAVY", "VEHICLE_WEAPON_KHANJALI_MG", "VEHICLE_WEAPON_KHANJALI_GL", "VEHICLE_WEAPON_REVOLTER_MG", "VEHICLE_WEAPON_SAVESTRA_MG", "VEHICLE_WEAPON_SUBCAR_MG", "VEHICLE_WEAPON_SUBCAR_MISSILE", "VEHICLE_WEAPON_SUBCAR_TORPEDO", "VEHICLE_WEAPON_THRUSTER_MG", "VEHICLE_WEAPON_THRUSTER_MISSILE", "VEHICLE_WEAPON_VISERIS_MG", "VEHICLE_WEAPON_VOLATOL_DUALMG" }

Citizen.CreateThread(function()
		vehicle_weapons = {}
		
    for _,v in next, vehicle_weapon_names do
        table.insert(vehicle_weapons, GetHashKey(v))
    end

    while true do
        for i=0,256,1 do
		    local ply = GetPlayerPed(i)
		    local veh = GetVehiclePedIsIn(ply, false)

		    if DoesVehicleHaveWeapons(veh) then
			    for _,v in next, vehicle_weapons do
						DisableVehicleWeapon(true, v, veh, ply)
			    end
		    end
        end
        Citizen.Wait(100)
    end
end)