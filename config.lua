Config = {}

-- Configurações gerais de mineração
Config.SmallRewardAmount = 1
Config.MediumRewardAmount = 1
Config.LargeRewardAmount = 2

-- Tempos de mineração (em milissegundos)
Config.SmallMiningTime = 12000   -- 12 segundos para pequena quantidade
Config.MediumMiningTime = 18000  -- 18 segundos para quantidade média
Config.LargeMiningTime = 25000   -- 25 segundos para grande quantidade
Config.ExceptionalMiningTime = 30000 -- 30 segundos para quantidade excepcional

-- Configurações de Blips para as minas
Config.MineBlips = {
    ['annesburg_mine'] = {
        hash = 1220803671,  -- blip_ambient_hitching_post
        sprite = 84,        -- Ícone de mina
        color = 1,          -- Vermelho (carvão/ferro)
        scale = 0.8,
        name = 'Mina de Annesburg',
        coords = vector3(2748.2009, 1407.5907, 99.0277)  -- Coordenada do blip
    },
    ['elysian_mine'] = {
        hash = 1220803671, -- blip_ambient_hitching_post
        sprite = 84,       -- Ícone de mina
        color = 3,         -- Verde (prata/cobre)
        scale = 0.8,
        name = 'Mina de Elysian Pool',
        coords = vector3(2292.8990, 1065.1968, 82.2831) -- Coordenada do blip (centro dos pontos)
    },
    ['valentine_mine'] = {
        hash = 1220803671, -- blip_ambient_hitching_post
        sprite = 84,       -- Ícone de mina
        color = 5,         -- Amarelo (quartzo/gemas)
        scale = 0.8,
        name = 'Mina de Valentine',
        coords = vector3(-1425.1401, 1193.3930, 225.4916) -- Coordenada do blip (centro dos pontos)
    },
    ['strawberry_mine'] = {
        hash = 1220803671, -- blip_ambient_hitching_post
        sprite = 84,       -- Ícone de mina
        color = 2,         -- Azul (ferro/carvão)
        scale = 0.8,
        name = 'Mina de Strawberry',
        coords = vector3(-2120.8162, 101.4665, 245.5496) -- Coordenada do blip (centro dos pontos)
    },
    ['desert_mine'] = {
        hash = 1220803671, -- blip_ambient_hitching_post
        sprite = 84,       -- Ícone de mina
        color = 6,         -- Roxo (ouro/preciosos)
        scale = 0.8,
        name = 'Mina do Deserto',
        coords = vector3(-5968.3254, -3170.7617, -24.3759) -- Coordenada do blip (centro dos pontos)
    },
    -- Mina misteriosa não tem blip configurado (permanece escondida)
    ['little_creek_mine'] = {
        hash = 1220803671, -- blip_ambient_hitching_post
        sprite = 84,       -- Ícone de mina
        color = 7,         -- Cinza (recursos mistos)
        scale = 0.8,
        name = 'Mina de Little Creek',
        coords = vector3(-2659.7134, 692.6793, 182.8150) -- Coordenada do blip (centro dos pontos)
    },
}

-- Sistema de minas específicas com probabilidades
Config.Mines = {
    -- MINA DE ANNESBURG (Nova Hanover) - Especializada em carvão e ferro
    ['annesburg_mine'] = {
        name = 'Mina de Annesburg',
        description = 'Especializada em carvão e ferro - Boa para mineração industrial',
        rewards = {
            { item = 'coal',        chance = 35 }, -- 35% chance de carvão
            { item = 'iron_ore',    chance = 30 }, -- 30% chance de ferro
            { item = 'copper_ore',  chance = 20 }, -- 20% chance de cobre
            { item = 'gold_nugget', chance = 10 }, -- 10% chance de ouro (raro)
            { item = 'quartz',      chance = 5 },  -- 5% chance de quartzo
        },
        locations = {
            { name = 'Annesburg Mining Spot 1', location = 'annesburg-1', coords = vector3(2763.174, 1406.2044, 68.444854),  showblip = true, showmarker = true },
            { name = 'Annesburg Mining Spot 2', location = 'annesburg-2', coords = vector3(2726.7871, 1384.9691, 68.878173), showblip = true, showmarker = true },
            { name = 'Annesburg Mining Spot 3', location = 'annesburg-3', coords = vector3(2717.3491, 1314.0633, 69.75164),  showblip = true, showmarker = true },
            { name = 'Annesburg Mining Spot 4', location = 'annesburg-4', coords = vector3(2750.500, 1395.800, 69.000),      showblip = true, showmarker = true },
        }
    },

    -- MINA DE ELYSIAN POOL (Nova Hanover) - Rica em prata e cobre
    ['elysian_mine'] = {
        name = 'Mina de Elysian Pool',
        description = 'Rica em prata e cobre - Água cristalina atrai metais preciosos',
        rewards = {
            { item = 'silver_ore',  chance = 40 }, -- 40% chance de prata
            { item = 'copper_ore',  chance = 30 }, -- 30% chance de cobre
            { item = 'quartz',      chance = 20 }, -- 20% chance de quartzo
            { item = 'gold_nugget', chance = 7 },  -- 7% chance de ouro
            { item = 'coal',        chance = 3 },  -- 3% chance de carvão
        },
        locations = {
            { name = 'Elysian Pool Spot 1', location = 'elysian-1', coords = vector3(2308.8254, 1068.0836, 86.1765), showblip = true, showmarker = true },
            { name = 'Elysian Pool Spot 2', location = 'elysian-2', coords = vector3(2303.4448, 1061.7970, 83.7463), showblip = true, showmarker = true },
            { name = 'Elysian Pool Spot 3', location = 'elysian-3', coords = vector3(2296.1780, 1053.4911, 80.5480), showblip = true, showmarker = true },
            { name = 'Elysian Pool Spot 4', location = 'elysian-4', coords = vector3(2273.8367, 1061.9252, 78.1932), showblip = true, showmarker = true },
            { name = 'Elysian Pool Spot 5', location = 'elysian-5', coords = vector3(2283.2097, 1080.8873, 82.8513), showblip = true, showmarker = true },
        }
    },

    -- MINA DE VALENTINE (New Hanover) - Mina de quartzo e gemas
    ['valentine_mine'] = {
        name = 'Mina de Valentine',
        description = 'Mina de quartzo e gemas - Excelente para cristais',
        rewards = {
            { item = 'quartz',      chance = 40 }, -- 40% chance de quartzo
            { item = 'coal',        chance = 25 }, -- 25% chance de carvão
            { item = 'iron_ore',    chance = 20 }, -- 20% chance de ferro
            { item = 'silver_ore',  chance = 10 }, -- 10% chance de prata
            { item = 'gold_nugget', chance = 5 },  -- 5% chance de ouro (muito raro)
        },
        locations = {
            { name = 'Valentine Mining Spot 1', location = 'valentine-1', coords = vector3(-1419.2682, 1188.1470, 225.4775), showblip = true, showmarker = true },
            { name = 'Valentine Mining Spot 2', location = 'valentine-2', coords = vector3(-1412.0415, 1182.3870, 225.5519), showblip = true, showmarker = true },
            { name = 'Valentine Mining Spot 3', location = 'valentine-3', coords = vector3(-1409.6201, 1203.3442, 223.5706), showblip = true, showmarker = true },
            { name = 'Valentine Mining Spot 4', location = 'valentine-4', coords = vector3(-1441.8285, 1205.4985, 226.3991), showblip = true, showmarker = true },
            { name = 'Valentine Mining Spot 5', location = 'valentine-5', coords = vector3(-1442.9423, 1188.5875, 226.4588), showblip = true, showmarker = true },
        }
    },

    -- MINA DE STRAWBERRY (West Elizabeth) - Rica em ferro e carvão
    ['strawberry_mine'] = {
        name = 'Mina de Strawberry',
        description = 'Rica em ferro e carvão - Montanhas rochosas da região',
        rewards = {
            { item = 'iron_ore',    chance = 35 }, -- 35% chance de ferro
            { item = 'coal',        chance = 30 }, -- 30% chance de carvão
            { item = 'copper_ore',  chance = 20 }, -- 20% chance de cobre
            { item = 'quartz',      chance = 10 }, -- 10% chance de quartzo
            { item = 'gold_nugget', chance = 3 },  -- 3% chance de ouro (extremamente raro)
            { item = 'silver_ore',  chance = 2 },  -- 2% chance de prata (extremamente raro)
        },
        locations = {
            { name = 'Strawberry Mining Spot 1', location = 'strawberry-1', coords = vector3(-2139.8511, 93.0350, 247.4350),  showblip = true, showmarker = true },
            { name = 'Strawberry Mining Spot 2', location = 'strawberry-2', coords = vector3(-2148.8679, 102.3720, 244.8372), showblip = true, showmarker = true },
            { name = 'Strawberry Mining Spot 3', location = 'strawberry-3', coords = vector3(-2125.6614, 119.1224, 239.0070), showblip = true, showmarker = true },
            { name = 'Strawberry Mining Spot 4', location = 'strawberry-4', coords = vector3(-2088.5530, 103.0970, 245.3533), showblip = true, showmarker = true },
            { name = 'Strawberry Mining Spot 5', location = 'strawberry-5', coords = vector3(-2102.2075, 89.7059, 251.1154),  showblip = true, showmarker = true },
        }
    },

    -- MINA DO DESERTO (New Austin) - Rica em ouro e pedras preciosas
    ['desert_mine'] = {
        name = 'Mina do Deserto',
        description = 'Mina do deserto rica em ouro e pedras preciosas - Calor extremo mas tesouros valiosos',
        rewards = {
            { item = 'gold_nugget', chance = 45 }, -- 45% chance de ouro (alta concentração)
            { item = 'quartz',      chance = 25 }, -- 25% chance de quartzo
            { item = 'silver_ore',  chance = 15 }, -- 15% chance de prata
            { item = 'copper_ore',  chance = 10 }, -- 10% chance de cobre
            { item = 'iron_ore',    chance = 3 },  -- 3% chance de ferro
            { item = 'coal',        chance = 2 },  -- 2% chance de carvão
        },
        locations = {
            { name = 'Desert Mining Spot 1', location = 'desert-1', coords = vector3(-5981.4712, -3161.6370, -26.5571), showblip = true, showmarker = true },
            { name = 'Desert Mining Spot 2', location = 'desert-2', coords = vector3(-5973.9697, -3168.2673, -25.4412), showblip = true, showmarker = true },
            { name = 'Desert Mining Spot 3', location = 'desert-3', coords = vector3(-5962.3857, -3173.4534, -23.0801), showblip = true, showmarker = true },
            { name = 'Desert Mining Spot 4', location = 'desert-4', coords = vector3(-5955.4751, -3179.6892, -22.4251), showblip = true, showmarker = true },
        }
    },

    -- MINA DE LITTLE CREEK (West Elizabeth) - Recursos mistos e equilibrados
    ['little_creek_mine'] = {
        name = 'Mina de Little Creek',
        description = 'Mina equilibrada com recursos mistos - Boa para mineração geral',
        rewards = {
            { item = 'coal',        chance = 25 }, -- 25% chance de carvão
            { item = 'iron_ore',    chance = 25 }, -- 25% chance de ferro
            { item = 'copper_ore',  chance = 20 }, -- 20% chance de cobre
            { item = 'quartz',      chance = 15 }, -- 15% chance de quartzo
            { item = 'silver_ore',  chance = 10 }, -- 10% chance de prata
            { item = 'gold_nugget', chance = 5 },  -- 5% chance de ouro
        },
        locations = {
            { name = 'Little Creek Spot 1', location = 'little_creek-1', coords = vector3(-2721.9121, 731.9470, 172.1749), showblip = true, showmarker = true },
            { name = 'Little Creek Spot 2', location = 'little_creek-2', coords = vector3(-2719.2397, 715.4320, 170.8869), showblip = true, showmarker = true },
            { name = 'Little Creek Spot 3', location = 'little_creek-3', coords = vector3(-2730.3813, 715.5460, 169.8949), showblip = true, showmarker = true },
            { name = 'Little Creek Spot 4', location = 'little_creek-4', coords = vector3(-2715.6768, 730.2618, 176.2028), showblip = true, showmarker = true },
        }
    },

    -- MINA MISTERIOSA (Localização Secreta) - Recursos únicos e raros
    ['mysterious_mine'] = {
        name = 'Mina Misteriosa',
        description = 'Localização secreta - Contém recursos únicos e extremamente raros',
        isSecret = true,                           -- Marca como mina secreta
        rewards = {
            { item = 'gold_nugget', chance = 25 }, -- 25% chance de ouro
            { item = 'silver_ore',  chance = 20 }, -- 20% chance de prata
            { item = 'quartz',      chance = 20 }, -- 20% chance de quartzo
            { item = 'coal',        chance = 15 }, -- 15% chance de carvão
            { item = 'iron_ore',    chance = 10 }, -- 10% chance de ferro
            { item = 'copper_ore',  chance = 10 }, -- 10% chance de cobre
        },
        locations = {
            { name = 'Mysterious Spot 1', location = 'mysterious-1', coords = vector3(-2000.000, -2000.000, 100.000), showblip = false, showmarker = false },
            { name = 'Mysterious Spot 2', location = 'mysterious-2', coords = vector3(-1995.000, -1995.000, 100.500), showblip = false, showmarker = false },
            { name = 'Mysterious Spot 3', location = 'mysterious-3', coords = vector3(-2005.000, -2005.000, 99.800),  showblip = false, showmarker = false },
        }
    },
}

-- Função para obter todas as localizações de mineração
function Config.GetAllMiningLocations()
    local allLocations = {}
    for mineId, mineData in pairs(Config.Mines) do
        for _, location in pairs(mineData.locations) do
            table.insert(allLocations, location)
        end
    end
    return allLocations
end

-- Função para obter recursos de uma mina específica
function Config.GetMineRewards(mineId)
    if Config.Mines[mineId] then
        return Config.Mines[mineId].rewards
    end
    return {}
end

-- Função para obter um item baseado na probabilidade da mina
function Config.GetRandomMineReward(mineId)
    if not Config.Mines[mineId] then
        return nil
    end
    
    local rewards = Config.Mines[mineId].rewards
    local totalChance = 0
    
    -- Calcula o total de chances
    for _, reward in pairs(rewards) do
        totalChance = totalChance + reward.chance
    end
    
    -- Gera um número aleatório
    local random = math.random(1, totalChance)
    local currentChance = 0
    
    -- Seleciona o item baseado na probabilidade
    for _, reward in pairs(rewards) do
        currentChance = currentChance + reward.chance
        if random <= currentChance then
            return reward.item
        end
    end
    
    -- Fallback (não deveria acontecer)
    return rewards[1].item
end

-- Função para obter informações de uma mina específica
function Config.GetMineInfo(mineId)
    if Config.Mines[mineId] then
        return {
            name = Config.Mines[mineId].name,
            description = Config.Mines[mineId].description,
            rewards = Config.Mines[mineId].rewards,
            locations = Config.Mines[mineId].locations
        }
    end
    return nil
end

-- Função para obter todas as minas disponíveis (exclui minas secretas)
function Config.GetAllMines()
    local mines = {}
    for mineId, mineData in pairs(Config.Mines) do
        -- Não inclui minas secretas na lista pública
        if not mineData.isSecret then
            mines[mineId] = {
                name = mineData.name,
                description = mineData.description,
                rewardCount = #mineData.rewards,
                locationCount = #mineData.locations
            }
        end
    end
    return mines
end

-- Função para obter apenas minas secretas
function Config.GetSecretMines()
    local secretMines = {}
    for mineId, mineData in pairs(Config.Mines) do
        if mineData.isSecret then
            secretMines[mineId] = {
                name = mineData.name,
                description = mineData.description,
                rewardCount = #mineData.rewards,
                locationCount = #mineData.locations
            }
        end
    end
    return secretMines
end

-- Função para verificar se uma mina é secreta
function Config.IsSecretMine(mineId)
    if Config.Mines[mineId] then
        return Config.Mines[mineId].isSecret == true
    end
    return false
end

-- Função para obter coordenadas da mina misteriosa (para descoberta)
function Config.GetMysteriousMineCoords()
    local mysteriousMine = Config.Mines['mysterious_mine']
    if mysteriousMine then
        return mysteriousMine.locations
    end
    return {}
end

-- Função para obter configuração de blip de uma mina
function Config.GetMineBlipConfig(mineId)
    if Config.MineBlips[mineId] then
        return Config.MineBlips[mineId]
    end
    return nil
end

-- Função para criar blips de todas as minas (exceto misteriosas)
function Config.CreateAllMineBlips()
    local blips = {}
    for mineId, mineData in pairs(Config.Mines) do
        -- Não cria blips para minas secretas
        if not mineData.isSecret and Config.MineBlips[mineId] then
            local blipConfig = Config.MineBlips[mineId]
            -- Usa coordenadas específicas do blip
            local blip = {
                hash = blipConfig.hash,
                coords = blipConfig.coords,
                sprite = blipConfig.sprite,
                color = blipConfig.color,
                scale = blipConfig.scale,
                name = blipConfig.name,
                mineId = mineId
            }
            table.insert(blips, blip)
        end
    end
    return blips
end

-- Função para verificar se uma mina deve ter blip
function Config.ShouldCreateBlip(mineId)
    if Config.Mines[mineId] and Config.Mines[mineId].isSecret then
        return false -- Minas secretas não têm blips
    end
    return Config.MineBlips[mineId] ~= nil
end
