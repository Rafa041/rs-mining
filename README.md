# RS-MINING - Sistema de Mineração para RSG Framework

Sistema completo de mineração com durabilidade de picaretas, múltiplas minas e sistema de recompensas progressivo, desenvolvido especificamente para o framework RSG.

## 🚀 Características

- **Sistema de Durabilidade**: Picaretas se desgastam com o uso
- **Múltiplas Picaretas**: Suporte a várias picaretas com durabilidade individual
- **6 Minas Diferentes**: Localizações únicas com recompensas específicas
- **Sistema de Avisos**: Notificações progressivas de desgaste
- **Integração RSG-Core**: Totalmente compatível com o framework RSG
- **Sistema de Blips**: Blips dinâmicos baseados em proximidade
- **Animações Realistas**: Animações de mineração imersivas

## 📋 Instalação

### 1. Dependências (RSG Framework)
- `rsg-core` (Framework principal RSG)
- `ox_lib` (Biblioteca de UI)
- `bln_notify` (Sistema de notificações)

### 2. Instalação dos Itens (RSG Framework)
Adicione os itens do arquivo `installation/shared_items.lua` ao seu `rsg-core/shared/items.lua`:

```lua
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
    ["decay"] = 25,        -- 25 minutos para decair completamente
    ["delete"] = true      -- Remove quando qualidade = 0
},
```

### 3. Imagens (RSG Framework)
Copie as imagens da pasta `installation/images/` para `rsg-core/html/images/`

### 4. Configuração
Configure as opções no `config.lua`:

```lua
-- Sistema de Durabilidade da Picareta
Config.PickaxeDurability = {
    maxDurability = 100,           -- Durabilidade máxima (100%)
    wearPerUse = 4,                -- Desgaste por uso (4% = 25 usos total)
    warningLevels = {50, 25, 10},  -- Níveis de aviso (50%, 25%, 10%)
    criticalLevel = 5,             -- Nível crítico (5% - último aviso)
    breakAtZero = true,            -- Quebra quando chega a 0%
    showDurabilityInNotification = true, -- Mostrar durabilidade nas notificações
    useNativeSystem = true,        -- Usar sistema nativo do rsg-inventory
}
```

## 🎮 Como Usar

1. **Obter Picareta**: Compre ou obtenha uma picareta
2. **Ir à Mina**: Vá até uma das 6 minas disponíveis
3. **Mineração**: Use a tecla E nos pontos de mineração
4. **Durabilidade**: A picareta se desgasta a cada uso
5. **Avisos**: Receba notificações quando a durabilidade estiver baixa
6. **Substituição**: Quando quebrar, use uma nova picareta

## 🏔️ Minas Disponíveis

- **Strawberry Mine**: Carvão e minério de ferro
- **Little Creek Mine**: Minério de cobre e prata
- **Desert Mine**: Ouro e quartzo
- **Elysian Pool Mine**: Materiais raros
- **Annesburg Mine**: Minérios de alta qualidade
- **Valentine Mine**: Materiais diversos

## ⚙️ Sistema de Durabilidade

### Como Funciona
- **Durabilidade Inicial**: 100%
- **Desgaste por Uso**: 4% (configurável)
- **Total de Usos**: 25 minerações por picareta
- **Sistema Individual**: Cada picareta tem sua própria durabilidade

### Níveis de Aviso
- **50%**: "Aviso: Sua picareta está meio desgastada"
- **25%**: "Aviso: Sua picareta está desgastada"
- **10%**: "Aviso: Sua picareta está muito desgastada"
- **5%**: "ATENÇÃO: Sua picareta está quase quebrada!"

### Múltiplas Picaretas
- Cada picareta tem durabilidade independente
- Sistema usa a primeira picareta disponível
- Quando uma quebra, automaticamente usa a próxima

## 🔧 Configurações Avançadas

### Tempos de Mineração
```lua
Config.SmallMiningTime = 10000    -- 10 segundos (60% chance)
Config.MediumMiningTime = 15000   -- 15 segundos (30% chance)
Config.LargeMiningTime = 20000    -- 20 segundos (10% chance)
```

### Recompensas
```lua
Config.SmallReward = {min = 1, max = 3}    -- Pequena colheita
Config.MediumReward = {min = 2, max = 5}   -- Colheita média
Config.LargeReward = {min = 3, max = 8}    -- Grande colheita
```

## 🐛 Solução de Problemas

### Mineração Não Funciona
1. Verifique se tem uma picareta no inventário
2. Confirme se está próximo de um ponto de mineração
3. Verifique se o rsg-core está funcionando

### Durabilidade Não Funciona (RSG Framework)
1. Confirme se adicionou `decay` e `delete` ao item pickaxe no rsg-core
2. Verifique se o rsg-inventory está atualizado
3. Reinicie o rsg-core após adicionar os itens

### Blips Não Aparecem
1. Verifique se está próximo de uma mina (100m)
2. Confirme se a mina não é secreta
3. Verifique as configurações de blip no config.lua

## 📝 Changelog

### v2.0.0 - Sistema de Durabilidade
- ✅ Implementado sistema de durabilidade para picaretas
- ✅ Integração com sistema nativo do rsg-inventory
- ✅ Suporte a múltiplas picaretas com durabilidade individual
- ✅ Sistema de avisos progressivos
- ✅ Remoção automática quando durabilidade chega a 0%
- ✅ Configurações flexíveis no config.lua
- ✅ Traduções em português
- ✅ Correção de bugs nos prompts e blips

### v1.0.0 - Versão Inicial
- ✅ Sistema básico de mineração
- ✅ 6 minas diferentes
- ✅ Sistema de recompensas
- ✅ Animações e blips

## 👨‍💻 Autor

**Rick Sanchez**

*Inspirado nos scripts do RexShack#3041*

## 📄 Licença

Este projeto está sob licença. Veja o arquivo LICENSE para mais detalhes.

---

**Desenvolvido com ❤️ para a comunidade RSG Framework**