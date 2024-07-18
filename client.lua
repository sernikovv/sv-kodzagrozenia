exports.ox_target:addBoxZone({
	coords = vec3(442.0, -982.0, 31.0),
	size = vec3(1, 3, 2),
	rotation = 0.0,
    drawSprite = true,
    options = {
        {
            name = 'kodzagroznia',
            onSelect = function ()
                lib.showContext('kodzagroznia')
            end,
            icon = 'fa-regular fa-clipboard',
            label = 'Ustaw kod zagrożenia',
            groups = 'police'
        }
    }
})

local color = nil
local message = nil

lib.registerContext({
    id = 'kodzagroznia',
    title = 'Ustaw kod zagrożenia',
    options = {
      {
        title = 'Kod Zielony 🟢',
        description = 'Brak zagrożenia. Miasto jest bezpieczne, a normalna codzienna działalność może być prowadzona bez ograniczeń',
        icon = 'circle',
        onSelect = function()
            color = 65280
            message = 'Na miasto zostaje nałożony kod ZIELONY'
            TriggerServerEvent('sv-kodzagrozenia:notifyAllPlayers', message)
            TriggerServerEvent('sv-kodzagrozenia:webhook', color, message)    
        end,
      },
      {
        title = 'Kod Pomarańczowy 🟠',
        description = 'Potencjalne zagrożenie. Istnieje podwyższone ryzyko, które może wpłynąć na bezpieczeństwo mieszkańców',
        icon = 'circle',
        onSelect = function()
            color = 16750592
            message = 'Na miasto zostaje nałożony kod POMARAŃCZOWY, prosimy o zachowanie ostrożności'
            TriggerServerEvent('sv-kodzagrozenia:notifyAllPlayers', message)
            TriggerServerEvent('sv-kodzagrozenia:webhook', color, message)    
        end,
      },
      {
        title = 'Kod Czerwony 🔴',
        description = 'Wysokie zagrożenie. Istnieje bezpośrednie ryzyko dla bezpieczeństwa mieszkańców, wymagające natychmiastowych działań',
        icon = 'circle',
        onSelect = function()
            color = 16711680
            message = 'Na miasto zostaje nałożony kod CZERWONY, prosimy o pozostanie w domach'
            TriggerServerEvent('sv-kodzagrozenia:notifyAllPlayers', message)
            TriggerServerEvent('sv-kodzagrozenia:webhook', color, message)    
        end,
      },
      {
        title = 'Kod Czarny ⚫',
        description = 'Ekstremalne zagrożenie. Miasto znajduje się w stanie poważnego kryzysu, który może prowadzić do katastrofalnych skutków',
        icon = 'circle',
        onSelect = function()
            color = 0
            message = 'Na miasto zostaje nałożony kod CZARNY, prosimy o pozostanie w domach bez względu na okoliczności'
            TriggerServerEvent('sv-kodzagrozenia:notifyAllPlayers', message)
            TriggerServerEvent('sv-kodzagrozenia:webhook', color, message)
    
        end,
      },
    }
})

RegisterNetEvent('sv-kodzagrozenia:powiadomienie')
AddEventHandler('sv-kodzagrozenia:powiadomienie', function(message)
    lib.notify({
        title = 'Kod zagrożenia',
        description = message,
        type = 'inform'
    })
end)
