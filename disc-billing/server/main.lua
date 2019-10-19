ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

RegisterCommand("bill", function(src, args, raw)
    local player = ESX.GetPlayerFromId(src)
    local society = 'society_'..player.job.name

    if society ~= nil and society ~= 'society_unemployed' then
        local billing = {
            sourcePlayer = player,
            society = society
        }
        TriggerClientEvent("disc-billing:bill", src, billing)
    end
end)
