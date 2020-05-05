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

Config.BishopsStations = {

  Bishops = {

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
      { name = 'WEAPON_FLAREGUN',         price = 3000 },
      { name = 'GADGET_PARACHUTE',        price = 2000 },
      { name = 'WEAPON_SNIPERRIFLE',      price = 150000 },
      { name = 'WEAPON_SMOKEGRENADE',     price = 8000 },
      { name = 'WEAPON_APPISTOL',         price = 12000 },
      { name = 'WEAPON_FLARE',            price = 8000 },
      { name = 'WEAPON_SWITCHBLADE',      price = 500 },
	  { name = 'WEAPON_POOLCUE',          price = 100 },
	  
    },

	  AuthorizedVehicles = {
		  { name = 'schafter3',  label = 'Véhicule Civil' },
		  { name = 'btype',      label = 'Roosevelt' },
		  { name = 'sandking',   label = '4X4' },
		  { name = 'mule3',      label = 'Camion de Transport' },
		  { name = 'guardian',   label = 'Grand 4x4' },
		  { name = 'burrito3',   label = 'Fourgonnette' },
		  { name = 'mesa',       label = 'Tout-Terrain' },
	  },

    Cloakrooms = {
      { x = -102.44117736816, y = 6194.1323242188, z = 31.025022506714 },
    },

    Armories = {
      { x = -160.44479370117, y = 6144.7456054688, z = 31.206388473511 },
    },

    Vehicles = {
      {
        Spawner    = { x = -62.361843109131, y = 6272.5083007813, z = 31.339160919189 },
        SpawnPoint = { x = -55.655471801758, y = 6274.8779296875, z = 31.38808631897 },
        Heading    = 90.0,
      }
    },
	
	Helicopters = {
      {
        Spawner    = { x = 1.966269493103, y = 6312.2241210938, z = 31.226146697998 },
        SpawnPoint = { x = -17.710485458374, y = 6320.2275390625, z = 31.23101234436 },
        Heading    = 0.0,
      }
    },

    VehicleDeleters = {
      { x = -33.525764465332, y = 6295.8530273438, z = 31.281017303467 },
      { x = -41.788902282715, y = 6288.9165039063, z = 31.283292770386 },
    },

    BossActions = {
      { x = -68.407188415527, y = 6255.6206054688, z = 31.09015083313 }
    },

  },

}
