local RSGCore = exports['rsg-core']:GetCoreObject()

-- Store player mining data temporarily
local playerMiningData = {}

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

-- remove pickaxe if broken
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
