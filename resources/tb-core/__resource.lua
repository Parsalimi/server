resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'The Core of the Framework'
version '1.0'

ui_page 'html/index.html'

client_scripts {
	'@tb-inventory/config.lua',
	'SharedConfig.lua',
	'client/main.lua',
	'client/functions.lua',
	'client/events.lua',
}

server_scripts {
	'@tb-inventory/config.lua',
	'SharedConfig.lua',
	'server/main.lua',
	'server/database.lua',
	'server/functions.lua',
	'server/commands.lua',
	'server/loops.lua',
	'server/player.lua',
}

files {
	'html/index.html',
	'html/reset.css',
	'html/script.js',
	'html/style.css',
	'html/idcard.png'
}