-- ========================================
-- RS-MINING - INSTALAÇÃO DE ITENS (RSG FRAMEWORK)
-- ========================================
-- Adicione estes itens ao seu rsg-core/shared/items.lua
-- IMPORTANTE: Remova os comentários (--) antes de adicionar ao arquivo
-- DESENVOLVIDO ESPECIFICAMENTE PARA O FRAMEWORK RSG
-- INSPIRADO NOS SCRIPTS DO REXSHACK#3041

-- ========================================
-- ITENS DE MINERAÇÃO
-- ========================================

-- Picareta com sistema de durabilidade
["pickaxe"] = {
    ["name"] = "pickaxe",
    ["label"] = "Picareta", 
    ["weight"] = 100,
    ["type"] = "item",
    ["image"] = "pickaxe.png",
    ["unique"] = false,
    ["useable"] = true,
    ["shouldClose"] = true,
    ["combinable"] = nil,
    ["level"] = 0,
    ["description"] = "Equipamento para mineração com sistema de durabilidade",
    ["decay"] = 25,        -- 25 minutos para decair completamente (100% -> 0%)
    ["delete"] = true      -- Remove o item quando qualidade = 0
},

-- ========================================
-- MATERIAIS EXTRAÍDOS
-- ========================================

-- Carvão
["coal"] = {
    ["name"] = "coal",
    ["label"] = "Carvão",
    ["weight"] = 50,
    ["type"] = "item",
    ["image"] = "coal.png",
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = false,
    ["combinable"] = nil,
    ["level"] = 0,
    ["description"] = "Carvão mineral extraído da mina"
},

-- Minério de Ferro
["iron_ore"] = {
    ["name"] = "iron_ore",
    ["label"] = "Minério de Ferro",
    ["weight"] = 60,
    ["type"] = "item",
    ["image"] = "iron_ore.png",
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = false,
    ["combinable"] = nil,
    ["level"] = 0,
    ["description"] = "Minério de ferro bruto"
},

-- Minério de Cobre
["copper_ore"] = {
    ["name"] = "copper_ore",
    ["label"] = "Minério de Cobre",
    ["weight"] = 55,
    ["type"] = "item",
    ["image"] = "copper_ore.png",
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = false,
    ["combinable"] = nil,
    ["level"] = 0,
    ["description"] = "Minério de cobre bruto"
},

-- Minério de Prata
["silver_ore"] = {
    ["name"] = "silver_ore",
    ["label"] = "Minério de Prata",
    ["weight"] = 70,
    ["type"] = "item",
    ["image"] = "silver_ore.png",
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = false,
    ["combinable"] = nil,
    ["level"] = 0,
    ["description"] = "Minério de prata precioso"
},

-- Pepita de Ouro
["gold_nugget"] = {
    ["name"] = "gold_nugget",
    ["label"] = "Pepita de Ouro",
    ["weight"] = 80,
    ["type"] = "item",
    ["image"] = "gold_nugget.png",
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = false,
    ["combinable"] = nil,
    ["level"] = 0,
    ["description"] = "Pepita de ouro puro"
},

-- Quartzo
["quartz"] = {
    ["name"] = "quartz",
    ["label"] = "Quartzo",
    ["weight"] = 45,
    ["type"] = "item",
    ["image"] = "quartz.png",
    ["unique"] = false,
    ["useable"] = false,
    ["shouldClose"] = false,
    ["combinable"] = nil,
    ["level"] = 0,
    ["description"] = "Cristal de quartzo brilhante"
},

-- ========================================
-- INSTRUÇÕES DE INSTALAÇÃO (RSG FRAMEWORK)
-- ========================================
-- 1. Copie os itens acima para o seu rsg-core/shared/items.lua
-- 2. Certifique-se de que as imagens estão em rsg-core/html/images/
-- 3. Reinicie o rsg-core após adicionar os itens
-- 4. O sistema de durabilidade da picareta funcionará automaticamente
-- 5. Configure as opções de durabilidade no config.lua do rs-mining
-- 6. Este script é compatível APENAS com o framework RSG