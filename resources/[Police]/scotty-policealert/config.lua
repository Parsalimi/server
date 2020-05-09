--[[
	file: config.lua
	resource: scotty-policealert
	author: Scotty1944
	contact: https://steamcommunity.com/id/scotty1944/
	warning: หากนำไปขายต่อหรือแจกจ่าย หรือใช้ร่วมกันเกิน 1 server จะถูกยกเลิก license ทันที
]]

Config = {}
Config["base_key"] = 19 -- ปุ่มหลักในการใช้ร่วมกับปุ่มตัวเลข เช่น ALT + 1
Config["base_key_text"] = "ALT" -- ชื่อปุ่มที่แสดงในแจ้งเตือน
Config["duration"] = 15 -- ระยะเวลาที่จะตอบรับ
Config["red_radius"] = 60.0 -- ขนาดของวงที่จะขึ้นบนแมพ เมื่อมีการแจ้งเตือน

Config["alert_section"] = {
	carjacking = true,
	melee = true,
	gunshot = true,
	drug = true,
	fishing = true,
	burglary = true,
	thief = true,
}

-- การ Setup โดยการวาง Event ที่ระบบหลัก
-- ถ้าเป็นไฟล์ Client ให้  TriggerEvent("scotty-policealert:alertNet", "thief") -- เปลี่ยน event ได้
-- ถ้าเป็นไฟล์ Server ให้ TriggerClientEvent("scotty-policealert:getalertNet", source, "thief") -- เปลี่ยน event ได้

--Possible Value: top topLeft topCenter topRight bottom bottomLeft bottomCenter bottomRight center centerLeft centerRight
Config["alert_position"] = "topRight" -- ใช้ร่วมกับ pNotify

Config["translate"] = {
	title = "",
	male = "Mard",
	female = "Zan",
	text = "Yek <span style=\"color:red;\">%s</span> % s dar <span style=\"color:lightblue;\">%s</span>",
	tip = "Bezan Baraye moshakhas kardn mantaghe",
	action_carjacking = "Serghat az Mashin Kard",
	action_melee = "Mobareze Khiabani Mikonad",
	action_gunshot = "Tirandazi Kard",
	action_fishing = "Mahigir gheir ghanoni Kard",
	action_burglary = "serghat az khane Kard",
	action_drug = "Forosh Mavad Kard",
	action_thief = "Kasi ra dozdid Kard"
}