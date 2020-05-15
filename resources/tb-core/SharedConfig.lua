TBConfig = {}

TBConfig.DefaultSettings = {
    defaultCash = 2500,
    defaultBank = 2500,
    floatDelay  = 60 * 1000 * 120
}

TBConfig.spawnPosition = {x = 195.08, y = -933.86, z = 29.7}

TBConfig.Cryptos = {
    ["tbcoin"] = {
        defaultValue    = 3000,
        maxValue        = 5000,
        minValue        = 2000
    }
}

TBConfig.InventoryItems = { 
    [1] =   {name = "laptop",               label = "Laptop",               description="Een laptop kan je gebruiken voor verschillende dingen",    type = "item",      usable = true,   unique = false,   stackable=true,  weight = 1000},
    [2] =   {name = "usb",                  label = "Bootable USB",         description="Je kan een USB gebruiken voor onder andere je laptop",     type = "item",      usable = true,   unique = false,   stackable=true,  weight = 1000},
    [3] =   {name = "joint",                label = "Joint",                description="Een joint kan je roken om de wolken in te gaan",           type = "item",      usable = true,   unique = false,   stackable=true,  weight = 250 },
    [4] =   {name = "identitycard",         label = "ID-kaart",             description="Met een ID-kaart kan je je identificeren",                 type = "item",      usable = true,   unique = false,   stackable=true,  weight = 1000},
    [5] =   {name = "driverlicense",        label = "Rijbewijs",            description="Hiermee kan je aantonen dat je mag rijden",                type = "item",      usable = true,   unique = false,   stackable=true,  weight = 1000},
    [6] =   {name = "goldbar",              label = "Gold Bar",             description="Een goudstaaf is veel geld waard",                         type = "item",      usable = true,   unique = false,   stackable=true,  weight = 1000},
    [7] =   {name = "bread",                label = "Sandwich",             description="Hier kan je je eetlust mee verhelpen",                     type = "item",      usable = true,   unique = false,   stackable=true,  weight = 1000},
    [8] =   {name = "water",                label = "Water",                description="Hier kan je je drinklust mee verhelpen",                   type = "item",      usable = true,   unique = false,   stackable=true,  weight = 1000},
    [9] =   {name = "burger",               label = "Burger",               description="Hier kan je je eetlust mee verhelpen",                     type = "item",      usable = true,   unique = false,   stackable=true,  weight = 1000},
    [10] =  {name = "firstaid",             label = "First Aid",            description="Hier kan je je wonden mee dicht plakken",                  type = "item",      usable = true,   unique = false,   stackable=true,  weight = 1000},
    [11] =  {name = "radio",                label = "Walkie Talkie",        description="Hiermee kan je op een signaal met mensen communiceren",    type = "item",      usable = true,   unique = false,   stackable=true,  weight = 1000},
    [12] =  {name = "lockpick",             label = "Lockpick",             description="Hiermee kan je sloten op breken",                          type = "item",      usable = true,   unique = false,   stackable=true,  weight = 1000},
    [13] =  {name = "weapon_pistol",        label = "Walther P99",          description="Kaliber: 9x19mm Parabellum",                               type = "weapon",    usable = true,   unique = false,   stackable=false, weight = 1000},
    [14] =  {name = "weapon_combatpistol",  label = "Glock",                description="Kaliber: 9x19mm Parabellum",                               type = "weapon",    usable = true,   unique = false,   stackable=false, weight = 1000},
    [15] =  {name = "weapon_stungun",       label = "Taser",                description="Kaliber: Cartridge",                                       type = "weapon",    usable = true,   unique = false,   stackable=false, weight = 1000},
    [16] =  {name = "weapon_smg",           label = "MP5",                  description="Kaliber: 9x19mm Parabellum",                               type = "weapon",    usable = true,   unique = false,   stackable=false, weight = 1000},
    [17] =  {name = "weapon_carbinerifle",  label = "M4A1",                 description="Kaliber: 5.56×45mm NATO",                                  type = "weapon",    usable = true,   unique = false,   stackable=false, weight = 1000},
    [18] =  {name = "weapon_crowbar",       label = "Koevoet",              description="Inbrekersgereedschap",                                     type = "weapon",    usable = false,  unique = false,   stackable=false, weight = 1500},
    [19] =  {name = "ogkush",               label = "2G OG Kush",           description="OG Kush is de soort wiet, totaal gewicht: 2G",             type = "item",      usable = false,  unique = false,   stackable=true,  weight = 200},
    [20] =  {name = "amnesia",              label = "2G Amnesia",           description="Amnesia is de soort wiet, totaal gewicht: 2G",             type = "item",      usable = false,  unique = false,   stackable=true,  weight = 200},
    [21] =  {name = "skunk",                label = "2G Skunk",             description="Skunk is de soort wiet, totaal gewicht: 2G",               type = "item",      usable = false,  unique = false,   stackable=true,  weight = 200},
    [22] =  {name = "ak47",                 label = "2G AK 47",             description="AK 47 is de soort wiet, totaal gewicht: 2G",               type = "item",      usable = false,  unique = false,   stackable=true,  weight = 200},
    [23] =  {name = "purplehaze",           label = "2G Purple Haze",       description="Purple Haze is de soort wiet, totaal gewicht: 2G",         type = "item",      usable = false,  unique = false,   stackable=true,  weight = 200},
    [24] =  {name = "whitewidow",           label = "2G White Widow",       description="White Widow is de soort wiet, totaal gewicht: 2G",         type = "item",      usable = false,  unique = false,   stackable=true,  weight = 200},
}

TBConfig.UserGroups = {
    ["user"] = {label = "User"},
    ["admin"] = {label = "Admin"}
}

TBConfig.Dead = {
    forcerespawn = 1800000, -- 30 min
    respawntimer = 300000, -- 5 min
}

TBConfig.cellularCost = {
    cellularCost = 15,
    timeout =  3600 * 1000 * 3
}