Config = {}

-- Turn this to false if you want everyone to use this.
Config.OnlyPolicemen = true

-- This is how much ammo you should get per weapon you take out.
Config.ReceiveAmmo = 1000

-- You don't need to edit these if you don't want to.
Config.Armory = { ["x"] = -1102.32196044922, ["y"] = -829.03033447266, ["z"] = 14.689582824707, ["h"] = 34.0 }
Config.ArmoryPed = { ["x"] = -1103.87048095703, ["y"] = -827.77981201172, ["z"] = 14.289603805542, ["h"] = 215.0, ["hash"] = "s_m_y_cop_01" }

-- This is the available weapons you can pick out.
Config.ArmoryWeapons = {
	--{ ["hash"] = "weapon_assaultsmg", ["type"] = "rifle" },
	{ ["hash"] = "weapon_specialcarbine", ["type"] = "rifle" },
	{ ["hash"] = "weapon_combatpistol", ["type"] = "pistol" },
	{ ["hash"] = "weapon_nightstick", ["type"] = "pistol" },
	{ ["hash"] = "weapon_stungun", ["type"] = "pistol" },
	{ ["hash"] = "weapon_flashlight", ["type"] = "pistol" },
	{ ["hash"] = "weapon_fireextinguisher", ["type"] = "pistol" },
	{ ["hash"] = "weapon_flaregun", ["type"] = "pistol" },
	{ ["hash"] = "weapon_pumpshotgun", ["type"] = "rifle" }
}

