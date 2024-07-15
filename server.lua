ESX = exports.es_extended.getSharedObject()

RegisterServerEvent('sv-kodzagrozenia:webhook', function(color, message)
    local content = {
        {
            ["color"] = color,
            ["title"] = "**LSPD**",
            ["description"] = message,
            ["footer"] = {
                ["text"] = "Los Santos Police Department",
            },
        }
    }

    PerformHttpRequest('https://discord.com/api/webhooks/1262402927243300864/h7zhecmMpd35R6kh2NngpgXKf9xG4Ba9TatsqyWsPxjZXQEaCk3V07xc-AOstJzfXj2i', function(err, text, headers) end, 'POST', json.encode({username = "Los Santos Police Department", avatar_url = 'https://cdn.discordapp.com/attachments/920286977448890439/1262402132116766730/latest.png?ex=6696771a&is=6695259a&hm=a0804c9aee69ad6c3648973d94f37ecd22e1963e070036c36d0e2e90be535013&', embeds = content}), { ['Content-Type'] = 'application/json' })

end)

RegisterServerEvent('sv-kodzagrozenia:notifyAllPlayers', function(message)
    local xPlayers = ESX.GetPlayers()
    for i = 1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer then
            TriggerClientEvent('sv-kodzagrozenia:powiadomienie', xPlayer.source, message)
        end
    end
end)