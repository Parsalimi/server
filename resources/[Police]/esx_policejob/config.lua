Config                            = {}

Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 0.5 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }

Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true
Config.EnableNonFreemodePeds      = false
Config.EnableLicenses             = true

Config.EnableHandcuffTimer        = true
Config.HandcuffTimer              = 10 * 60000

Config.EnableJobBlip              = false

Config.MaxInService               = -1
Config.Locale                     = 'en'

Config.PoliceStations = {

	LSPD = {

		Blip = {
			Coords  = vector3(-1098.1, -831.5, 14.7),
			Sprite  = 60,
			Display = 4,
			Scale   = 1.2,
			Colour  = 29
		},

		Cloakrooms = {
			vector3(-1098.6, -831.8, 14.6)
		},

		Armories = {
			vector3(-1105.68, -822.65, 14.69)
		},

		Vehicles = {
			{
				Spawner = vector3(-1068.6, -857.4, 4.4),
				InsideShop = vector3(-1078.5, -845.5, 4.5),
				SpawnPoints = {
					{ coords = vector3(-1065.4, -856.3, 4.7), heading = 215.0, radius = 6.0 },
					{ coords = vector3(-1056.0, -858.2, 4.7), heading = 156.0, radius = 6.0 },
					{ coords = vector3(-1075.5, -867.2, 5.0), heading = 261.0, radius = 6.0 }
				}
			},

			{
				Spawner = vector3(-1117.3, -845.8, 14.0),
				InsideShop = vector3(-1113.5, -834.5, 14.0),
				SpawnPoints = {
					{ coords = vector3(-1130.9, -840.6, 14.0), heading = 134.1, radius = 6.0 },
					{ coords = vector3(-1124.1, -849.1, 14.0), heading = 126.5, radius = 6.0 }
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(-1094.1, -840.5, 37.6),
				InsideShop = vector3(-1096.0, -832.4, 38.0),
				SpawnPoints = {
					{ coords = vector3(-1096.5, -832.2, 37.6), heading = 306.6, radius = 10.0 }
				}
			}
		},

		BossActions = {
			vector3(-1114.4, -831.2, 34.6)
		}

	}

}

Config.AuthorizedWeapons = {
	recruit = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	officer = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 0 },
		{ weapon = 'WEAPON_ADVANCEDRIFLE', components = { 0, 6000, 1000, 4000, 8000, nil }, price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	sergeant = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 0 },
		{ weapon = 'WEAPON_ADVANCEDRIFLE', components = { 0, 6000, 1000, 4000, 8000, nil }, price = 0 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 2000, 6000, nil }, price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	intendent = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 0 },
		{ weapon = 'WEAPON_ADVANCEDRIFLE', components = { 0, 6000, 1000, 4000, 8000, nil }, price = 0 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 2000, 6000, nil }, price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	lieutenant = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 0 },
		{ weapon = 'WEAPON_ADVANCEDRIFLE', components = { 0, 6000, 1000, 4000, 8000, nil }, price = 0 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 2000, 6000, nil }, price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	chef = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 0 },
		{ weapon = 'WEAPON_ADVANCEDRIFLE', components = { 0, 6000, 1000, 4000, 8000, nil }, price = 0 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 2000, 6000, nil }, price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	boss = {
		{ weapon = 'WEAPON_COMBATPISTOL', components = { 0, 0, 1000, 4000, nil }, price = 0 },
		{ weapon = 'WEAPON_CARBINERIFLE', components = { 0, 6000, 1000, 4000, 8000, nil }, price = 0 },
		{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 2000, 6000, nil }, price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	}
}

Config.AuthorizedVehicles = {
	Shared = {
		{ model = 'police2', label = 'Patrulla Recluta', price = 1 },
		{ model = 'sheriff', label = 'Patrulla Todoterreno', price = 1 },
		{ model = 'policeb', label = 'Patrulla en Moto', price = 1 },
		{ model = 'policeb1', label = 'Patrulla Hakuchou', price = 1 },
		{ model = 'policeb2', label = 'Patrulla BF400', price = 1 }

	},

	recruit = {
		{ model = 'police2', label = 'Patrulla Recluta', price = 1 },
		{ model = 'sheriff', label = 'Patrulla Todoterreno', price = 1 },
		{ model = 'policeb', label = 'Patrulla en Moto', price = 1 },
		{ model = 'policeb1', label = 'Patrulla Hakuchou', price = 1 },
		{ model = 'policeb2', label = 'Patrulla BF400', price = 1 }
	},

	officer = {
		{ model = 'police2', label = 'Patrulla Recluta', price = 1 },
		{ model = 'sheriff', label = 'Patrulla Todoterreno', price = 1 },
		{ model = 'policeb', label = 'Patrulla en Moto', price = 1 },
		{ model = 'police3', label = 'Patrulla Oficial', price = 1 },
		{ model = 'sheriff2', label = 'Patrulla Todoterreno oficial', price = 1 },
		{ model = 'policeb1', label = 'Patrulla Hakuchou', price = 1 },
		{ model = 'policeb2', label = 'Patrulla BF400', price = 1 }
		
	},

	sergeant = {
		{ model = 'police2', label = 'Patrulla Recluta', price = 1 },
		{ model = 'sheriff', label = 'Patrulla Todoterreno', price = 1 },
		{ model = 'policeb', label = 'Patrulla en Moto', price = 1 },
		{ model = 'police3', label = 'Patrulla Oficial', price = 1 },
		{ model = 'sheriff2', label = 'Patrulla Todoterreno oficial', price = 1 },
		{ model = 'fbi2', label = 'Mossos SWAT', price = 1 },
		{ model = '2015polstang', label = 'Patrulla Sargento', price = 1 },
		{ model = 'policeb1', label = 'Patrulla Hakuchou', price = 1 },
		{ model = 'policeb2', label = 'Patrulla BF400', price = 1 }
        },

	intendent = {
		{ model = 'police2', label = 'Patrulla Recluta', price = 1 },
		{ model = 'sheriff', label = 'Patrulla Todoterreno', price = 1 },
		{ model = 'policeb', label = 'Patrulla en Moto', price = 1 },
		{ model = 'police3', label = 'Patrulla Oficial', price = 1 },
		{ model = 'sheriff2', label = 'Patrulla Todoterreno oficial', price = 1 },
		{ model = 'fbi2', label = 'Mossos SWAT', price = 1 },
		{ model = '2015polstang', label = 'Patrulla Sargento', price = 1 },
		{ model = 'ghispo2', label = 'Patrulla Teniente', price = 1 },
		{ model = 'policeb1', label = 'Patrulla Hakuchou', price = 1 },
		{ model = 'policeb2', label = 'Patrulla BF400', price = 1 }
	},

	lieutenant = {
		{ model = 'police2', label = 'Patrulla Recluta', price = 1 },
		{ model = 'sheriff', label = 'Patrulla Todoterreno', price = 1 },
		{ model = 'policeb', label = 'Patrulla en Moto', price = 1 },
		{ model = 'police3', label = 'Patrulla Oficial', price = 1 },
		{ model = 'sheriff2', label = 'Patrulla Todoterreno oficial', price = 1 },
		{ model = 'fbi2', label = 'Mossos SWAT', price = 1 },
		{ model = '2015polstang', label = 'Patrulla Sargento', price = 1 },
		{ model = 'ghispo2', label = 'Patrulla Teniente', price = 1 },
		{ model = 'policeb1', label = 'Patrulla Hakuchou', price = 1 },
		{ model = 'policeb2', label = 'Patrulla BF400', price = 1 }
        },

	chef = {
		{ model = 'police2', label = 'Patrulla Recluta', price = 1 },
		{ model = 'sheriff', label = 'Patrulla Todoterreno', price = 1 },
		{ model = 'policeb', label = 'Patrulla en Moto', price = 1 },
		{ model = 'police3', label = 'Patrulla Oficial', price = 1 },
		{ model = 'sheriff2', label = 'Patrulla Todoterreno oficial', price = 1 },
		{ model = 'fbi2', label = 'Mossos SWAT', price = 1 },
		{ model = '2015polstang', label = 'Patrulla Sargento', price = 1 },
		{ model = 'ghispo2', label = 'Patrulla Teniente', price = 1 },
		{ model = 'policeb1', label = 'Patrulla Hakuchou', price = 1 },
		{ model = 'policeb2', label = 'Patrulla BF400', price = 1 },
		{ model = 'challenger18', label = 'Patrulla Demon', price = 1 }
	},

	boss = {
		{ model = 'police2', label = 'Patrulla Recluta', price = 1 },
		{ model = 'sheriff', label = 'Patrulla Todoterreno', price = 1 },
		{ model = 'policeb', label = 'Patrulla en Moto', price = 1 },
		{ model = 'police3', label = 'Patrulla Oficial', price = 1 },
		{ model = 'sheriff2', label = 'Patrulla Todoterreno oficial', price = 1 },
		{ model = 'fbi2', label = 'Mossos SWAT', price = 1 },
		{ model = '2015polstang', label = 'Patrulla Sargento', price = 1 },
		{ model = 'ghispo2', label = 'Patrulla Teniente', price = 1 },
		{ model = 'challenger18', label = 'Patrulla Demon', price = 1 },
		{ model = 'policeb1', label = 'Patrulla Hakuchou', price = 1 },
		{ model = 'policeb2', label = 'Patrulla BF400', price = 1 }
	}
}

Config.AuthorizedHelicopters = {
	recruit = {},

	officer = {},

	sergeant = {
		{ model = 'polmav', label = 'Police Maverick', livery = 0, price = 20 }
	},

	intendent = {
		{ model = 'polmav', label = 'Police Maverick', livery = 0, price = 20 }
	},

	lieutenant = {
		{ model = 'polmav', label = 'Police Maverick', livery = 0, price = 20 }
	},

	chef = {
		{ model = 'polmav', label = 'Police Maverick', livery = 0, price = 10 }
	},

	boss = {
		{ model = 'polmav', label = 'Police Maverick', livery = 0, price = 10 }
	}
}

Config.Uniforms = {
	recruit_wear = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 52,
			['pants_1'] = 52,   ['pants_2'] = 0,
			['shoes_1'] = 35,   ['shoes_2'] = 0,
			['helmet_1'] = 28,  ['helmet_2'] = 0,
			['chain_1'] = -1,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bags_1'] = 70,
		},
		female = {
			['tshirt_1'] = 36,  ['tshirt_2'] = 1,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = 45,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	officer_wear = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 52,
			['pants_1'] = 52,   ['pants_2'] = 0,
			['shoes_1'] = 35,   ['shoes_2'] = 0,
			['helmet_1'] = 28,  ['helmet_2'] = 0,
			['chain_1'] = -1,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bags_1'] = 70,	
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	sergeant_wear = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 52,
			['pants_1'] = 52,   ['pants_2'] = 0,
			['shoes_1'] = 35,   ['shoes_2'] = 0,
			['helmet_1'] = 28,  ['helmet_2'] = 0,
			['chain_1'] = -1,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bags_1'] = 70,
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 1,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	intendent_wear = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 52,
			['pants_1'] = 52,   ['pants_2'] = 0,
			['shoes_1'] = 35,   ['shoes_2'] = 0,
			['helmet_1'] = 28,  ['helmet_2'] = 0,
			['chain_1'] = -1,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bags_1'] = 70,
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 2,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	lieutenant_wear = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 52,
			['pants_1'] = 52,   ['pants_2'] = 0,
			['shoes_1'] = 35,   ['shoes_2'] = 0,
			['helmet_1'] = 28,  ['helmet_2'] = 0,
			['chain_1'] = -1,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bags_1'] = 70,
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 2,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	chef_wear = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 52,
			['pants_1'] = 52,   ['pants_2'] = 0,
			['shoes_1'] = 35,   ['shoes_2'] = 0,
			['helmet_1'] = 28,  ['helmet_2'] = 0,
			['chain_1'] = -1,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bags_1'] = 70,	
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 3,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	boss_wear = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 52,
			['pants_1'] = 52,   ['pants_2'] = 0,
			['shoes_1'] = 35,   ['shoes_2'] = 0,
			['helmet_1'] = 28,  ['helmet_2'] = 0,
			['chain_1'] = -1,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bags_1'] = 70,
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 3,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	bullet_wear = {
		male = {
			['bproof_1'] = 7,  ['bproof_2'] = 0
		},
		female = {
			['bproof_1'] = 13,  ['bproof_2'] = 1
		}
	},
	gilet_wear = {
		male = {
			['tshirt_1'] = 59,  ['tshirt_2'] = 1
		},
		female = {
			['tshirt_1'] = 36,  ['tshirt_2'] = 1
		}
	}

}