fx_version 'cerulean'
game "gta5"

author 'SCORZ'
description 'Money wash resource for FiveM'

client_scripts {
    'config.lua',
    'utils.lua',
    'client.lua'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'server.lua',
    'config.lua'
}