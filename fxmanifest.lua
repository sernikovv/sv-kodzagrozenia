fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Sernikov'

shared_script '@ox_lib/init.lua'

client_script 'client.lua'
server_script 'server.lua'

dependency {
    'ox_lib',
    'ox_target'
}