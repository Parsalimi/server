Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 1.0 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }
Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- only turn this on if you are using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = false
Config.MaxInService               = -1
Config.Locale                     = 'en'

Config.DismayStations = {

  Dismay = {

    Blip = {
      Pos     = { x = 425.130, y = -979.558, z = 30.711 },
      Sprite  = 60,
      Display = 4,
      Scale   = 1.2,
      Colour  = 29,
    },

    AuthorizedWeapons = {
      { name = 'WEAPON_COMBATPISTOL',     price = 4000 },
      { name = 'WEAPON_ASSAULTSMG',       price = 50000 },
      { name = 'WEAPON_ASSAULTRIFLE',     price = 80000 },
      { name = 'WEAPON_PUMPSHOTGUN',      price = 18000 },
      { name = 'WEAPON_STUNGUN',          price = 250 },
      { name = 'WEAPON_FLASHLIGHT',       price = 50 },
      { name = 'WEAPON_FIREEXTINGUISHER', price = 50 },
      { name = 'WEAPON_CARBINERIFLE',     price = 50000 },
      { name = 'WEAPON_ADVANCEDRIFLE',    price = 50000 },
      { name = 'WEAPON_SNIPERRIFLE',      price = 150000 },
      { name = 'WEAPON_SMOKEGRENADE',     price = 8000 },
      { name = 'WEAPON_APPISTOL',         price = 12000 },
      { name = 'WEAPON_FLARE',            price = 8000 },
      { name = 'WEAPON_SWITCHBLADE',      price = 500 },
	  { name = 'WEAPON_POOLCUE',          price = 100 },
	  
    },

	  AuthorizedVehicles = {
		  { name = 'barracks',  label = 'Barracks' },
		  { name = 'crusader',      label = 'MRAP' },
		  { name = 'sandking',   label = '4X4' },
		  { name = 'mule3',      label = 'Camion de Transport' },
		  { name = 'guardian',   label = 'Grand 4x4' },
		  { name = 'burrito3',   label = 'Fourgonnette' },
		  { name = 'maverick',       label = 'Helicopter' },
		  { name = 'cog55',       label = 'Executive' },
		  { name = 'mesa',       label = 'Tout-Terrain' },		  
	  },

    Cloakrooms = {
      { x = -557.15936279297, y = -1664.2742919922, z = 19.232103347778 },
    },

    Armories = {
      { x = -557.51293945313, y = -1647.9538574219, z = 19.159944534302 },
    },

    Vehicles = {
      {
        Spawner    = { x = -546.53033447266, y = -1635.5810546875, z = 19.017934799194 },
        SpawnPoint = { x = -550.45971679688, y = -1646.0279541016, z = 19.035224914551 },
        Heading    = 90.0,
      }
    },
	
	Helicopters = {
      {
        Spawner    = { x = 2530.029296875, y = 4964.0009765625, z = 44.254215240479 },
        SpawnPoint = { x = -515.94903564453, y = -1710.0793457031, z = 19.316900253296 },
        Heading    = 0.0,
      }
    },

    VehicleDeleters = {
      { x = -528.86901855469, y = -1713.7420654297, z = 19.296091079712 },
      { x = -542.26928710938, y = -1712.6313476563, z = 19.146661758423 },
    },

    BossActions = {
      { x = -554.76190185547, y = -1695.2635498047, z = 19.241809844971 }
    },

  },

}
