local VORPcore = exports.vorp_core:GetCore()

local T = Translation.Langs[Config.Lang]

Citizen.CreateThread(function()
    Citizen.Wait(2000)
    exports.vorp_inventory:registerUsableItem(Config.ItemToPanning, function(data)
        local src = data.source
        local hasLicense = exports.vorp_inventory:getItem(src, Config.ItemLicenseToPanning)

        if Config.EnableLicense then
            if not hasLicense then
                VORPcore.NotifyRightTip(src, T.needLicense, 4000)
                return
            end
        end

        TriggerClientEvent('panning:client:StartGoldPanning', src)
    end)
end)

RegisterNetEvent("panning:server:RewardGoldPanning")
AddEventHandler("panning:server:RewardGoldPanning", function()
    local src = source
    local User = VORPcore.getUser(src)
    local Character = User.getUsedCharacter
    local chance = math.random(1, Config.chanceGettingItem)

    if chance < Config.receiveItem then
        local chanceToReceived = math.random(1, #Config.items)
        local count = 1
        local canCarry = exports.vorp_inventory:canCarryItems(src, count)
        local canCarry2 = exports.vorp_inventory:canCarryItem(src, Config.items[chanceToReceived].name, count)

        if not canCarry then
            return VORPcore.NotifyRightTip(src, T.invFull, 4000)
        end

        if not canCarry2 then
            return VORPcore.NotifyRightTip(src, T.itemFull .. " " .. Config.items[chanceToReceived].label, 4000)
        end

        local message = T.youFound .. " " .. Config.items[chanceToReceived].label
        giveMiningReward(src, Character, Config.items[chanceToReceived].name, count, message)
    else
        VORPcore.NotifyRightTip(src, T.notFound, 4000)
    end
end)

function giveMiningReward(src, Character, itemName, quantity, message)
    local userName = Character.firstname .. " " .. Character.lastname
    exports.vorp_inventory:addItem(src, itemName, quantity)
    VORPcore.NotifyRightTip(src, message, 4000)
    sendDiscordMessage(userName ..
    " " .. T.Webhook.found .. " " .. quantity .. " " .. itemName .. " " .. os.date("%H:%M:%S - %d/%m/%Y") .. "\r")
end

function sendDiscordMessage(message)
    if Config.Webhook ~= "" then
        PerformHttpRequest(Config.Webhook, function(err, text, headers) end, 'POST', json.encode({ content = message }),
            { ['Content-Type'] = 'application/json' })
    end
end
