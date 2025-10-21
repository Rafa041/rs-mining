local RSGCore = exports['rsg-core']:GetCoreObject()


-- Store player mining data temporarily
local playerMiningData = {}

-- Função para obter durabilidade da primeira picareta disponível
local function getPickaxeDurability(src)
    -- Tentar método alternativo usando GetItem diretamente
    local pickaxeItem = exports['rsg-inventory']:GetItem(src, 'pickaxe', nil, true)
    if pickaxeItem and pickaxeItem.count > 0 then
        local quality = pickaxeItem.info and pickaxeItem.info.quality or 100
        return quality
    end
    
    -- Fallback: tentar método original
    local inventory = exports['rsg-inventory']:GetInventory(src)
    if not inventory then 
        return 0 
    end
    
    -- Procurar pela primeira picareta no inventário
    for slot, item in pairs(inventory.items) do
        if item.name == 'pickaxe' and item.amount > 0 then
            local quality = item.info and item.info.quality or 100
            return quality
        end
    end
    return 0
end

-- Função para reduzir durabilidade da primeira picareta disponível
local function reducePickaxeDurability(src)
    local inventory = exports['rsg-inventory']:GetInventory(src)
    if not inventory then return 0 end
    
    -- Procurar pela primeira picareta no inventário
    for slot, item in pairs(inventory.items) do
        if item.name == 'pickaxe' and item.amount > 0 then
            local currentQuality = item.info.quality or 100
            local newQuality = math.max(0, currentQuality - Config.PickaxeDurability.wearPerUse)
            
            -- Atualizar qualidade apenas desta picareta específica
            exports['rsg-inventory']:SetItemData(src, 'pickaxe', slot, 'quality', newQuality)
            exports['rsg-inventory']:SetItemData(src, 'pickaxe', slot, 'lastUpdate', os.time())
            
            return newQuality
        end
    end
    
    return 0
end

-- Função para obter informações de todas as picaretas
local function getAllPickaxesInfo(src)
    local inventory = exports['rsg-inventory']:GetInventory(src)
    if not inventory then return {} end
    
    local pickaxes = {}
    for slot, item in pairs(inventory.items) do
        if item.name == 'pickaxe' and item.amount > 0 then
            table.insert(pickaxes, {
                slot = slot,
                quality = item.info.quality or 100,
                amount = item.amount
            })
        end
    end
    
    return pickaxes
end

-- Função para verificar se deve mostrar aviso de durabilidade
local function shouldShowDurabilityWarning(durability)
    for _, level in pairs(Config.PickaxeDurability.warningLevels) do
        if durability <= level and durability > (level - Config.PickaxeDurability.wearPerUse) then
            return level
        end
    end
    
    -- Verificar nível crítico
    if durability <= Config.PickaxeDurability.criticalLevel and durability > 0 then
        return Config.PickaxeDurability.criticalLevel
    end
    
    return nil
end

-- Teste de evento simples
RegisterServerEvent('rsg-mining:server:testEvent')
AddEventHandler('rsg-mining:server:testEvent', function(mineId, locationId)
    print("^2[rs-mining] DEBUG SERVER: Evento de teste recebido! MineId: " .. tostring(mineId) .. "^0")
end)

-- check pickaxe durability before mining
RegisterServerEvent('rsg-mining:server:checkPickaxeDurability')
AddEventHandler('rsg-mining:server:checkPickaxeDurability', function(mineId, locationId)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    
    if not Player then 
        return 
    end
    
    -- Verificar se o jogador tem uma picareta
    local hasPickaxe = exports['rsg-inventory']:HasItem(src, 'pickaxe', 1)
    
    if not hasPickaxe then
        TriggerClientEvent('rsg-mining:client:pickaxeDurabilityResult', src, false, 0, mineId, locationId)
        return
    end
    
    -- Obter durabilidade atual (primeira picareta)
    local currentDurability = getPickaxeDurability(src)
    
    -- Verificar se pode minerar
    if currentDurability <= 0 then
        -- Picareta quebrou, remover apenas a primeira picareta do inventário
        local inventory = exports['rsg-inventory']:GetInventory(src)
        if inventory then
            for slot, item in pairs(inventory.items) do
                if item.name == 'pickaxe' and item.amount > 0 then
                    exports['rsg-inventory']:RemoveItem(src, 'pickaxe', 1, slot)
                    break
                end
            end
        end
        TriggerClientEvent('bln_notify:send', src, {
            title = 'Picareta Quebrou',
            description = 'A sua picareta quebrou completamente!',
            icon = 'cross',
            placement = 'top-right',
            duration = 5000
        }, 'ERROR')
        TriggerClientEvent('rsg-mining:client:pickaxeDurabilityResult', src, false, 0, mineId, locationId)
        return
    end
    
    -- Pode minerar, enviar resultado
    TriggerClientEvent('rsg-mining:client:pickaxeDurabilityResult', src, true, currentDurability, mineId, locationId)
end)

-- determine mining time and start mining process
RegisterServerEvent('rsg-mining:server:getMiningTime')
AddEventHandler('rsg-mining:server:getMiningTime', function(mineId)
    local src = source
    local chance = math.random(1, 100)
    local miningTime = Config.SmallMiningTime
    local rewardType = "small"

    if chance <= 60 then -- 60% chance - pequena colheita
        miningTime = Config.SmallMiningTime
        rewardType = "small"
    elseif chance > 60 and chance <= 85 then -- 25% chance - colheita média
        miningTime = Config.MediumMiningTime
        rewardType = "medium"
    elseif chance > 85 and chance <= 95 then -- 10% chance - boa colheita
        miningTime = Config.LargeMiningTime
        rewardType = "large"
    elseif chance > 95 then -- 5% chance - colheita excecional
        miningTime = Config.ExceptionalMiningTime
        rewardType = "exceptional"
    end

    -- Store the reward type and mine ID for later use
    playerMiningData[src] = {
        rewardType = rewardType,
        chance = chance,
        mineId = mineId
    }

    TriggerClientEvent('rsg-mining:client:startMiningProcess', src, miningTime, rewardType)
end)

-- give mining reward
RegisterServerEvent('rsg-mining:server:giveMiningReward')
AddEventHandler('rsg-mining:server:giveMiningReward', function()
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)

    -- Get the stored reward type from when mining started
    local miningData = playerMiningData[src]
    if not miningData then
        -- Fallback to random if no data found
        miningData = { rewardType = "small", chance = 30, mineId = "valentine_mine" }
    end

    local rewardType = miningData.rewardType
    local mineId = miningData.mineId
    
    -- Reduzir durabilidade da picareta após mineração bem-sucedida
    local newDurability = reducePickaxeDurability(src)
    
    -- Verificar se deve mostrar aviso de durabilidade
    local warningLevel = shouldShowDurabilityWarning(newDurability)
    if warningLevel then
        local warningMessage = ""
        local warningIcon = "warning"
        
        if warningLevel == Config.PickaxeDurability.criticalLevel then
            warningMessage = "ATENÇÃO: Sua picareta está quase quebrada! (" .. newDurability .. "% restante)"
            warningIcon = "cross"
        elseif warningLevel == 10 then
            warningMessage = "Aviso: Sua picareta está muito desgastada (" .. newDurability .. "% restante)"
        elseif warningLevel == 25 then
            warningMessage = "Aviso: Sua picareta está desgastada (" .. newDurability .. "% restante)"
        elseif warningLevel == 50 then
            warningMessage = "Aviso: Sua picareta está meio desgastada (" .. newDurability .. "% restante)"
        end
        
        TriggerClientEvent('bln_notify:send', src, {
            title = 'Durabilidade da Picareta',
            description = warningMessage,
            icon = warningIcon,
            placement = 'top-right',
            duration = 6000
        }, 'WARNING')
    end

    -- Get mine-specific rewards using the new system
    local mineRewards = Config.GetMineRewards(mineId)
    local randomItem = Config.GetRandomMineReward(mineId)

    if not randomItem or #mineRewards == 0 then
        -- Fallback to old system if new system fails
        randomItem = 'coal' -- Default fallback
    end

    if rewardType == "small" then -- 60% chance - pequena colheita (1 item)
        exports['rsg-inventory']:AddItem(src, randomItem, Config.SmallRewardAmount)
        local itemLabel = RSGCore.Shared.Items[randomItem] and RSGCore.Shared.Items[randomItem].label or randomItem
        local mineName = Config.Mines[mineId] and Config.Mines[mineId].name or "Mina"
        TriggerClientEvent('bln_notify:send', src, {
            title = 'Mineração Concluída',
            description = 'Encontrou em ' .. mineName .. ': ' .. itemLabel,
            icon = 'tick',
            placement = 'top-right',
            duration = 5000
        }, 'SUCCESS')
    elseif rewardType == "medium" then -- 25% chance - colheita média (1 item)
        exports['rsg-inventory']:AddItem(src, randomItem, Config.MediumRewardAmount)
        local itemLabel = RSGCore.Shared.Items[randomItem] and RSGCore.Shared.Items[randomItem].label or randomItem
        local mineName = Config.Mines[mineId] and Config.Mines[mineId].name or "Mina"
        TriggerClientEvent('bln_notify:send', src, {
            title = 'Mineração Bem-Sucedida',
            description = 'Encontrou em ' .. mineName .. ': ' .. itemLabel,
            icon = 'tick',
            placement = 'top-right',
            duration = 5000
        }, 'SUCCESS')
    elseif rewardType == "large" then -- 10% chance - boa colheita (2 itens diferentes)
        local item2 = Config.GetRandomMineReward(mineId)
        -- garantir que são itens diferentes
        while item2 == randomItem do
            item2 = Config.GetRandomMineReward(mineId)
        end
        exports['rsg-inventory']:AddItem(src, randomItem, Config.LargeRewardAmount)
        exports['rsg-inventory']:AddItem(src, item2, Config.LargeRewardAmount)
        local item1Label = RSGCore.Shared.Items[randomItem] and RSGCore.Shared.Items[randomItem].label or randomItem
        local item2Label = RSGCore.Shared.Items[item2] and RSGCore.Shared.Items[item2].label or item2
        local mineName = Config.Mines[mineId] and Config.Mines[mineId].name or "Mina"
        TriggerClientEvent('bln_notify:send', src, {
            title = 'Excelente Mineração!',
            description = 'Encontrou em ' .. mineName .. ': ' .. item1Label .. ' e ' .. item2Label,
            icon = 'tick',
            placement = 'top-right',
            duration = 6000
        }, 'SUCCESS')
    elseif rewardType == "exceptional" then -- 5% chance - colheita excecional (2 itens iguais raros)
        exports['rsg-inventory']:AddItem(src, randomItem, 2)
        local itemLabel = RSGCore.Shared.Items[randomItem] and RSGCore.Shared.Items[randomItem].label or randomItem
        local mineName = Config.Mines[mineId] and Config.Mines[mineId].name or "Mina"
        TriggerClientEvent('bln_notify:send', src, {
            title = 'Descoberta Rara!',
            description = 'Encontrou em ' .. mineName .. ': 2x ' .. itemLabel,
            icon = 'tick',
            placement = 'top-right',
            duration = 7000
        }, 'SUCCESS')
    end

    -- Clean up stored data
    playerMiningData[src] = nil
end)

-- remove pickaxe if broken (legacy - mantido para compatibilidade)
RegisterServerEvent('rsg-mining:server:removeitem')
AddEventHandler('rsg-mining:server:removeitem', function(item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if item == 'pickaxe' then
        exports['rsg-inventory']:RemoveItem(src, 'pickaxe', 1)
        TriggerClientEvent('bln_notify:send', src, {
            title = 'Picareta Quebrou',
            description = Lang:t('success.your_pickaxe_broke'),
            icon = 'cross',
            placement = 'top-right',
            duration = 5000
        }, 'ERROR')
    else
        TriggerClientEvent('bln_notify:send', src, {
            title = 'Erro',
            description = Lang:t('error.something_went_wrong'),
            icon = 'cross',
            placement = 'top-right',
            duration = 5000
        }, 'ERROR')
        print('something went wrong with moonshine script could be exploint!')
    end
end)
