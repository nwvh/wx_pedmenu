fx_version 'cerulean'
game 'gta5'
version '1.0.0'
author 'wx / woox'
description 'Simple player ped changing script'
lua54 'yes'
client_scripts {
    'client/*.lua',
}
server_scripts {
    'server/*.lua',
}

shared_scripts {'@ox_lib/init.lua','configs/*.lua'}