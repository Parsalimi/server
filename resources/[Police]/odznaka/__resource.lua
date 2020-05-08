resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

author 'Jakub "RamBoV" Kurs'

client_script 'client.lua'

server_scripts {
  '@mysql-async/lib/MySQL.lua',
  'server.lua'
}
