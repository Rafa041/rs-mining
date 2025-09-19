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
        hash = 1220803671,  -- blip_ambient_hitching_post
        sprite = 84,        -- Ícone de mina
        color = 3,          -- Verde (prata/cobre)
        scale = 0.8,
        name = 'Mina de Elysian Pool',
        coords = vector3(2280.5276, 1202.1761, 108.5104)  -- Coordenada do blip
    },
    ['valentine_mine'] = {
        hash = 1220803671,  -- blip_ambient_hitching_post
        sprite = 84,        -- Ícone de mina
        color = 5,          -- Amarelo (quartzo/gemas)
        scale = 0.8,
        name = 'Mina de Valentine',
        coords = vector3(-1403.6255, 1152.6949, 225.4172)  -- Coordenada do blip
    },
    ['strawberry_mine'] = {
        hash = 1220803671,  -- blip_ambient_hitching_post
        sprite = 84,        -- Ícone de mina
        color = 2,          -- Azul (ferro/carvão)
        scale = 0.8,
        name = 'Mina de Strawberry',
        coords = vector3(-2118.7815, 26.9160, 267.1649)  -- Coordenada do blip
    },
    ['desert_mine'] = {
        hash = 1220803671,  -- blip_ambient_hitching_post
        sprite = 84,        -- Ícone de mina
        color = 6,          -- Roxo (ouro/preciosos)
        scale = 0.8,
        name = 'Mina do Deserto',
        coords = vector3(-5964.2490, -3204.4482, -21.3978)  -- Coordenada do blip
    },
    -- Mina misteriosa não tem blip configurado (permanece escondida)
}

-- Sistema de minas específicas com probabilidades
Config.Mines = {
    -- MINA DE ANNESBURG (Nova Hanover) - Especializada em carvão e ferro
    ['annesburg_mine'] = {
        name = 'Mina de Annesburg',
        description = 'Especializada em carvão e ferro - Boa para mineração industrial',
        rewards = {
            {item = 'coal', chance = 35},           -- 35% chance de carvão
            {item = 'iron_ore', chance = 30},       -- 30% chance de ferro
            {item = 'copper_ore', chance = 20},     -- 20% chance de cobre
            {item = 'gold_nugget', chance = 10},    -- 10% chance de ouro (raro)
            {item = 'quartz', chance = 5},          -- 5% chance de quartzo
        },
        locations = {
            {name = 'Annesburg Mining Spot 1', location = 'annesburg-1', coords = vector3(2763.174, 1406.2044, 68.444854), showblip = true, showmarker = true},
            {name = 'Annesburg Mining Spot 2', location = 'annesburg-2', coords = vector3(2726.7871, 1384.9691, 68.878173), showblip = true, showmarker = true},
            {name = 'Annesburg Mining Spot 3', location = 'annesburg-3', coords = vector3(2717.3491, 1314.0633, 69.75164), showblip = true, showmarker = true},
            {name = 'Annesburg Mining Spot 4', location = 'annesburg-4', coords = vector3(2750.500, 1395.800, 69.000), showblip = true, showmarker = true},
        }
    },

    -- MINA DE ELYSIAN POOL (Nova Hanover) - Rica em prata e cobre
    ['elysian_mine'] = {
        name = 'Mina de Elysian Pool',
        description = 'Rica em prata e cobre - Água cristalina atrai metais preciosos',
        rewards = {
            {item = 'silver_ore', chance = 40},     -- 40% chance de prata
            {item = 'copper_ore', chance = 30},     -- 30% chance de cobre
            {item = 'quartz', chance = 20},         -- 20% chance de quartzo
            {item = 'gold_nugget', chance = 7},     -- 7% chance de ouro
            {item = 'coal', chance = 3},            -- 3% chance de carvão
        },
        locations = {
            {name = 'Elysian Pool Spot 1', location = 'elysian-1', coords = vector3(1850.500, 1200.800, 200.000), showblip = true, showmarker = true},
            {name = 'Elysian Pool Spot 2', location = 'elysian-2', coords = vector3(1845.200, 1195.300, 200.500), showblip = true, showmarker = true},
            {name = 'Elysian Pool Spot 3', location = 'elysian-3', coords = vector3(1855.800, 1205.100, 199.800), showblip = true, showmarker = true},
            {name = 'Elysian Pool Spot 4', location = 'elysian-4', coords = vector3(1860.100, 1210.500, 200.200), showblip = true, showmarker = true},
        }
    },

    -- MINA DE VALENTINE (New Hanover) - Mina de quartzo e gemas
    ['valentine_mine'] = {
        name = 'Mina de Valentine',
        description = 'Mina de quartzo e gemas - Excelente para cristais',
        rewards = {
            {item = 'quartz', chance = 40},         -- 40% chance de quartzo
            {item = 'coal', chance = 25},           -- 25% chance de carvão
            {item = 'iron_ore', chance = 20},       -- 20% chance de ferro
            {item = 'silver_ore', chance = 10},     -- 10% chance de prata
            {item = 'gold_nugget', chance = 5},     -- 5% chance de ouro (muito raro)
        },
        locations = {
            {name = 'Valentine Mining Spot 1', location = 'valentine-1', coords = vector3(835.76275, 1931.185, 259.84646), showblip = true, showmarker = true},
            {name = 'Valentine Mining Spot 2', location = 'valentine-2', coords = vector3(835.62109, 1925.5421, 259.289), showblip = true, showmarker = true},
            {name = 'Valentine Mining Spot 3', location = 'valentine-3', coords = vector3(831.66693, 1920.0919, 259.37493), showblip = true, showmarker = true},
            {name = 'Valentine Mining Spot 4', location = 'valentine-4', coords = vector3(825.7395, 1922.6685, 259.20452), showblip = true, showmarker = true},
            {name = 'Valentine Mining Spot 5', location = 'valentine-5', coords = vector3(840.500, 1935.800, 260.000), showblip = true, showmarker = true},
        }
    },

    -- MINA DE STRAWBERRY (West Elizabeth) - Rica em ferro e carvão
    ['strawberry_mine'] = {
        name = 'Mina de Strawberry',
        description = 'Rica em ferro e carvão - Montanhas rochosas da região',
        rewards = {
            {item = 'iron_ore', chance = 35},       -- 35% chance de ferro
            {item = 'coal', chance = 30},           -- 30% chance de carvão
            {item = 'copper_ore', chance = 20},     -- 20% chance de cobre
            {item = 'quartz', chance = 10},         -- 10% chance de quartzo
            {item = 'gold_nugget', chance = 3},     -- 3% chance de ouro (extremamente raro)
            {item = 'silver_ore', chance = 2},      -- 2% chance de prata (extremamente raro)
        },
        locations = {
            {name = 'Strawberry Mining Spot 1', location = 'strawberry-1', coords = vector3(-1800.500, -430.800, 150.000), showblip = true, showmarker = true},
            {name = 'Strawberry Mining Spot 2', location = 'strawberry-2', coords = vector3(-1795.200, -435.300, 150.500), showblip = true, showmarker = true},
            {name = 'Strawberry Mining Spot 3', location = 'strawberry-3', coords = vector3(-1805.800, -425.100, 149.800), showblip = true, showmarker = true},
            {name = 'Strawberry Mining Spot 4', location = 'strawberry-4', coords = vector3(-1810.100, -420.500, 150.200), showblip = true, showmarker = true},
            {name = 'Strawberry Mining Spot 5', location = 'strawberry-5', coords = vector3(-1790.800, -440.200, 149.500), showblip = true, showmarker = true},
        }
    },

    -- MINA DO DESERTO (New Austin) - Rica em ouro e pedras preciosas
    ['desert_mine'] = {
        name = 'Mina do Deserto',
        description = 'Mina do deserto rica em ouro e pedras preciosas - Calor extremo mas tesouros valiosos',
        rewards = {
            {item = 'gold_nugget', chance = 45},    -- 45% chance de ouro (alta concentração)
            {item = 'quartz', chance = 25},         -- 25% chance de quartzo
            {item = 'silver_ore', chance = 15},     -- 15% chance de prata
            {item = 'copper_ore', chance = 10},     -- 10% chance de cobre
            {item = 'iron_ore', chance = 3},        -- 3% chance de ferro
            {item = 'coal', chance = 2},            -- 2% chance de carvão
        },
        locations = {
            {name = 'Desert Mining Spot 1', location = 'desert-1', coords = vector3(-5964.2490, -3204.4482, -21.3978), showblip = true, showmarker = true},
            {name = 'Desert Mining Spot 2', location = 'desert-2', coords = vector3(-5970.500, -3210.200, -22.100), showblip = true, showmarker = true},
            {name = 'Desert Mining Spot 3', location = 'desert-3', coords = vector3(-5958.800, -3198.600, -20.800), showblip = true, showmarker = true},
            {name = 'Desert Mining Spot 4', location = 'desert-4', coords = vector3(-5975.200, -3215.400, -22.500), showblip = true, showmarker = true},
            {name = 'Desert Mining Spot 5', location = 'desert-5', coords = vector3(-5952.100, -3192.300, -20.200), showblip = true, showmarker = true},
        }
    },

    -- MINA MISTERIOSA (Localização Secreta) - Recursos únicos e raros
    ['mysterious_mine'] = {
        name = 'Mina Misteriosa',
        description = 'Localização secreta - Contém recursos únicos e extremamente raros',
        isSecret = true,                           -- Marca como mina secreta
        rewards = {
            {item = 'gold_nugget', chance = 25},    -- 25% chance de ouro
            {item = 'silver_ore', chance = 20},     -- 20% chance de prata
            {item = 'quartz', chance = 20},         -- 20% chance de quartzo
            {item = 'coal', chance = 15},           -- 15% chance de carvão
            {item = 'iron_ore', chance = 10},       -- 10% chance de ferro
            {item = 'copper_ore', chance = 10},     -- 10% chance de cobre
        },
        locations = {
            {name = 'Mysterious Spot 1', location = 'mysterious-1', coords = vector3(-2000.000, -2000.000, 100.000), showblip = false, showmarker = false},
            {name = 'Mysterious Spot 2', location = 'mysterious-2', coords = vector3(-1995.000, -1995.000, 100.500), showblip = false, showmarker = false},
            {name = 'Mysterious Spot 3', location = 'mysterious-3', coords = vector3(-2005.000, -2005.000, 99.800), showblip = false, showmarker = false},
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
