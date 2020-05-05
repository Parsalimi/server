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

Config.GroveStations = {

  Grove = {

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
      { x = -18.316884994507, y = -1438.61328125, z = 31.101543426514 },
    },

    Armories = {
      { x = -17.134414672852, y = -1430.4561767578, z = 31.101528167725 },
    },

    Vehicles = {
      {
        Spawner    = { x = -25.224924087524, y = -1434.8931884766, z = 30.653142929077 },
        SpawnPoint = { x = -24.449729919434, y = -1441.3275146484, z = 30.653142929077 },
        Heading    = 90.0,
      }
    },
	
	Helicopters = {
      {
        Spawner    = { x = -12.789277076721, y = -1428.5339355469, z = 34.15209197998 },
        SpawnPoint = { x = -12.203351974487, y = -1436.1190185547, z = 34.15209197998 },
        Heading    = 0.0,
      }
    },

    VehicleDeleters = {
      { x = -26.673856735229, y = -1427.6628417969, z = 30.672258377075 },
      { x = -24.101741790771, y = -1427.7016601563, z = 30.656564712524 },
    },

    BossActions = {
      { x = -9.7409744262695, y = -1434.5415039063, z = 31.101552963257 }
    },

  },

}
