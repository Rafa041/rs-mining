local RSGCore = exports['rsg-core']:GetCoreObject()
local miningstarted = false
local mining
local testAnimDict = 'amb_work@world_human_pickaxe@wall@male_d@base'
local testAnim = 'base'
local miningBlips = {}               -- Armazena os blips das minas criados
local miningPointBlips = {}          -- Armazena os blips dos pontos de mineração
local blipVisibilityDistance = 100.0 -- Distância máxima para mostrar blips (100 metros)
local pickaxeProp = nil              -- Armazena a referência da picareta

local LoadAnimDict = function(dict)
    local isLoaded = HasAnimDictLoaded(dict)

    while not isLoaded do
        RequestAnimDict(dict)
        Wait(5)
        isLoaded = not isLoaded
    end
end

-- Função para remover a picareta
local function removePickaxe()
    if pickaxeProp and DoesEntityExist(pickaxeProp) then
        SetEntityAsNoLongerNeeded(pickaxeProp)
        DeleteEntity(pickaxeProp)
        DeleteObject(pickaxeProp)
        pickaxeProp = nil
    end
end

--------------------------------------------------------------------------

-- Função para criar blips usando o método nativo do RedM
local function addBlipForCoords(blipname, bliphash, coords, color)
    local blip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, coords[1], coords[2], coords[3])
    -- Usar função nativa do RedM para definir sprite
    Citizen.InvokeNative(0x74F74D3207ED525C, blip, bliphash, true)
    -- Usar função nativa do RedM para definir escala
    Citizen.InvokeNative(0xD38744167B2FA257, blip, 0.2)
    -- Definir nome do blip
    Citizen.InvokeNative(0x9CB1A1623062F402, blip, blipname)
    -- Define a cor do blip se fornecida
    if color then
        Citizen.InvokeNative(0x662D364ABF16DE2F, blip, color)
    end
    return blip
end

-- Função para remover todos os blips
local function removeAllBlips()
    -- Remove blips das minas
    for _, blip in pairs(miningBlips) do
        if blip and DoesBlipExist(blip) then
            RemoveBlip(blip)
        end
    end
    miningBlips = {}

    -- Remove blips dos pontos
    for _, blip in pairs(miningPointBlips) do
        if blip and DoesBlipExist(blip) then
            RemoveBlip(blip)
        end
    end
    miningPointBlips = {}
end

-- Função para criar apenas os blips das minas principais (sempre visíveis)
local function createMineBlips()
    -- Cria blips das minas
    for mineId, mineData in pairs(Config.Mines) do
        if not mineData.isSecret and Config.MineBlips[mineId] then
            local blipConfig = Config.MineBlips[mineId]
            local coords = { blipConfig.coords.x, blipConfig.coords.y, blipConfig.coords.z }
            local blip = addBlipForCoords(blipConfig.name, blipConfig.hash, coords, blipConfig.color)
            table.insert(miningBlips, blip)
            print("Criado blip da mina: " .. mineId .. " - " .. blipConfig.name)
        end
    end
end

-- Função para criar apenas os blips dos pontos de mineração da mina específica
local function createMiningPointBlips(nearbyMineId)
    -- Cria blips dos pontos de mineração apenas da mina próxima
    if nearbyMineId and Config.Mines[nearbyMineId] then
        for _, location in pairs(Config.Mines[nearbyMineId].locations) do
            if location.showblip == true then
                local coords = { location.coords.x, location.coords.y, location.coords.z }
                local blip = addBlipForCoords(location.name, 692310, coords, 2)
                table.insert(miningPointBlips, blip)
                print("Criado blip do ponto: " .. location.name .. " (Mina: " .. nearbyMineId .. ")")
            end
        end
    end
end

-- Função para remover apenas os blips dos pontos de mineração
local function removeMiningPointBlips()
    -- Remove blips dos pontos
    for _, blip in pairs(miningPointBlips) do
        if blip and DoesBlipExist(blip) then
            RemoveBlip(blip)
        end
    end
    miningPointBlips = {}
end

-- Função para criar todos os blips
local function createAllBlips()
    -- Remove blips existentes primeiro
    removeAllBlips()

    -- Cria blips das minas (sempre visíveis)
    createMineBlips()

    -- Cria blips dos pontos de mineração (controlados por distância)
    createMiningPointBlips()

    print("Total de blips criados - Minas: " .. #miningBlips .. ", Pontos: " .. #miningPointBlips)
end

-- Função para verificar se o jogador está próximo de alguma mina
local function isPlayerNearAnyMine()
    local playerCoords = GetEntityCoords(PlayerPedId())
    local nearestDistance = math.huge

    for mineId, mineData in pairs(Config.Mines) do
        if not mineData.isSecret then
            -- Verifica distância até a mina principal
            if Config.MineBlips[mineId] then
                local mineCoords = Config.MineBlips[mineId].coords
                local distance = #(playerCoords - mineCoords)
                if distance < nearestDistance then
                    nearestDistance = distance
                end
            end

            -- Verifica distância até os pontos de mineração
            for _, location in pairs(mineData.locations) do
                local distance = #(playerCoords - location.coords)
                if distance < nearestDistance then
                    nearestDistance = distance
                end
            end
        end
    end

    return nearestDistance <= blipVisibilityDistance
end

-- Variável para controlar se os blips estão visíveis
local blipsVisible = true

-- Função para controlar visibilidade dos blips dos pontos de mineração
local function updateBlipVisibility()
    local playerCoords = GetEntityCoords(PlayerPedId())
    local isNearAnyMine = false
    local nearestDistance = math.huge
    local nearbyMineId = nil

    -- Verifica se está próximo de qualquer mina (só para os pontos)
    for mineId, mineData in pairs(Config.Mines) do
        if not mineData.isSecret then
            -- Verifica distância até a mina principal
            if Config.MineBlips[mineId] then
                local mineCoords = Config.MineBlips[mineId].coords
                local distance = #(playerCoords - mineCoords)
                if distance < nearestDistance then
                    nearestDistance = distance
                    nearbyMineId = mineId
                end
                if distance <= blipVisibilityDistance then
                    isNearAnyMine = true
                end
            end

            -- Verifica distância até os pontos de mineração
            for _, location in pairs(mineData.locations) do
                local distance = #(playerCoords - location.coords)
                if distance < nearestDistance then
                    nearestDistance = distance
                    nearbyMineId = mineId
                end
                if distance <= blipVisibilityDistance then
                    isNearAnyMine = true
                end
            end
        end
    end

    -- Debug: mostra distância mais próxima a cada 10 segundos
    if math.random(1, 10) == 1 then
        print("Distância mais próxima: " ..
            math.floor(nearestDistance) ..
            "m, Próximo: " .. tostring(isNearAnyMine) .. ", Mina: " .. (nearbyMineId or "nenhuma"))
    end

    -- Só atualiza se o estado mudou (apenas para os pontos)
    if isNearAnyMine ~= blipsVisible then
        blipsVisible = isNearAnyMine

        if blipsVisible then
            -- Recria apenas os blips dos pontos da mina específica
            createMiningPointBlips(nearbyMineId)
            print("Criando pontos de mineração - jogador próximo da mina: " .. (nearbyMineId or "desconhecida"))
        else
            -- Remove apenas os blips dos pontos
            removeMiningPointBlips()
            print("Removendo pontos de mineração - jogador longe")
        end
    end
end

-- Sistema de blips para minas - inicializa com blips das minas principais sempre visíveis
CreateThread(function()
    Wait(2000)        -- Aguarda 2 segundos para garantir que tudo está carregado
    createMineBlips() -- Cria apenas os blips das minas principais (sempre visíveis)
    print("Blips das minas principais criados - sempre visíveis no mapa")

    -- Verifica se o jogador está próximo de alguma mina para criar os pontos iniciais
    Wait(1000) -- Aguarda mais 1 segundo
    local playerCoords = GetEntityCoords(PlayerPedId())
    local nearestDistance = math.huge
    local nearbyMineId = nil

    -- Encontra a mina mais próxima
    for mineId, mineData in pairs(Config.Mines) do
        if not mineData.isSecret then
            if Config.MineBlips[mineId] then
                local mineCoords = Config.MineBlips[mineId].coords
                local distance = #(playerCoords - mineCoords)
                if distance < nearestDistance then
                    nearestDistance = distance
                    nearbyMineId = mineId
                end
            end
        end
    end

    if nearbyMineId and nearestDistance <= blipVisibilityDistance then
        createMiningPointBlips(nearbyMineId)
        print("Jogador próximo de mina - criando pontos de mineração da mina: " .. nearbyMineId)
    end
end)

-- Cleanup de blips e picareta quando o resource para
AddEventHandler('onResourceStop', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        removeAllBlips()
        removePickaxe()
    end
end)

-- mining locations (pontos de mineração)
Citizen.CreateThread(function()
    for mineId, mineData in pairs(Config.Mines) do
        for _, location in pairs(mineData.locations) do
            exports['rsg-core']:createPrompt(location.location, location.coords, RSGCore.Shared.Keybinds['E'],
                Lang:t('menu.start') .. location.name, {
                    type = 'client',
                    event = 'rsg-mining:client:StartMining',
                    args = { mineId, location.location }
                })
        end
    end
end)

-- Sistema de blips para pontos de mineração individuais - agora integrado no createAllBlips()

-- Thread para controlar visibilidade dos blips baseada na distância
CreateThread(function()
    Wait(5000) -- Aguarda 5 segundos antes de começar a verificar distância
    while true do
        updateBlipVisibility()
        Wait(1000) -- Verifica a cada 1 segundo para ser mais responsivo
    end
end)

--------------------------------------------------------------------------

-- start mining
RegisterNetEvent('rsg-mining:client:StartMining')
AddEventHandler('rsg-mining:client:StartMining', function(mineId, locationId)
    local player = PlayerPedId()
    local hasItem = exports['rsg-inventory']:HasItem('pickaxe', 1)
    if miningstarted == false then
        if hasItem then
            local randomNumber = math.random(1, 100)
            if randomNumber > 90 then -- 10% chance of pickace breaking
                TriggerServerEvent('rsg-mining:server:removeitem', 'pickaxe')
            else
                local coords = GetEntityCoords(player)
                local boneIndex = GetEntityBoneIndexByName(player, "SKEL_R_Finger00")
                pickaxeProp = CreateObject(GetHashKey("p_pickaxe01x"), coords, true, true, true)
                miningstarted = true

                SetCurrentPedWeapon(player, 'WEAPON_UNARMED', true)
                FreezeEntityPosition(player, true)
                ClearPedTasksImmediately(player)
                AttachEntityToEntity(pickaxeProp, player, boneIndex, -0.35, -0.21, -0.39, -8.0, 47.0, 11.0, true, false,
                    true,
                    false, 0, true)

                -- Start mining animation
                LoadAnimDict(testAnimDict)
                TaskPlayAnim(player, testAnimDict, testAnim, 3.0, 3.0, -1, 1, 0, false, false, false)

                -- Show mining started notification
                local mineName = Config.Mines[mineId] and Config.Mines[mineId].name or "Mina"
                TriggerEvent('bln_notify:send', {
                    title = 'Mineração',
                    description = 'A começar a minerar em ' .. mineName .. '...',
                    icon = 'toast_mp_daily_objective_small',
                    placement = 'top-right',
                    duration = 3000
                }, 'INFO')

                -- Determine mining time based on chance (server will tell us the type)
                TriggerServerEvent('rsg-mining:server:getMiningTime', mineId)
            end
        else
            TriggerEvent('bln_notify:send', {
                title = 'Erro',
                description = Lang:t('error.you_dont_have_pickaxe'),
                icon = 'cross',
                placement = 'top-right',
                duration = 5000
            }, 'ERROR')
        end
    else
        TriggerEvent('bln_notify:send', {
            title = 'Aviso',
            description = Lang:t('primary.you_are_busy_the_moment'),
            icon = 'warning',
            placement = 'top-right',
            duration = 5000
        }, 'INFO')
    end
end)

-- receive mining time from server and start mining process
RegisterNetEvent('rsg-mining:client:startMiningProcess')
AddEventHandler('rsg-mining:client:startMiningProcess', function(miningTime, rewardType)
    local player = PlayerPedId()
    local coords = GetEntityCoords(player)
    local boneIndex = GetEntityBoneIndexByName(player, "SKEL_R_Finger00")

    -- Remove picareta existente se houver
    removePickaxe()

    pickaxeProp = CreateObject(GetHashKey("p_pickaxe01x"), coords, true, true, true)

    SetCurrentPedWeapon(player, 'WEAPON_UNARMED', true)
    FreezeEntityPosition(player, true)
    ClearPedTasksImmediately(player)
    AttachEntityToEntity(pickaxeProp, player, boneIndex, -0.35, -0.21, -0.39, -8.0, 47.0, 11.0, true, false, true, false,
        0,
        true)

    -- Start mining animation
    LoadAnimDict(testAnimDict)
    TaskPlayAnim(player, testAnimDict, testAnim, 3.0, 3.0, -1, 1, 0, false, false, false)

    -- Show mining started notification with time info
    local timeText = ""
    if rewardType == "small" then
        timeText = " (12s)"
    elseif rewardType == "medium" then
        timeText = " (18s)"
    elseif rewardType == "large" then
        timeText = " (25s)"
    elseif rewardType == "exceptional" then
        timeText = " (30s)"
    end
    TriggerEvent('bln_notify:send', {
        title = 'Mineração',
        description = 'A começar a minerar...' .. timeText,
        icon = 'toast_mp_daily_objective_small',
        placement = 'top-right',
        duration = 3000
    }, 'INFO')

    -- Mining progress loop with dynamic time
    local currentMiningTime = 0
    local maxMiningTime = miningTime

    CreateThread(function()
        while currentMiningTime < maxMiningTime and miningstarted do
            Wait(100)
            currentMiningTime = currentMiningTime + 100

            -- Check if player moved too far
            local currentCoords = GetEntityCoords(player)
            if #(currentCoords - coords) > 2.0 then
                -- Player moved, cancel mining
                ClearPedTasksImmediately(player)
                FreezeEntityPosition(player, false)
                removePickaxe()
                miningstarted = false
                TriggerEvent('bln_notify:send', {
                    title = 'Mineração Cancelada',
                    description = 'Mineração cancelada!',
                    icon = 'cross',
                    placement = 'top-right',
                    duration = 5000
                }, 'ERROR')
                return
            end
        end

        -- Mining completed
        if miningstarted then
            ClearPedTasksImmediately(player)
            FreezeEntityPosition(player, false)

            TriggerServerEvent('rsg-mining:server:giveMiningReward')

            removePickaxe()
            miningstarted = false
        end
    end)
end)
