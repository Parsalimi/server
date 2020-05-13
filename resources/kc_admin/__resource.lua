resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

dependecy 'essentialmode'

ui_page 'html/index.html'

file {
	'html/index.html',
	'html/bootstrap.css',
	'html/custom.min.css',
	'html/jquery-ui.theme.css',
	'html/jquery-ui.js',
	'html/jquery.js',
	'html/listener.js'
}

server_scripts {
	'config.lua',
	'@mysql-async/lib/MySQL.lua',
	'server/server.lua'
}
client_scripts {
	'config.lua',
	'client/client.lua'
}