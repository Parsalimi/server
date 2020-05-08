--------------------------------
------- Created by Hamza -------
-------------------------------- 

Config = {}

-- Police Settings:
Config.RequiredPoliceOnline = 1			-- required police online for players to do missions
Config.PoliceDatabaseName = "police"	-- set the exact name from your jobs database for police
Config.PoliceNotfiyEnabled = true		-- police notification upon truck robbery enabled (true) or disabled (false)
Config.PoliceBlipShow = true			-- enable or disable blip on map on police notify
Config.PoliceBlipTime = 30				-- miliseconds that blip is active on map (this value is multiplied with 4 in the script)
Config.PoliceBlipRadius = 50.0			-- set radius of the police notify blip
Config.PoliceBlipAlpha = 250			-- set alpha of the blip
Config.PoliceBlipColor = 5				-- set blip color

-- ## MISSION NPC PART ## --

-- Location where get mission from NPC:
Config.MissionNPC = {
	{
		Pos = {x=-1083.26,y=-820.45,z=14.881},		-- set NPC coords here
		Heading = 264.39,							-- set heading of the NPC here
		Ped = 's_m_y_swat_01'						-- set npc model name here
	},
}

-- Set to true/false depending on whether you want blip on the map for npc
Config.EnableGoldJobBlip = true

-- Mission NPC Blip Settings:
Config.EnableMapBlip = true							-- set between true/false
Config.BlipNameOnMap = "Mission SWAT"				-- set name of the blip
Config.BlipSprite = 280								-- set blip sprite, lists of sprite ids are here: https://docs.fivem.net/game-references/blips/
Config.BlipDisplay = 4								-- set blip display behaviour, find list of types here: https://runtime.fivem.net/doc/natives/#_0x9029B2F3DA924928
Config.BlipScale = 0.7								-- set blip scale/size on your map
Config.BlipColour = 5								-- set blip color, list of colors available in the bottom of this link: https://docs.fivem.net/game-references/blips/


-- ## GOLD JOB PART ## --

Config.MissionPosition = 
{
	{
		Location = vector3(491.0035400391,-3334.5546875,6.42578792572),
		InUse = false,
		Heading = 2.32929992676,
		GoonSpawns = {
			NPC1 = {
				x = 479.4285888672,
				y = -3053.6909179688,
				z = 6.275111198425,
				h = 358.84741973877,
				ped = 's_m_m_chemsec_01',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'WEAPON_SMG',
			},
			NPC2 = {
				x = 488.6131591797,
				y = -3054.9331054688,
				z = 6.999475479126,
				h = 0.08628845214,
				ped = 's_m_m_chemsec_01',
				animDict = 'rcmme_amanda1',
				anim = 'stand_loop_cop',
				weapon = 'WEAPON_SMG',
			},
			NPC3 = {
				x = 466.552734375,
				y = -3118.8950195313,
				z = 6.043141365051,
				h = 229.92164611816,
				ped = 's_m_m_chemsec_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_ASSAULTRIFLE',
			},
			NPC4 = {
				x = 501.552734375,
				y = -3125.8950195313,
				z = 6.043141365051,
				h = 90.92164611816,
				ped = 's_m_m_chemsec_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_ASSAULTRIFLE',
			},
			NPC5 = {
				x = 496.552734375,
				y = -3161.8950195313,
				z = 6.043141365051,
				h = 225.92164611816,
				ped = 's_m_m_chemsec_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_ASSAULTRIFLE',
			},
			NPC6 = {
				x = 495.552734375,
				y = -3203.8950195313,
				z = 6.043141365051,
				h = 272.92164611816,
				ped = 's_m_m_chemsec_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_ASSAULTRIFLE',
			},
			NPC7 = {
				x = 497.552734375,
				y = -3237.8950195313,
				z = 6.043141365051,
				h = 351.92164611816,
				ped = 's_m_m_chemsec_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_ASSAULTRIFLE',
			},
			NPC8 = {
				x = 471.552734375,
				y = -3238.8950195313,
				z = 6.043141365051,
				h = 356.92164611816,
				ped = 's_m_m_chemsec_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_ASSAULTRIFLE',
			},
			NPC9 = {
				x = 468.552734375,
				y = -3208.8950195313,
				z = 6.043141365051,
				h = 275.92164611816,
				ped = 's_m_m_chemsec_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_ASSAULTRIFLE',
			},
			NPC10 = {
				x = 462.552734375,
				y = -3196.8950195313,
				z = 6.043141365051,
				h = 259.92164611816,
				ped = 's_m_m_chemsec_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_ASSAULTRIFLE',
			},
			NPC11 = {
				x = 505.552734375,
				y = -3290.8950195313,
				z = 6.043141365051,
				h = 6.92164611816,
				ped = 's_m_m_chemsec_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_ASSAULTRIFLE',
			},
			NPC12 = {
				x = 478.552734375,
				y = -3313.8950195313,
				z = 6.043141365051,
				h = 341.92164611816,
				ped = 's_m_m_chemsec_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_ASSAULTRIFLE',
			},
			NPC13 = {
				x = 477.552734375,
				y = -3335.8950195313,
				z = 6.043141365051,
				h = 273.92164611816,
				ped = 's_m_m_chemsec_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_ASSAULTRIFLE',
			},
			NPC14 = {
				x = 495.552734375,
				y = -3352.8950195313,
				z = 6.043141365051,
				h = 1.92164611816,
				ped = 's_m_m_chemsec_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_ASSAULTRIFLE',
			},
			NPC15 = {
				x = 498.552734375,
				y = -3334.8950195313,
				z = 29.843141365051,
				h = 10.92164611816,
				ped = 's_m_m_chemsec_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_HEAVYSNIPER',
			}
		}
	},
	{
		Location = vector3(105.0035400391,-1941.5546875,20.42578792572),
		InUse = false,
		Heading = 45.32929992676,
		GoonSpawns = {
			NPC1 = {
				x = 107.4285888672,
				y = -1939.6909179688,
				z = 20.275111198425,
				h = 61.84741973877,
				ped = 'g_m_y_ballaorig_01',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'WEAPON_SMG',
			},
			NPC2 = {
				x = 103.6131591797,
				y = -1945.9331054688,
				z = 20.999475479126,
				h = 40.08628845214,
				ped = 'g_f_y_ballas_01',
				animDict = 'rcmme_amanda1',
				anim = 'stand_loop_cop',
				weapon = 'WEAPON_SMG',
			},
			NPC3 = {
				x = 87.552734375,
				y = -1943.8950195313,
				z = 20.043141365051,
				h = 291.92164611816,
				ped = 'g_m_y_ballasout_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_ASSAULTRIFLE',
			},
			NPC4 = {
				x = 90.552734375,
				y = -1951.8950195313,
				z = 20.043141365051,
				h = 317.92164611816,
				ped = 'g_m_y_ballaorig_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_ASSAULTRIFLE',
			},
			NPC5 = {
				x = 93.552734375,
				y = -1954.8950195313,
				z = 20.043141365051,
				h = 315.92164611816,
				ped = 'g_f_y_ballas_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_ASSAULTRIFLE',
			},
			NPC6 = {
				x = 110.552734375,
				y = -1956.8950195313,
				z = 20.043141365051,
				h = 25.92164611816,
				ped = 'g_m_y_ballasout_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_ASSAULTRIFLE',
			},
			NPC7 = {
				x = 118.552734375,
				y = -1946.8950195313,
				z = 20.043141365051,
				h = 65.92164611816,
				ped = 'g_m_y_ballasout_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_ASSAULTRIFLE',
			},
			NPC8 = {
				x = 116.552734375,
				y = -1933.8950195313,
				z = 20.043141365051,
				h = 116.92164611816,
				ped = 'g_m_y_ballaorig_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_ASSAULTRIFLE',
			},
			NPC9 = {
				x = 108.552734375,
				y = -1926.8950195313,
				z = 20.043141365051,
				h = 156.92164611816,
				ped = 'g_f_y_ballas_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_ASSAULTRIFLE',
			},
			NPC10 = {
				x = 97.552734375,
				y = -1917.8950195313,
				z = 20.043141365051,
				h = 151.92164611816,
				ped = 'g_m_y_ballasout_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_ASSAULTRIFLE',
			},
			NPC11 = {
				x = 78.552734375,
				y = -1934.8950195313,
				z = 20.043141365051,
				h = 312.92164611816,
				ped = 'g_m_y_ballasout_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_ASSAULTRIFLE',
			},
			NPC12 = {
				x = 91.552734375,
				y = -1914.8950195313,
				z = 20.043141365051,
				h = 148.92164611816,
				ped = 'g_f_y_ballas_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_ASSAULTRIFLE',
			},
			NPC13 = {
				x = 88.552734375,
				y = -1926.8950195313,
				z = 20.043141365051,
				h = 49.92164611816,
				ped = 'g_m_y_ballaorig_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_MINIGUN',
			},
			NPC14 = {
				x = 98.552734375,
				y = -1934.8950195313,
				z = 20.043141365051,
				h = 48.92164611816,
				ped = 'g_f_y_ballas_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_COMBATMG',
			},
			NPC15 = {
				x = 100.552734375,
				y = -1915.8950195313,
				z = 21.843141365051,
				h = 131.92164611816,
				ped = 'a_c_chop',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_HEAVYSNIPER',
			}
		}
	}
}

-- Gold Job Delivery Locations:
Config.DeliveryPoints = {
	vector3(3333.92,5161.19,18.31),
}

-- Gold Job Delivery Marker Setting:
Config.DeliveryDrawDistance  = 50.0
Config.DeliveryMarkerType  = 27
Config.DeliveryMarkerScale  = { x = 3.0, y = 3.0, z = 1.0 }
Config.DeliveryMarkerColor  = { r = 255, g = 255, b = 0, a = 100 }

-- Enable GTA style "mission complete/fail" notifications:
Config.EnableCustomNotification = true

-- Use BlackMoney or Cash for mission cost?
Config.UseBlackMoneyAsMissionCost = false

-- Set amount of money that mission should cost.
Config.MissionCost = 500

-- Set cooldown for doing gold jobs in minutes:
Config.JobCooldownTime = 3

-- Reward Settings:
Config.ItemName1 = "goldwatch"				-- exact name of your item1
Config.ItemMinAmount1 = 1					-- set minimum reward amount of item1 (this value is multiplied with x100)
Config.ItemMaxAmount1 = 5					-- set maximum reward amount of item1 (this value is multiplied with x100)
Config.EnableSecondItemReward = false		-- add another item as reward but this has only 50% chance 
Config.ItemName2 = "goldbar"				-- exact name of your item2
Config.ItemMinAmount2 = 1					-- set minimum reward amount of item2
Config.ItemMaxAmount2 = 3					-- set maximum reward amount of item2
Config.RandomChance = 2						-- Set chance, 1/2 is default, which is 50% chance. If u e.g. change value to 4, then 1/4 equals 25% chance.

-- ## SMELTERY PART ## --

-- Location where you melt to gold bars
Config.GoldSmeltery = {
	{ ["x"] = 1109.93, ["y"] = -2008.24, ["z"] = 31.06, ["h"] = 0 },
}

-- Smeltery Marker
Config.SmelteryMarker = 27
Config.SmelteryMarkerColor = { r = 255, g = 255, b = 0, a = 100 }

-- Set time it takes to convert gold watches into gold bar in seconds
Config.SmelteryTime = 15

-- Set to true/false depending on whether you want blip on the map for smeltery or not
Config.EnableSmelteryBlip = true


-- ## EXCHANGE PART ## --

-- Location where you exchange gold bars to cash
Config.GoldExchange = {
	{ ["x"] = -113.65, ["y"] = 6465.58, ["z"] = 31.63, ["h"] = 0 },
}

-- Exchange Marker
Config.ExchangeMarker = 27
Config.ExchangeMarkerColor = { r = 255, g = 255, b = 0, a = 100 }

-- Set time it takes to convert gold bars into cash in seconds
Config.ExchangeTime = 10

-- Set to true/false depending on whether you want blip on the map for exchange or not
Config.EnableExchangeBlip = true

-- Set cooldown for doing gold exchanges in minutes:
Config.ExchangeCooldown = 10


