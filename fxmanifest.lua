fx_version 'adamant'

name 'ESX Priority Cooldown'
game 'gta5'
author 'Xyroot, Scott_UK & LanceGood'
description 'Lighly modified prioritycooldown for ESX'

version '1.0'

client_scripts {
    '@es_extended/locale.lua',
    'locales/*',
	'config.lua',
    'client/main.lua',
    'client/functions.lua'
}

server_scripts {
    '@es_extended/locale.lua',
    'locales/*',
    'config.lua',
	'server/main.lua',
    'server/functions.lua'
}


dependencies {
	'es_extended'
}
