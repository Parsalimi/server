local OwnedProperties, Blips, CurrentActionData = {}, {}, {}
local CurrentProperty, CurrentPropertyOwner, LastProperty, LastPart, CurrentAction, CurrentActionMsg
local firstSpawn, hasChest, hasAlreadyEnteredMarker, OpenMenuGarage = true, false, false, false
ESX = nil

local Current_Title1 = "commonmenu"
local Current_Title2 = "interaction_bgd"

IsOpening = false

isInside = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

_menuPoolHouse = NativeUI.CreatePool()
_menuPoolHouse2 = NativeUI.CreatePool()

local _mainMenuHouse2 = NativeUI.CreateMenu("", "", 10.0, 10.0)
_menuPoolHouse2:Add(_mainMenuHouse2)

-- Instance Function
AddEventHandler('instance:loaded', function()
	TriggerEvent('instance:registerType', 'property', function(instance)
		EnterProperty(instance.data.property, instance.data.owner)
	end, function(instance)
		ExitProperty(instance.data.property)
	end)
end)

RegisterNetEvent('instance:onCreate')
AddEventHandler('instance:onCreate', function(instance)
	if instance.type == 'property' then
		TriggerEvent('instance:enter', instance)
	end
end)

RegisterNetEvent('instance:onEnter')
AddEventHandler('instance:onEnter', function(instance)
	if instance.type == 'property' then
		local property = GetProperty(instance.data.property)
		local isHost   = GetPlayerFromServerId(instance.host) == PlayerId()
		local isOwned  = false

		if PropertyIsOwned(property) == true then
			isOwned = true
		end

		if isOwned or not isHost then
			hasChest = true
		else
			hasChest = false
		end
	end
end)

RegisterNetEvent('instance:onPlayerLeft')
AddEventHandler('instance:onPlayerLeft', function(instance, player)
	if player == instance.host then
		TriggerEvent('instance:leave')
	end
end)

-- End

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	-- ESX.TriggerServerCallback('meeta_house:getOwnedProperties', function(ownedProperties)
	-- 	for i=1, #ownedProperties, 1 do
	-- 		SetPropertyOwned(ownedProperties[i], true)
	-- 	end
	-- end)
	ESX.TriggerServerCallback('meeta_house:getAllProperties', function(ownedProperties)
		for i=1, #ownedProperties, 1 do
			local house_name = ownedProperties[i].name
			local house_owner = ownedProperties[i].owner
			local my_owner = ESX.GetPlayerData().identifier
			if house_owner == my_owner then
				SetPropertyOwned(house_name, true)
			else
				SetRemoveBlip(house_name)
			end
		end
	end)
end)

AddEventHandler('playerSpawned', function()
	if firstSpawn then
		Citizen.CreateThread(function()
			while not ESX.IsPlayerLoaded() do
				Citizen.Wait(0)
			end

			ESX.TriggerServerCallback('meeta_house:getLastProperty', function(propertyName)
				if propertyName then
					if propertyName ~= '' then
						local property = GetProperty(propertyName)

						for i=1, #property.ipls, 1 do
							RequestIpl(property.ipls[i])
				
							while not IsIplActive(property.ipls[i]) do
								Citizen.Wait(0)
							end
						end

						TriggerEvent('instance:create', 'property', {property = propertyName, owner = ESX.GetPlayerData().identifier})
					end
				end
			end)
		end)

		firstSpawn = false
	end
end)


-- Function
function PropertyIsOwned(property)
	return OwnedProperties[property.name] == true
end

function SetRemoveBlip(name)
	local property     = GetProperty(name)
	local entering     = nil
	local enteringName = nil

	if property.isSingle then
		entering     = property.entering
		enteringName = property.name
	end
	RemoveBlip(Blips[enteringName])
end

function AddMenuGateWay(menu, property)

	ESX.TriggerServerCallback('meeta_house:getOwnedProperties', function(ownedProperties)
		for i=1, #ownedProperties, 1 do
			--print(ownedProperties[i])
			SetPropertyOwned(ownedProperties[i], true)
		end

		local Menu_Gateway1 = _menuPoolHouse:AddSubMenu(menu, "บ้านของฉัน")
		local Menu_Gateway2 = _menuPoolHouse:AddSubMenu(menu, "ซื้อบ้าน")

		local gatewayProperties = GetGatewayProperties(property)

		for i=1, #gatewayProperties, 1 do
			if PropertyIsOwned(gatewayProperties[i]) then
				local SubMenuGateway1 = _menuPoolHouse2:AddSubMenu(Menu_Gateway1.SubMenu, gatewayProperties[i].label, "เข้าบ้าน ~g~" .. gatewayProperties[i].label)
				--Menu_Buy:SetArray(gatewayProperties[i])
				--Menu_Gateway1.SubMenu:AddItem(Menu_Buy)

				local SubMenu_Enter1 = NativeUI.CreateItem("เข้าบ้าน", "เข้าบ้าน ~g~" .. gatewayProperties[i].label)
				--local SubMenu_Enter2 = NativeUI.CreateItem("Visit", "Wait for invite...")

				SubMenu_Enter1:SetArray(gatewayProperties[i])

				SubMenuGateway1.SubMenu:AddItem(SubMenu_Enter1)

				SubMenuGateway1.SubMenu.OnItemSelect = function(parent, item, index)
					local object = SubMenuGateway1.SubMenu:GetItemAt(index)._Array

					if item == SubMenu_Enter1 then
						TriggerEvent('instance:create', 'property', {property = object.name, owner = ESX.GetPlayerData().identifier})
					end

					_menuPoolHouse:CloseAllMenus()
					_menuPoolHouse2:CloseAllMenus()
					
				end

			end

			if not PropertyIsOwned(gatewayProperties[i]) then
				local Menu_Buy = nil
				if gatewayProperties[i].garage then
					Garage_Desc = " ~b~บ้านหลังนี้มีโรงเก็บรถ สามารถเก็บรถได้ "..gatewayProperties[i].garage.max.." คัน."
					Menu_Buy = NativeUI.CreateItem(gatewayProperties[i].label, "ซื้อบ้าน ~o~" .. gatewayProperties[i].label ..Garage_Desc.." ~w~ราคา : ~g~".. ESX.Math.GroupDigits(gatewayProperties[i].price))
				else
					Menu_Buy = NativeUI.CreateItem(gatewayProperties[i].label, "ซื้อบ้าน ~o~ ~w~ราคา : ~g~".. ESX.Math.GroupDigits(gatewayProperties[i].price))
				end
					
				Menu_Buy:RightLabel("$" .. ESX.Math.GroupDigits(gatewayProperties[i].price))
				Menu_Buy:SetArray(gatewayProperties[i])
				Menu_Gateway2.SubMenu:AddItem(Menu_Buy)
			end

		end

		Menu_Gateway2.SubMenu.OnItemSelect = function(parent, item, index)
			local object = Menu_Gateway2.SubMenu:GetItemAt(index)._Array
			_menuPoolHouse:CloseAllMenus()
			TriggerServerEvent('meeta_house:buyProperty', object.name)
		end

		_menuPoolHouse:RefreshIndex()
		_menuPoolHouse2:RefreshIndex()

	end)

end

function AddMenuProperty(menu, property)

	local ped = GetPlayerPed(-1)

	ESX.TriggerServerCallback("meeta_house:getHouseOwner", function(data)

		if data.result then
			local Menu_Enter = NativeUI.CreateItem("เข้าบ้าน", "เข้าบ้าน ~g~" .. property.label )
			menu:AddItem(Menu_Enter)
			--Menu_Buy:RightLabel("$" .. property.price)
			menu.OnItemSelect = function(menu, item)
				if item == Menu_Enter then
					_menuPoolHouse:CloseAllMenus()
					TriggerEvent('instance:create', 'property', {property = property.name, owner = ESX.GetPlayerData().identifier})
				end
			end
		else
			local Garage_Desc = ""
			if property.garage then
				Garage_Desc = " ~b~บ้านหลังนี้มีโรงเก็บรถ สามารถเก็บรถได้ "..property.garage.max.." คัน."
			end

			local Menu_Buy = NativeUI.CreateItem("ซื้อ", "ซื้อบ้าน ~o~" .. property.label ..Garage_Desc.." ~w~ราคา : ~g~".. ESX.Math.GroupDigits(property.price))
			menu:AddItem(Menu_Buy)
			Menu_Buy:RightLabel("$" .. ESX.Math.GroupDigits(property.price))
			menu.OnItemSelect = function(menu, item)
				if item == Menu_Buy then
					_menuPoolHouse:CloseAllMenus()
					TriggerServerEvent('meeta_house:buyProperty', property.name)
				end
			end
		end

		-- local Menu_Visit = NativeUI.CreateItem("Visit", "")
		-- menu:AddItem(Menu_Visit)
		-- menu.OnItemSelect = function(menu, item)

		-- 	if item == Menu_Visit then
		-- 		TriggerEvent('instance:create', 'property', {property = property.name, owner = ESX.GetPlayerData().identifier})
		-- 	end
		-- end

		_menuPoolHouse:RefreshIndex()

	end,GetPlayerServerId(PlayerId()), property.name)

end

function OpenExitMenu(menu, property, owner)
	local PlayerPed = GetPlayerPed(-1)


	ESX.TriggerServerCallback("meeta_house:getVehicleGarage", function(vehicles)

		if vehicles and CurrentPropertyOwner == owner and property.garage then
			local Menu_Garage = _menuPoolHouse:AddSubMenu(menu, "โรงรถ")

			for k,v in pairs(vehicles) do
				v.vehicle = json.decode(v.vehicle)
				local hashVehicule = v.vehicle.model
				local vehicleName
				local labelvehicle		
				if v.vehiclename == 'voiture' then
					vehicleName = GetDisplayNameFromVehicleModel(hashVehicule)
				else
					vehicleName = v.vehiclename
				end

				
				local Items = NativeUI.CreateItem(vehicleName .." - ~b~"..v.plate, "")
				Items:SetArray(v)
				Menu_Garage.SubMenu:AddItem(Items)
				Menu_Garage.SubMenu.OnItemSelect = function(parent, item, index)
					local object = Menu_Garage.SubMenu:GetItemAt(index)._Array
					OpenMenuGarage = true
					TriggerEvent('esx_eden_garage:SpawnVehicle', object.vehicle, property)
					TriggerEvent('instance:leave')
					_menuPoolHouse:CloseAllMenus()
				end
			end

			_menuPoolHouse:RefreshIndex()
		end

		

		local Menu_Exit = NativeUI.CreateItem("~r~ออกจากบ้าน", "")
		menu:AddItem(Menu_Exit)
		menu.OnItemSelect = function(menu, item)
			if item == Menu_Exit then
				TriggerEvent('instance:leave')

				_menuPoolHouse:CloseAllMenus()
			end
		end

		_menuPoolHouse:RefreshIndex()

	end,GetPlayerServerId(PlayerId()), property.name)

end

function OpenEnterGarage(menu, property, owner)
	
	-- for k,v in pairs(GetGateway(property)) do
	-- 	print(v)
	-- end
	--print(GetGateway(property))
	
	ESX.TriggerServerCallback('meeta_house:getOwnedProperties', function(ownedProperties)
		for i=1, #ownedProperties, 1 do
			SetPropertyOwned(ownedProperties[i], true)
		end

		if GetGateway(property) then
			local gatewayProperties = GetGatewayProperties(GetGateway(property))
		

			for i=1, #gatewayProperties, 1 do
				if PropertyIsOwned(gatewayProperties[i]) then
					
					local Menu_Garage = NativeUI.CreateItem(gatewayProperties[i].label, "เก็บรถไว้ที่โรงรถ ~g~" .. gatewayProperties[i].label)
					
					Menu_Garage:SetArray(gatewayProperties[i])
					menu:AddItem(Menu_Garage)

					menu.OnItemSelect = function(parent, item, index)
						
						local object = menu:GetItemAt(index)._Array
						ESX.TriggerServerCallback('meeta_house:getOwnedPropertiesByHouseName', function(data)

							for k,v in pairs(Config.Properties) do
								if v.garage and v.name == object.name  then
									
									if data.count >= v.garage.max then
										TriggerEvent("pNotify:SendNotification", {
											text = '<strong class="red-text">โรงรถเต็ม</strong>',
											type = "success",
											timeout = 3000,
											layout = "bottomCenter",
											queue = "global"
										})
									else
										TriggerEvent('esx_eden_garage:StockVehicleMenuToHouse', data.id)
									end
									_menuPoolHouse:CloseAllMenus()
									break
								end
							end

						end, object.name)
						
						-- if item == Menu_Garage then
						-- 	_menuPoolHouse:CloseAllMenus()
						-- end

					end

				end

			end

			_menuPoolHouse:RefreshIndex()
		else
			_menuPoolHouse:CloseAllMenus()
			ESX.TriggerServerCallback('meeta_house:getOwnedPropertiesByHouseName', function(data)

				for k,v in pairs(Config.Properties) do
					if v.garage and v.name == property.name  then
						
						if data.count >= v.garage.max then
							TriggerEvent("pNotify:SendNotification", {
								text = '<strong class="red-text">โรงรถเต็ม</strong>',
								type = "success",
								timeout = 3000,
								layout = "bottomCenter",
								queue = "global"
							})
						else
							TriggerEvent('esx_eden_garage:StockVehicleMenuToHouse', data.id)
						end
						break
					end
				end
		
			end, property.name)
		end
	end)
	
end

function OpenRoomMenu(property, owner)
	local entering = nil
	local elements = {}

	if property.isSingle then
		entering = property.entering
	else
		entering = GetGateway(property).entering
	end

	if CurrentPropertyOwner == owner then
		table.insert(elements, {label = "เชิญผู้เล่นเข้าบ้าน", value = 'player_invite'})
		-- local Menu_Invite = _menuPoolHouse:AddSubMenu(menu, "เชิญผู้เล่นเข้าบ้าน")
		-- local playersInArea = ESX.Game.GetPlayersInArea(entering, 10.0)

		-- for i=1, #playersInArea, 1 do
		-- 	if playersInArea[i] ~= PlayerId() then
		-- 		local Menu_Players = NativeUI.CreateItem(GetPlayerName(playersInArea[i]), "")
		-- 		Menu_Players:SetArray(playersInArea[i])
		-- 		Menu_Invite.SubMenu:AddItem(Menu_Players)
		-- 		Menu_Invite.SubMenu.OnItemSelect = function(parent, item, index)
		-- 			local object = Menu_Invite.SubMenu:GetItemAt(index)._Array
					
		-- 			TriggerEvent('instance:invite', 'property', GetPlayerServerId(object), {property = property.name, owner = owner})
		-- 			ESX.ShowNotification('you invited ~y~'..GetPlayerName(object)..'~s~ to your property')
		-- 		end
		-- 	end
		-- end
	end

	table.insert(elements, {label = "เสื้อผ้า", value = 'player_clothes'})
	table.insert(elements, {label = "ช่องเก็บของ", value = 'player_inventory'})

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'room', {
		title    = property.label,
		align    = 'top-left',
		elements = elements
	}, function(data, menu)

		if data.current.value == 'player_invite' then

			local playersInArea = ESX.Game.GetPlayersInArea(entering, 10.0)
			local elements      = {}

			for i=1, #playersInArea, 1 do
				if playersInArea[i] ~= PlayerId() then
					table.insert(elements, {label = GetPlayerName(playersInArea[i]), value = playersInArea[i]})
				end
			end

			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'room_invite', {
				title    =  'เชิญผู้เล่นเข้าบ้าน',
				align    = 'top-left',
				elements = elements,
			}, function(data2, menu2)
				TriggerEvent('instance:invite', 'property', GetPlayerServerId(data2.current.value), {property = property.name, owner = owner})
				TriggerEvent("pNotify:SendNotification", {
					text = 'คุณได้เชิญ <strong class="blue-text">' ..GetPlayerName(data2.current.value)..'</strong>',
					type = "success",
					timeout = 3000,
					layout = "bottomCenter",
					queue = "global"
				})
			end, function(data2, menu2)
				menu2.close()
			end)
		elseif data.current.value == 'player_clothes' then
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'room_clothes', {
				title    =  'ตู้เสื้อผ้า',
				align    = 'top-left',
				elements = {
					{
						label = "ชุด", value = 'clothes'
					},
					{
						label = "หมวก", value = 'helmet'
					},
					{
						label = "หน้ากาก", value = 'mask'
					},
					{
						label = "แว่น", value = 'glasses'
					},
					{
						label = "ตุ้มหู", value = 'ears'
					}
				},
			}, function(data2, menu2)

				local value = data2.current.value

				if value == "clothes" then
					LoadClothes('player_clothes', 'ชุด')
				elseif value == "helmet" then
					LoadClothes('player_helmet', 'หมวก')
				elseif value == "mask" then
					LoadClothes('player_mask', 'หน้ากาก')
				elseif value == "glasses" then
					LoadClothes('player_glasses', 'แว่นตา')
				elseif value == "ears" then
					LoadClothes('player_ears', 'ตุ้มหู')
				end

			end, function(data2, menu2)
				menu2.close()
			end)
		elseif data.current.value == 'player_inventory' then
			menu.close()
			local data_properties = {}
			ESX.TriggerServerCallback("meeta_house:getHouseInventory", function(data)

				if data.result then
					data_properties = data.data
				end

				ESX.TriggerServerCallback("meeta_house:getInventory", function(inventory)
					-- text = _U("trunk_info", plate, (inventory.weight / 1000), (max / 1000))
					TriggerEvent("esx_inventoryhud:openHouseInventory", data_properties.id, inventory.cash, inventory.blackMoney, inventory.items, inventory.weapons)
				end, data_properties.id)
		
			end, property.name)
		end

	end, function(data, menu)
		menu.close()

		CurrentAction     = 'room_menu'
		CurrentActionMsg  = 'Press ~INPUT_CONTEXT~ to access the menu'
		CurrentActionData = {property = property, owner = owner}
	end)

	-- local Menu_Cloth = _menuPoolHouse:AddSubMenu(menu, "เสื้อผ้า")
	-- -- local Menu_RemoveCloth = _menuPoolHouse:AddSubMenu(menu, "ลบเสื้อผ้า")

	-- local Menu_HouseInventory = NativeUI.CreateItem("~g~ช่องเก็บของ", "ช่องเก็บของ")
	-- menu:AddItem(Menu_HouseInventory)
	-- menu.OnItemSelect = function(menu, item)
	-- 	if item == Menu_HouseInventory then
	-- 		local data_properties = {}
	-- 		ESX.TriggerServerCallback("meeta_house:getHouseInventory", function(data)

	-- 			if data.result then
	-- 				data_properties = data.data
	-- 			end

	-- 			ESX.TriggerServerCallback("meeta_house:getInventory", function(inventory)
	-- 				-- text = _U("trunk_info", plate, (inventory.weight / 1000), (max / 1000))
	-- 				TriggerEvent("esx_inventoryhud:openHouseInventory", data_properties.id, inventory.cash, inventory.blackMoney, inventory.items, inventory.weapons)
	-- 			end, data_properties.id)
		
	-- 		end, property.name)
			
	-- 		_menuPoolHouse:CloseAllMenus()
	-- 	end

	-- end

	-- ESX.TriggerServerCallback('meeta_house:getPlayerDressing', function(dressing)
	-- 	for i=1, #dressing, 1 do
	-- 		Item = NativeUI.CreateItem(dressing[i], "เปลี่ยนสื้อผ้า ~g~" ..dressing[i])
	-- 		Item:SetArray(i)
	-- 		Menu_Cloth.SubMenu:AddItem(Item)

	-- 		Menu_Cloth.SubMenu.OnItemSelect = function(parent, item, index)
	-- 			local object = Menu_Cloth.SubMenu:GetItemAt(index)._Array

	-- 			TriggerEvent('skinchanger:getSkin', function(skin)
	-- 				ESX.TriggerServerCallback('meeta_house:getPlayerOutfit', function(clothes)
	-- 					TriggerEvent('skinchanger:loadClothes', skin, clothes)
	-- 					TriggerEvent('esx_skin:setLastSkin', skin)

	-- 					TriggerEvent('skinchanger:getSkin', function(skin)
	-- 						TriggerServerEvent('esx_skin:save', skin)
	-- 					end)
	-- 				end, object)
	-- 			end)
				
	-- 		end

	-- 	end

	-- 	_menuPoolHouse:RefreshIndex()
	-- end)

	-- ESX.TriggerServerCallback('meeta_house:getPlayerDressing', function(dressing)
	-- 	for i=1, #dressing, 1 do

	-- 		Item_Remove = NativeUI.CreateItem(dressing[i], "ลบเสื้อผ้า ~g~" ..dressing[i])
	-- 		Item_Remove:SetArray(i)
	-- 		Menu_RemoveCloth.SubMenu:AddItem(Item_Remove)

	-- 		Menu_RemoveCloth.SubMenu.OnItemSelect = function(parent, item, index)
	-- 			local object_remove = Menu_RemoveCloth.SubMenu:GetItemAt(index)._Array

	-- 			TriggerServerEvent('meeta_house:removeOutfit', object_remove)
	-- 			_menuPoolHouse:CloseAllMenus()
				
	-- 		end

	-- 	end

	-- 	_menuPoolHouse:RefreshIndex()
	-- end)

end

function table.empty (self)
    for _, _ in pairs(self) do
        return false
    end
    return true
end

function LoadClothes(type, text)
	ESX.TriggerServerCallback('meeta_house:getPlayerOutfit', function(clothes)
		if not table.empty(clothes) then
			local elements = {}

			for k,v in pairs(clothes) do
				table.insert(elements, {
					label = v.label, value = json.decode(v.skin), id = v.id
				})
			end

			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'room_clothes_open', {
				title    =  text,
				align    = 'top-left',
				elements = elements,
			}, function(data3, menu3)
		
				local value = data3.current.value
		
				if value ~= nil then
					ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'room_clothes_open_sub', {
						title    =  'แก้ไข - ' ..data3.current.label,
						align    = 'top-left',
						elements = {
							{
								label = "ส่วมใส่", value = 'pick', skin = value,
							},
							{
								label = "เปลี่ยนชื่อ", value = 'rename', id = data3.current.id
							},
							{
								label = "<strong class='red-text'>ลบออก</strong>", value = 'remove', id = data3.current.id
							}
						},
					}, function(data4, menu4)
				
						local value = data4.current.value
				
						if value == 'pick' then
							TriggerEvent('skinchanger:getSkin', function(skin)
								TriggerEvent('skinchanger:loadClothes', skin, data4.current.skin)
								TriggerEvent('esx_skin:setLastSkin', skin)
								TriggerServerEvent('esx_skin:save', skin)
							end)
						elseif value == 'rename' then
							ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'outfit_name', {
								title = "ใส่ชื่อชุด (2-30 ตัวอักษร)",
								value = data3.current.label
							}, function(data5, menu5)

								if data5.value == nil then
									TriggerEvent("pNotify:SendNotification", {
										text = '<strong class="red-text">กรุณาใส่ชื่อชุดของคุณด้วย</strong>',
										type = "success",
										timeout = 3000,
										layout = "bottomCenter",
										queue = "global"
									})
								else
									if utf8.len(data5.value) >= 30 then
										TriggerEvent("pNotify:SendNotification", {
											text = '<strong class="red-text">ชื่อชุดของคุณยาวเกินไป</strong>',
											type = "success",
											timeout = 3000,
											layout = "bottomCenter",
											queue = "global"
										})
									elseif utf8.len(data5.value) < 2 then
										TriggerEvent("pNotify:SendNotification", {
											text = '<strong class="red-text">ชื่อชุดของคุณสั้นเกินไป</strong>',
											type = "success",
											timeout = 3000,
											layout = "bottomCenter",
											queue = "global"
										})	
									else
										menu5.close()
										TriggerServerEvent('meeta_house:renameOutfit', data5.value, data4.current.id)
										LoadClothes(type,text)
									end
									
								end
		
							end, function(data5, menu5)
								menu5.close()
							end)
						elseif value == 'remove' then
							menu4.close()
							TriggerServerEvent('meeta_house:deleteOutfit', data4.current.id)
							LoadClothes(type,text)
						end
				
					end, function(data4, menu4)
						menu4.close()
					end)
				end
		
			end, function(data3, menu3)
				menu3.close()
			end)
		else
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'room_clothes_null', {
				title    =  text,
				align    = 'top-left',
				elements = { label = '<strong class="red-text">ว่างเปล่า</strong>'},
			}, function(data3, menu3)
		
			end, function(data3, menu3)
				menu3.close()
			end)
		end
	end, type)

end

function GetProperties()
	return Config.Properties
end

function GetProperty(name)
	for i=1, #Config.Properties, 1 do
		if Config.Properties[i].name == name then
			return Config.Properties[i]
		end
	end
end

function GetGateway(property)
	for i=1, #Config.Properties, 1 do
		local property2 = Config.Properties[i]

		if property2.isGateway and property2.name == property.gateway then
			return property2
		end
	end
end

function GetGatewayProperties(property)
	local properties = {}

	for i=1, #Config.Properties, 1 do
		if Config.Properties[i].gateway == property.name then
			table.insert(properties, Config.Properties[i])
		end
	end

	return properties
end

function SetPropertyOwned(name, owned)
	local property     = GetProperty(name)
	local entering     = nil
	local enteringName = nil

	if property.isSingle then
		entering     = property.entering
		enteringName = property.name
	else
		local gateway = GetGateway(property)
		entering      = gateway.entering
		enteringName  = gateway.name
	end

	if owned then
		OwnedProperties[name] = true
		RemoveBlip(Blips[enteringName])

		Blips[enteringName] = AddBlipForCoord(entering.x, entering.y, entering.z)
		SetBlipSprite(Blips[enteringName], 40)
		SetBlipColour(Blips[enteringName], 2)
		SetBlipAsShortRange(Blips[enteringName], true)

		BeginTextCommandSetBlipName("STRING")
		AddTextComponentSubstringPlayerName("Property")
		EndTextCommandSetBlipName(Blips[enteringName])
	else
		OwnedProperties[name] = nil
		local found = false

		for k,v in pairs(OwnedProperties) do
			local _property = GetProperty(k)
			local _gateway  = GetGateway(_property)

			if _gateway then
				if _gateway.name == enteringName then
					found = true
					break
				end
			end
		end

		if not found then
			RemoveBlip(Blips[enteringName])

			Blips[enteringName] = AddBlipForCoord(entering.x, entering.y, entering.z)
			SetBlipSprite(Blips[enteringName], 369)
			SetBlipAsShortRange(Blips[enteringName], true)

			BeginTextCommandSetBlipName("STRING")
			AddTextComponentSubstringPlayerName(_U('free_prop'))
			EndTextCommandSetBlipName(Blips[enteringName])
		end
	end
end

function EnterProperty(name, owner)
	local property       = GetProperty(name)
	local playerPed      = PlayerPedId()
	CurrentProperty      = property
	CurrentPropertyOwner = owner

	for i=1, #Config.Properties, 1 do
		if Config.Properties[i].name ~= name then
			Config.Properties[i].disabled = true
		end
	end

	TriggerServerEvent('meeta_house:saveLastProperty', name)
	--Citizen.Trace('property id == ' .. property.id);
	--NetworkSetVoiceChannel(property.id)
 	--NetworkSetTalkerProximity(0.0)
	testCall(property.id)

	Citizen.CreateThread(function()
		DoScreenFadeOut(800)

		while not IsScreenFadedOut() do
			Citizen.Wait(0)
		end
		for i=1, #property.ipls, 1 do

			RequestIpl(property.ipls[i])

			while not IsIplActive(property.ipls[i]) do
				Citizen.Wait(0)
			end
		end
		SetEntityCoords(playerPed, property.inside.x, property.inside.y, property.inside.z)
		DoScreenFadeIn(800)
		DrawSub(property.label, 5000)
	end)

	-- Citizen.CreateThread(function()
	-- 	while true do

	-- 		Citizen.Wait(0)
	-- 		NetworkSetVoiceChannel(property.id)
 	-- 		NetworkSetTalkerProximity(5.0)

	-- 	end
	-- end)

end

function testCall(id)
	Citizen.CreateThread(function()
		Citizen.Trace("Started to set")
		isInside = true
		while isInside do
			Citizen.Wait(1)
			
			NetworkSetVoiceChannel(id)
			NetworkSetTalkerProximity(5.0)
		end
		Citizen.Trace("Thread ended")
		NetworkClearVoiceChannel()
		NetworkSetTalkerProximity(5.0)
	end)
end

function ExitProperty(name)
	local property  = GetProperty(name)
	local playerPed = PlayerPedId()
	local outside   = nil
	CurrentProperty = nil

	if OpenMenuGarage == false then
		if property.isSingle then
			outside = property.outside
		else
			outside = GetGateway(property).outside
		end
	end

	TriggerServerEvent('meeta_house:deleteLastProperty')

	isInside = false
	NetworkClearVoiceChannel()
	NetworkSetTalkerProximity(5.0)

	Citizen.CreateThread(function()
		DoScreenFadeOut(800)

		while not IsScreenFadedOut() do
			Citizen.Wait(0)
		end

		if OpenMenuGarage == false then
			SetEntityCoords(playerPed, outside.x, outside.y, outside.z)
		end

		for i=1, #property.ipls, 1 do
			RemoveIpl(property.ipls[i])
		end

		for i=1, #Config.Properties, 1 do
			Config.Properties[i].disabled = false
		end

		DoScreenFadeIn(800)
		OpenMenuGarage = false
	end)
end

function DrawSub(text, time)
	ClearPrints()
	BeginTextCommandPrint('STRING')
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandPrint(time, 1)
end
-- End Function


AddEventHandler('meeta_house:hasEnteredMarker', function(name, part)
	local property = GetProperty(name)

	if part == 'entering' then
		if property.isSingle then
			CurrentAction     = 'property_menu'
			CurrentActionMsg  = "Press ~INPUT_CONTEXT~ to access the menu"
			CurrentActionData = {property = property}
		else
			CurrentAction     = 'gateway_menu'
			CurrentActionMsg  = "Press ~INPUT_CONTEXT~ to access the menu"
			CurrentActionData = {property = property}
		end
	elseif part == 'exit' then
		CurrentAction     = 'room_exit'
		CurrentActionMsg  = "Press ~INPUT_CONTEXT~ to ~r~exit ~w~the property"
		CurrentActionData = {property = property, owner = CurrentPropertyOwner}
	elseif part == 'roomMenu' then
		CurrentAction     = 'room_menu'
		CurrentActionMsg  = "Press ~INPUT_CONTEXT~ to access the menu"
		CurrentActionData = {property = property, owner = CurrentPropertyOwner}
	elseif part == 'garage' then
		CurrentAction     = 'garage'
		CurrentActionMsg  = "Press ~INPUT_PICKUP~ to enter your vehicle"
		CurrentActionData = {property = property}
	end
end)

AddEventHandler('meeta_house:hasExitedMarker', function(name, part)
	_menuPoolHouse:CloseAllMenus()
	CurrentAction = nil
end)

RegisterNetEvent('meeta_house:setPropertyOwned')
AddEventHandler('meeta_house:setPropertyOwned', function(name, owned)
	SetPropertyOwned(name, owned)
end)

-- Create Blips
Citizen.CreateThread(function()

	for i=1, #Config.Properties, 1 do
		local property = Config.Properties[i]

		if property.entering then
			--blip = AddBlipForCoord(property.entering.x, property.entering.y, property.entering.z)
			Blips[property.name] = AddBlipForCoord(property.entering.x, property.entering.y, property.entering.z)

			SetBlipSprite (Blips[property.name], 369)
			SetBlipDisplay(Blips[property.name], 4)
			SetBlipScale  (Blips[property.name], 0.7)
			SetBlipAsShortRange(Blips[property.name], true)

			BeginTextCommandSetBlipName("STRING")
			AddTextComponentSubstringPlayerName("Property For Sale")
			EndTextCommandSetBlipName(Blips[property.name])
		end
	end

end)

-- Display markers
-- Enter / Exit marker events & Draw markers
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		local coords = GetEntityCoords(PlayerPedId())
		local isInMarker, letSleep = false, true
		local currentProperty, currentPart

		for i=1, #Config.Properties, 1 do
			local property = Config.Properties[i]

			-- Entering
			if property.entering and not property.disabled then
				local distance = GetDistanceBetweenCoords(coords, property.entering.x, property.entering.y, property.entering.z, true)

				if distance < Config.DrawDistance then
					DrawMarker(Config.MarkerType, property.entering.x, property.entering.y, property.entering.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, nil, nil, false)
					letSleep = false
				end

				if distance < Config.MarkerSize.x then
					isInMarker      = true
					currentProperty = property.name
					currentPart     = 'entering'
				end
			end

			-- Vehicle Garage 
			--if property.garage and not property.disabled and PropertyIsOwned(property) == true  then
			if property.garage and not property.disabled and PropertyIsOwned(property) == true  then
				local distance = GetDistanceBetweenCoords(coords, property.garage.Enter.x, property.garage.Enter.y, property.garage.Enter.z, true)

				if distance < Config.DrawDistance then
					DrawMarker(36, property.garage.Enter.x, property.garage.Enter.y, property.garage.Enter.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 2.0, 1.0, 200, 0, 0, 200, false, true, 2, false, nil, nil, false)
					letSleep = false
				end

				if distance < Config.MarkerSize.x then
					isInMarker      = true
					currentProperty = property.name
					currentPart     = 'garage'
				end
			end

			-- Exit
			if property.exit and not property.disabled then
				local distance = GetDistanceBetweenCoords(coords, property.exit.x, property.exit.y, property.exit.z, true)

				if distance < Config.DrawDistance then
					DrawMarker(Config.MarkerType, property.exit.x, property.exit.y, property.exit.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 0, false, true, 2, false, nil, nil, false)
					letSleep = false
				end

				if distance < Config.MarkerSize.x then
					isInMarker      = true
					currentProperty = property.name
					currentPart     = 'exit'
				end
			end

			-- Room menuexit the
			if property.roomMenu and hasChest and not property.disabled then
				local distance = GetDistanceBetweenCoords(coords, property.roomMenu.x, property.roomMenu.y, property.roomMenu.z, true)

				if distance < Config.DrawDistance then
					DrawMarker(Config.MarkerType, property.roomMenu.x, property.roomMenu.y, property.roomMenu.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.RoomMenuMarkerColor.r, Config.RoomMenuMarkerColor.g, Config.RoomMenuMarkerColor.b, 0, false, true, 2, false, nil, nil, false)
					letSleep = false
				end

				if distance < Config.MarkerSize.x then
					isInMarker      = true
					currentProperty = property.name
					currentPart     = 'roomMenu'
				end
			end
		end

		if isInMarker and not hasAlreadyEnteredMarker or (isInMarker and (LastProperty ~= currentProperty or LastPart ~= currentPart) ) then
			hasAlreadyEnteredMarker = true
			LastProperty            = currentProperty
			LastPart                = currentPart

			TriggerEvent('meeta_house:hasEnteredMarker', currentProperty, currentPart)
		end

		if not isInMarker and hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = false
			TriggerEvent('meeta_house:hasExitedMarker', LastProperty, LastPart)
		end

		if letSleep then
			Citizen.Wait(500)
		end
	end
end)

-- Key Control
Citizen.CreateThread(function()

	ObjectName = GetHashKey("v_ilev_housedoor1")
	RequestModel(ObjectName)
	while not HasModelLoaded(ObjectName) do
		Wait(1)
	end

	local object = CreateObject(ObjectName, 347.16, -1003.08, -100.1, false, false, true)
	PlaceObjectOnGroundProperly(object)
	FreezeEntityPosition(object, true)

	local object1 = CreateObject(ObjectName, 265.78, -1001.59, -100.01, false, false, true)
	PlaceObjectOnGroundProperly(object1)
	FreezeEntityPosition(object1, true)


	while true do

		Citizen.Wait(0)
		_menuPoolHouse:ProcessMenus()
		_menuPoolHouse2:ProcessMenus()
		_menuPoolHouse:ControlDisablingEnabled(false)
		_menuPoolHouse:MouseControlsEnabled(false)
		_menuPoolHouse2:ControlDisablingEnabled(false)
		_menuPoolHouse2:MouseControlsEnabled(false)
		if not _menuPoolHouse:IsAnyMenuOpen() then
			IsOpening = false
			--CurrentAction = nil
		end

		if CurrentAction then
			ESX.ShowHelpNotification(CurrentActionMsg)

			if IsControlJustReleased(0, Config.Key['E']) and not IsOpening then
				if CurrentAction == 'property_menu' then
					_mainMenuHouse = NativeUI.CreateMenu("Properties", CurrentActionData.property.label)
					_menuPoolHouse:Add(_mainMenuHouse)
					AddMenuProperty(_mainMenuHouse, CurrentActionData.property)
					_menuPoolHouse:RefreshIndex()

					_mainMenuHouse:Visible(not _mainMenuHouse:Visible()) -- Open Menu
					IsOpening = true
				elseif CurrentAction == 'gateway_menu' then
					_mainMenuHouse = NativeUI.CreateMenu("Properties", CurrentActionData.property.label)
					_menuPoolHouse:Add(_mainMenuHouse)
					AddMenuGateWay(_mainMenuHouse, CurrentActionData.property)
					_menuPoolHouse:RefreshIndex()

					_mainMenuHouse:Visible(not _mainMenuHouse:Visible()) -- Open Menu
					IsOpening = true
				elseif CurrentAction == 'room_menu' then
					OpenRoomMenu(CurrentActionData.property, CurrentActionData.owner)
					IsOpening = true
				elseif CurrentAction == 'room_exit' then
					if CurrentActionData.property.garage then
						_mainMenuHouse = NativeUI.CreateMenu("Properties", CurrentActionData.property.label)
						_menuPoolHouse:Add(_mainMenuHouse)
						OpenExitMenu(_mainMenuHouse, CurrentActionData.property, CurrentActionData.owner)
						_menuPoolHouse:RefreshIndex()
	
						_mainMenuHouse:Visible(not _mainMenuHouse:Visible()) -- Open Menu
					else
						TriggerEvent('instance:leave')
					end
					
					IsOpening = true
				elseif CurrentAction == 'garage' then

					_mainMenuHouse = NativeUI.CreateMenu("Properties", "Choose your garage.")
					_menuPoolHouse:Add(_mainMenuHouse)
					--AddMenuGateWay(_mainMenuHouse, CurrentActionData.property)
					OpenEnterGarage(_mainMenuHouse, CurrentActionData.property, CurrentActionData.owner)
					_menuPoolHouse:RefreshIndex()

					_mainMenuHouse:Visible(not _mainMenuHouse:Visible())
					IsOpening = true
				end
				_menuPoolHouse:ControlDisablingEnabled(false)
				_menuPoolHouse:MouseControlsEnabled(false)
				_menuPoolHouse2:ControlDisablingEnabled(false)
				_menuPoolHouse2:MouseControlsEnabled(false)
				--CurrentAction = nil
			end
		end

	end
end)

RegisterCommand("quit_house", function()
	if CurrentAction == 'room_exit' then
		if CurrentProperty == nil then
			ExitPropertyCommand(CurrentActionData.property.name)
		end
	end
end)

function ExitPropertyCommand(name)
	local property  = GetProperty(name)
	local playerPed = PlayerPedId()
	local outside   = nil
	CurrentProperty = nil

	if OpenMenuGarage == false then
		if property.isSingle then
			outside = property.outside
		else
			outside = GetGateway(property).outside
		end
	end

	isInside = false
	NetworkClearVoiceChannel()
	NetworkSetTalkerProximity(5.0)

	Citizen.CreateThread(function()
		DoScreenFadeOut(800)

		while not IsScreenFadedOut() do
			Citizen.Wait(0)
		end

		if OpenMenuGarage == false then
			SetEntityCoords(playerPed, outside.x, outside.y, outside.z)
		end

		for i=1, #property.ipls, 1 do
			RemoveIpl(property.ipls[i])
		end

		for i=1, #Config.Properties, 1 do
			Config.Properties[i].disabled = false
		end

		DoScreenFadeIn(800)
		OpenMenuGarage = false
	end)
end