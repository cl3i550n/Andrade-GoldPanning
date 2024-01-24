local VORPcore = exports.vorp_core:GetCore()
local miningPanEntity
local isCurrentlyPanning = false

local T = Translation.Langs[Config.Lang]

RegisterNetEvent('panning:client:StartGoldPanning')
AddEventHandler('panning:client:StartGoldPanning', function()
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)

    if not IsEntityDead(playerPed) then
        local waterHash = Citizen.InvokeNative(0x5BA7A68A346A5A91, playerCoords.x, playerCoords.y, playerCoords.z)
        for _, location in pairs(Config.locations) do
            if waterHash == location.hash and IsPedOnFoot(playerPed) and IsEntityInWater(playerPed) then
                if isPlayerStill(playerPed) and not isCurrentlyPanning then
                    performGoldPanning(playerPed)
                    break
                end
            end
        end
    end
end)

-- Função para executar o processo de garimpagem
function performGoldPanning(playerPed)
    attachMiningPanAndAnimate(playerPed)

    local crouchAnimDuration = math.random(12000, 18000)
    VORPcore.NotifyRightTip(T.haveLuck, 4000)
    Wait(crouchAnimDuration)
    ClearPedTasks(playerPed)

    executeGoldShakeAnimation(playerPed)

    local shakeAnimDuration = math.random(12000, 18000)
    VORPcore.NotifyRightTip(T.findAny, 4000)
    Wait(shakeAnimDuration)
    ClearPedTasks(playerPed)

    cleanupMiningPan(playerPed)

    TriggerServerEvent("panning:server:RewardGoldPanning")
    isCurrentlyPanning = false
end

function attachMiningPanAndAnimate(playerPed)
    local animationDict = "script_rc@cldn@ig@rsc2_ig1_questionshopkeeper"
    RequestAnimDict(animationDict)

    while not HasAnimDictLoaded(animationDict) do
        Citizen.Wait(10)
    end

    local coords = GetEntityCoords(playerPed)
    local rightHandBoneIndex = GetEntityBoneIndexByName(playerPed, "SKEL_R_HAND")
    local miningPanModelHash = GetHashKey("P_CS_MININGPAN01X")

    ensureModelLoaded(miningPanModelHash)
    miningPanEntity = CreateObject(miningPanModelHash, coords.x + 0.3, coords.y, coords.z, true, false, false)
    SetEntityVisible(miningPanEntity, true)
    SetEntityAlpha(miningPanEntity, 255, false)
    SetModelAsNoLongerNeeded(miningPanModelHash)
    AttachEntityToEntity(miningPanEntity, playerPed, rightHandBoneIndex, 0.2, 0.0, -0.2, -100.0, -50.0, 0.0, false, false, false, true, 2, true)

    TaskPlayAnim(playerPed, animationDict, "inspectfloor_player", 1.0, 8.0, -1, 1, 0, false, false, false)
end

function executeGoldShakeAnimation(playerPed)
    local animationDict = "script_re@gold_panner@gold_success"
    RequestAnimDict(animationDict)
    while not HasAnimDictLoaded(animationDict) do
        Citizen.Wait(10)
    end
    TaskPlayAnim(playerPed, animationDict, "SEARCH02", 1.0, 8.0, -1, 1, 0, false, false, false)
end

function ensureModelLoaded(model)
    local attempts = 0
    while attempts < 100 and not HasModelLoaded(model) do
        RequestModel(model)
        Citizen.Wait(10)
        attempts = attempts + 1
    end
    return IsModelValid(model)
end

function cleanupMiningPan(playerPed)
    ClearPedTasks(playerPed)
    DeleteObject(miningPanEntity)
    DeleteEntity(miningPanEntity)
end

function isPlayerStill(ped)
    return Citizen.InvokeNative(0xAC29253EEF8F0180, ped)
end

AddEventHandler('onClientResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
end)
