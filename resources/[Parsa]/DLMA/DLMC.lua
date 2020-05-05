PedStatus = 0
ESX       = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent("esx:getSharedObject",function(obj) ESX = obj end)
	end
end)
local BlacklistedObject = {"xs_prop_hamburgher_wl","prop_fnclink_05crnr1","p_crahsed_heli_s","prop_rock_4_big2","prop_beachflag_le","stt_prop_stunt_soccer_ball","prop_beach_fire","apa_mp_apa_yacht","xm_prop_x17_sub","sr_prop_sr_track_wall","stt_prop_stunt_jump15","stt_prop_stunt_jump30","stt_prop_stunt_jump45","stt_prop_stunt_trck_slope15","stt_prop_stunt_trck_slope30","stt_prop_stunt_trck_slope45","stt_prop_stunt_track_start"}
local ListeBlackList = {"Avenger","avenger2","maverick","blimp2","luxor","besra","blimp2","blimp3","bombushka","cargoplane","hydra","jet","lazer","titan","volatol","KHANJALI"}
local blackWeapons = { 
    "WEAPON_RAILGUN", 
	"WEAPON_GARBAGEBAG", 
	"WEAPON_SNSPISTOL_MK2", 
	"WEAPON_FLAREGUN", 
	"WEAPON_MARKSMANPISTOL",
	"WEAPON_REVOLVER_MK2", 
	"WEAPON_DOUBLEACTION", 
	"WEAPON_SMG_MK2", 
	"WEAPON_MACHINEPISTOL", 
	"WEAPON_RAYCARBINE", 
	"WEAPON_SAWNOFFSHOTGUN", 
	"WEAPON_ASSAULTSHOTGUN", 
	"WEAPON_BULLPUPSHOTGUN", 
	"WEAPON_HEAVYSHOTGUN", 
	"WEAPON_DBSHOTGUN", 
	"WEAPON_AUTOSHOTGUN", 
	"WEAPON_ASSAULTRIFLE_MK2", 
	"WEAPON_CARBINERIFLE_MK2", 
	"WEAPON_ADVANCEDRIFLE", 
	"WEAPON_SPECIALCARBINE_MK2", 
	"WEAPON_BULLPUPRIFLE", 
	"WEAPON_BULLPUPRIFLE_MK2", 
	"WEAPON_COMPACTRIFLE", 
	"WEAPON_MG", 
	"WEAPON_COMBATMG", 
	"WEAPON_COMBATMG_MK2", 
	"WEAPON_SNIPERRIFLE", 
	"WEAPON_HEAVYSNIPER", 
	"WEAPON_HEAVYSNIPER_MK2", 
	"WEAPON_MARKSMANRIFLE", 
	"WEAPON_MARKSMANRIFLE_MK2", 
	"WEAPON_RPG", 
	"WEAPON_GRENADELAUNCHER", 
	"WEAPON_GRENADELAUNCHER_SMOKE", 
	"WEAPON_MINIGUN", 
	"WEAPON_FIREWORK", 
	"WEAPON_RAILGUN", 
	"WEAPON_HOMINGLAUNCHER", 
	"WEAPON_COMPACTLAUNCHER", 
	"WEAPON_RAYMINIGUN", 
	"WEAPON_GRENADE", 
	"WEAPON_BZGAS", 
	"WEAPON_MOLOTOV", 
	"WEAPON_STICKYBOMB",
	"WEAPON_PROXMINE", 
	"WEAPON_SNOWBALL", 
	"WEAPON_PIPEBOMB", 
	"WEAPON_BALL", 
	"WEAPON_SMOKEGRENADE", 
	"WEAPON_ROCKET", 
	"WEAPON_EXPLOSION ", 
	"WEAPON_FLARE", 
	"WEAPON_MUSKET" 
}


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(2000)
		for k,theWeapon in ipairs(blackWeapons) do
			if HasPedGotWeapon(PlayerPedId(),GetHashKey(theWeapon),false) == 1 then
				TriggerServerEvent("DLMA:WeaponFlag", theWeapon)
				break
			end
		end
	end
end)

RegisterNetEvent("DLMA:TargetCheck")
AddEventHandler('DLMA:TargetCheck', function()
	TriggerServerEvent("DLMA:CheckBack")
end)

RegisterNetEvent("DLMA:RemoveInventoryWeapons")
AddEventHandler('DLMA:RemoveInventoryWeapons', function()
	RemoveAllPedWeapons(PlayerPedId(),false)
end)

RegisterNetEvent("DLMA:DeleteEntity")
AddEventHandler("DLMA:DeleteEntity",function(object)
	local handle,object = FindFirstObject()
	local finished = false
	repeat
	for i=1,#BlacklistedObject do
		if GetEntityModel(object) == GetHashKey(blackObjects[i]) then
			ReqAndDelete(object,false)
		end
	end
	finished,object = FindNextObject(handle)
	until not finished
	EndFindObject(handle)
end)

RegisterNetEvent("DLMA:DeletePeds")
AddEventHandler("DLMA:DeletePeds",function(object)
    ClearPedTasks(PlayerPedId())
end)

RegisterNetEvent("DLMA:DeleteCars")
AddEventHandler("DLMA:DeleteCars",function(object)
    playerPed = GetPlayerPed(-1)
	if playerPed then
		checkCar(GetVehiclePedIsIn(playerPed, false))
		coords = GetEntityCoords(playerPed, true)
		for _, blacklistedCar in pairs(ListeBlackList) do
			local voiture = ESX.Game.GetVehiclesInArea(coords, 350)
			for _, voiture in pairs(voiture) do
				checkCar(voiture)
			end
		end
	end
end)


function ReqAndDelete(object,detach)
	if DoesEntityExist(object) then
		NetworkRequestControlOfEntity(object)
		while not NetworkHasControlOfEntity(object) do
			Citizen.Wait(100)
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

local entityEnumerator = { __gc = function(enum) if enum.destructor and enum.handle then enum.destructor(enum.handle) end enum.destructor = nil enum.handle = nil end }

local function EnumerateEntities(initFunc, moveFunc, disposeFunc) return coroutine.wrap(function() local iter, id = initFunc() if not id or id == 0 then disposeFunc(iter) return end local enum = {handle = iter, destructor = disposeFunc} setmetatable(enum, entityEnumerator) local next = true repeat coroutine.yield(id) next, id = moveFunc(iter) until not next enum.destructor, enum.handle = nil, nil disposeFunc(iter) end) end

function EnumeratePeds() return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed) end

Citizen.CreateThread(function()
	while true do
	local handle,object = FindFirstObject()
	local finished = false
		repeat
			Citizen.Wait(1500)
			if IsEntityAttached(object) and DoesEntityExist(object) then
				if GetEntityModel(object) == GetHashKey("p_crahsed_heli_s")
				or GetEntityModel(object) == GetHashKey("prop_fnclink_05crnr1")
				or GetEntityModel(object) == GetHashKey("prop_rock_4_big2")
				or GetEntityModel(object) == GetHashKey("prop_beachflag_le")
				or GetEntityModel(object) == GetHashKey("xs_prop_hamburgher_wl")
				or GetEntityModel(object) == GetHashKey("prop_acc_guitar_01")
				or GetEntityModel(object) == GetHashKey("prop_weed_pallet") then
					ReqAndDelete(object,true)
				end
			end
			finished,object = FindNextObject(handle)
		until not finished
		EndFindObject(handle)
    end
end)

Citizen.CreateThread(function()
	while true do
	Citizen.Wait(2500)
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

function checkCar(car)
	if car then
		carModel = GetEntityModel(car)
		carName = GetDisplayNameFromVehicleModel(carModel)
		VieDuVehicule = GetVehicleEngineHealth(car)
		if VieDuVehicule <= 1 then
			_DeleteEntity(car)
		end
		if isListeBlackListed(carModel) then
			_DeleteEntity(car)
		end
	end
end

function _DeleteEntity(entity)
	Citizen.InvokeNative(0xAE3CBE5BF394C9C9, Citizen.PointerValueIntInitialized(entity))
end

function isListeBlackListed(model)
	for _, blacklistedCar in pairs(ListeBlackList) do
		if model == GetHashKey(blacklistedCar) then
			return true
		end
	end
	return false
end
