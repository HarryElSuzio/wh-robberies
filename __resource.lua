resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

client_script { 
	"config.lua",
	"client.lua",
	"pd-safe/cl_safe.lua"
}

server_script {
	"config.lua",
	"server.lua"
}

dependencies {
	'mythic_notify',
	'esx_policejob'
}