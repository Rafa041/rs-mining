# RS Mining

Um sistema de mineração completo para servidores RedM que utiliza o framework RSG-Core.

**Desenvolvido por Rick Sanchez** | **Inspirado em scripts do RexshackGaming**

## 📋 Descrição

O RS Mining permite que os jogadores extraiam diversos minérios e recursos do mundo de Red Dead Redemption 2. O sistema inclui:

- ✅ 6 locais de mineração diferentes (incluindo uma mina secreta)
- ✅ 7 tipos de minérios: Carvão, Ferro, Cobre, Prata, Ouro, Quartzo
- ✅ Sistema de picaretas com durabilidade
- ✅ Multi-idioma (Português, Inglês, Espanhol)
- ✅ Interface moderna com ox_lib
- ✅ Sistema de notificações
- ✅ Compatível com RSG-Core
- ✅ Blips no mapa para localizar minas
- ✅ Sistema de recompensas baseado em chances

## 🎯 Características

- **Sistema de Mineração Realista**: Diferentes tipos de minérios com diferentes chances de drop
- **Durabilidade de Ferramentas**: Picaretas se desgastam com o uso
- **Locais Diversos**: Múltiplos pontos de mineração espalhados pelo mapa
- **Interface Intuitiva**: Menu interativo com ox_lib
- **Multi-idioma**: Suporte para Português, Inglês e Espanhol
- **Sistema de Recompensas**: Receba dinheiro e experiência por mineração

## 📦 Dependências

- [rsg-core](https://github.com/Rexshack-RedM/rsg-core) - Framework principal
- [ox_lib](https://github.com/overextended/ox_lib) - Biblioteca de interface
- [bln_notify](https://github.com/Bln0/notify) - Sistema de notificações

## 🚀 Instalação

### 1. Pré-requisitos

Certifique-se de que as seguintes dependências estão instaladas e funcionando:

- rsg-core
- ox_lib
- bln_notify

### 2. Instalação do Resource

1. Clone ou baixe este repositório
2. Coloque a pasta `rs-mining` na sua pasta `resources`
3. Adicione os itens necessários ao arquivo `rsg-core/shared/items.lua` (veja seção de itens)
4. Adicione as imagens dos itens à pasta `rsg-inventory/html/images`

### 3. Configuração do Servidor

Adicione a seguinte linha ao seu `server.cfg`:

```
ensure rs-mining
```

### 4. Itens Necessários

Adicione os seguintes itens ao seu `rsg-core/shared/items.lua`:

```lua
-- Mineração
['pickaxe'] = {['name'] = 'pickaxe', ['label'] = 'Picareta', ['weight'] = 100, ['type'] = 'item', ['image'] = 'pickaxe.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['level'] = 0, ['description'] = 'Equipamento para mineração'},
['coal'] = {['name'] = 'coal', ['label'] = 'Carvão', ['weight'] = 50, ['type'] = 'item', ['image'] = 'coal.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['level'] = 0, ['description'] = 'Carvão mineral extraído da mina'},
['iron_ore'] = {['name'] = 'iron_ore', ['label'] = 'Minério de Ferro', ['weight'] = 60, ['type'] = 'item', ['image'] = 'iron_ore.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['level'] = 0, ['description'] = 'Minério de ferro bruto'},
['copper_ore'] = {['name'] = 'copper_ore', ['label'] = 'Minério de Cobre', ['weight'] = 55, ['type'] = 'item', ['image'] = 'copper_ore.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['level'] = 0, ['description'] = 'Minério de cobre bruto'},
['silver_ore'] = {['name'] = 'silver_ore', ['label'] = 'Minério de Prata', ['weight'] = 70, ['type'] = 'item', ['image'] = 'silver_ore.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['level'] = 0, ['description'] = 'Minério de prata precioso'},
['gold_nugget'] = {['name'] = 'gold_nugget', ['label'] = 'Pepita de Ouro', ['weight'] = 80, ['type'] = 'item', ['image'] = 'gold_nugget.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['level'] = 0, ['description'] = 'Pepita de ouro puro'},
['quartz'] = {['name'] = 'quartz', ['label'] = 'Quartzo', ['weight'] = 45, ['type'] = 'item', ['image'] = 'quartz.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['level'] = 0, ['description'] = 'Cristal de quartzo brilhante'},
```

**Nota**: Você pode encontrar o arquivo completo `installation/shared_items.lua` no repositório com todos os itens já formatados.

## 🎮 Como Usar

1. **Obter uma Picareta**: Compre uma picareta em qualquer loja
2. **Encontrar um Local de Mineração**: Procure por pedras e rochas no mapa
3. **Iniciar a Mineração**: Use a picareta próximo às rochas
4. **Coletar Recursos**: Receba minérios e dinheiro baseado no que você encontrar
5. **Vender Recursos**: Venda os minérios em lojas ou para outros jogadores

## 🏔️ Locais de Mineração

O sistema inclui 6 locais únicos de mineração:

1. **Mina de Annesburg** - Especializada em carvão e ferro
2. **Mina de Elysian Pool** - Rica em cobre e quartzo
3. **Mina de Valentine** - Concentra-se em quartzo e carvão
4. **Mina de Strawberry** - Rica em ferro e carvão
5. **Mina do Deserto** - Rica em ouro e pedras preciosas
6. **Mina Secreta** - Mistura balanceada de todos os minérios

Cada mina tem suas próprias chances de drop e especialidades únicas.

## ⚙️ Configuração

Todas as configurações podem ser editadas no arquivo `config.lua`:

- **Locais de Mineração**: Adicione ou remova pontos de mineração
- **Tipos de Minérios**: Configure quais minérios podem ser encontrados
- **Chances de Drop**: Ajuste a probabilidade de encontrar cada minério
- **Recompensas**: Configure o dinheiro e experiência recebidos
- **Durabilidade**: Ajuste quanto as picaretas se desgastam
- **Blips**: Configure ícones e cores dos blips no mapa

## 🌍 Idiomas Suportados

- 🇵🇹 Português (pt-pt)
- 🇺🇸 Inglês (en)
- 🇪🇸 Espanhol (es)

## 🤝 Contribuição

Contribuições são bem-vindas! Sinta-se à vontade para:

1. Fazer um Fork do projeto
2. Criar uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. Fazer commit das suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Fazer push para a branch (`git push origin feature/AmazingFeature`)
5. Abrir um Pull Request

## 📄 Licença

Este projeto está licenciado sob a Licença GPL v3 - veja o arquivo [LICENSE](LICENSE) para detalhes.

## 📝 Changelog

Veja o arquivo [CHANGELOG.md](CHANGELOG.md) para um histórico detalhado das mudanças.

## ⚠️ Aviso

Este é um recurso para RedM e requer o framework RSG-Core para funcionar corretamente. Certifique-se de ter todas as dependências instaladas antes de usar.
