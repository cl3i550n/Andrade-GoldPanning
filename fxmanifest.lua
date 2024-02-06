fx_version "adamant"
games { "rdr3" }
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

client_scripts {
	'client/client.lua'
}

server_scripts {
	'server/server.lua'
}

shared_scripts {
	'shared/translation.lua',
	'config.lua',
}

dependencies {
	'vorp_core',
	'vorp_inventory'
}

author '<4NDR4D3/>'
description 'Andrade-GoldPanning | Join https://discord.gg/fBAQTBRvat'
version '1.0.0'
