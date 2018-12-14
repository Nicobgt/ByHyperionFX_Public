resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'Hyperion Playerlist'

ui_page 'html/scoreboard.html'

client_scripts {
	"lib/Proxy.lua",
	"lib/Tunnel.lua",
	"client.lua"
}

server_scripts {
	"@vrp/lib/utils.lua",
	"server.lua"
}

files {
	'html/scoreboard.html',
	'html/style.css',
	'html/logo.png',
	'html/reset.css',
	'html/listener.js'
}

--[[
__________         ___ ___                             .__               
\______   \___.__./   |   \ ___.__.______   ___________|__| ____   ____  
 |    |  _<   |  /    ~    <   |  |\____ \_/ __ \_  __ \  |/  _ \ /    \ 
 |    |   \\___  \    Y    /\___  ||  |_> >  ___/|  | \/  (  <_> )   |  \
 |______  // ____|\___|_  / / ____||   __/ \___  >__|  |__|\____/|___|  /
        \/ \/           \/  \/     |__|        \/                     \/ 
--]]