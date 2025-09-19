# RSG Mining

Um sistema de mineração completo para servidores RedM que utiliza o framework RSG-Core.

## 📋 Descrição

O RSG Mining permite que os jogadores extraiam diversos minérios e recursos do mundo de Red Dead Redemption 2. O sistema inclui:

- ✅ Múltiplos locais de mineração
- ✅ Diferentes tipos de minérios e recursos
- ✅ Sistema de picaretas com durabilidade
- ✅ Multi-idioma (Português, Inglês, Espanhol)
- ✅ Interface moderna com ox_lib
- ✅ Sistema de notificações
- ✅ Compatível com RSG-Core

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
['pickaxe'] = {['name'] = 'pickaxe', ['label'] = 'Picareta', ['weight'] = 1000, ['type'] = 'item', ['image'] = 'pickaxe.png', ['unique'] = false, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['description'] = 'Uma picareta para mineração'},
['coal'] = {['name'] = 'coal', ['label'] = 'Carvão', ['weight'] = 100, ['type'] = 'item', ['image'] = 'coal.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = 'Carvão extraído das minas'},
['iron'] = {['name'] = 'iron', ['label'] = 'Ferro', ['weight'] = 100, ['type'] = 'item', ['image'] = 'iron.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = 'Minério de ferro'},
['gold'] = {['name'] = 'gold', ['label'] = 'Ouro', ['weight'] = 100, ['type'] = 'item', ['image'] = 'gold.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = 'Minério de ouro'},
['diamond'] = {['name'] = 'diamond', ['label'] = 'Diamante', ['weight'] = 50, ['type'] = 'item', ['image'] = 'diamond.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = 'Um diamante bruto'},
```

## 🎮 Como Usar

1. **Obter uma Picareta**: Compre uma picareta em qualquer loja
2. **Encontrar um Local de Mineração**: Procure por pedras e rochas no mapa
3. **Iniciar a Mineração**: Use a picareta próximo às rochas
4. **Coletar Recursos**: Receba minérios e dinheiro baseado no que você encontrar
5. **Vender Recursos**: Venda os minérios em lojas ou para outros jogadores

## ⚙️ Configuração

Todas as configurações podem ser editadas no arquivo `config.lua`:

- **Locais de Mineração**: Adicione ou remova pontos de mineração
- **Tipos de Minérios**: Configure quais minérios podem ser encontrados
- **Chances de Drop**: Ajuste a probabilidade de encontrar cada minério
- **Recompensas**: Configure o dinheiro e experiência recebidos
- **Durabilidade**: Ajuste quanto as picaretas se desgastam

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

## 🆘 Suporte

- **Discord**: [RexshackGaming](https://discord.gg/s5uSk56B65)
- **GitHub**: [Rexshack-RedM](https://github.com/Rexshack-RedM)

## 📝 Changelog

Veja o arquivo [CHANGELOG.md](CHANGELOG.md) para um histórico detalhado das mudanças.

## ⚠️ Aviso

Este é um recurso para RedM e requer o framework RSG-Core para funcionar corretamente. Certifique-se de ter todas as dependências instaladas antes de usar.
