# Changelog

Todas as mudanças notáveis neste projeto serão documentadas neste arquivo.

O formato é baseado em [Keep a Changelog](https://keepachangelog.com/pt-BR/1.0.0/),
e este projeto adere ao [Versionamento Semântico](https://semver.org/lang/pt-BR/).

## [Não Lançado]

### Adicionado
- Documentação completa em português
- Guia de contribuição detalhado
- Sistema de changelog

### Mudado
- README.md completamente reescrito com informações detalhadas
- Melhor organização da documentação

## [1.0.0] - 2024-01-XX

### Adicionado
- Sistema completo de mineração para RedM
- Múltiplos locais de mineração espalhados pelo mapa
- Sistema de picaretas com durabilidade
- Diferentes tipos de minérios:
  - Carvão
  - Ferro
  - Ouro
  - Diamante
- Sistema de recompensas com dinheiro e experiência
- Interface moderna usando ox_lib
- Sistema de notificações com bln_notify
- Suporte multi-idioma:
  - Português (pt-pt)
  - Inglês (en)
  - Espanhol (es)
- Configuração completa via config.lua
- Compatibilidade total com RSG-Core
- Sistema de animações para mineração
- Cooldown entre ações de mineração
- Efeitos sonoros e visuais

### Configurações
- Locais de mineração configuráveis
- Chances de drop personalizáveis
- Recompensas ajustáveis
- Durabilidade de ferramentas configurável
- Tempos de cooldown ajustáveis

### Dependências
- rsg-core (framework principal)
- ox_lib (interface)
- bln_notify (notificações)

### Instalação
- Instruções detalhadas de instalação
- Lista de itens necessários para rsg-core/shared/items.lua
- Configuração do server.cfg
- Guia de configuração

## Tipos de Mudanças

- **Adicionado** para novas funcionalidades
- **Mudado** para mudanças em funcionalidades existentes
- **Depreciado** para funcionalidades que serão removidas
- **Removido** para funcionalidades removidas
- **Corrigido** para correções de bugs
- **Segurança** para vulnerabilidades

## Versões

### [1.0.0] - Versão Inicial
- Lançamento inicial do sistema de mineração
- Todas as funcionalidades básicas implementadas
- Documentação completa

### Próximas Versões Planejadas

#### [1.1.0] - Melhorias Planejadas
- Adicionar mais tipos de minérios
- Sistema de mineração em grupo
- Novos locais de mineração
- Melhorias na interface

#### [1.2.0] - Funcionalidades Avançadas
- Sistema de crafting com minérios
- Vendas automáticas
- Ranking de mineradores
- Eventos especiais de mineração

#### [2.0.0] - Refatoração Maior
- Refatoração completa do código
- Melhorias de performance
- Sistema de plugin para extensões
- API para outros recursos

## Notas de Compatibilidade

### RedM Versões Suportadas
- RedM Build 1311+ (versão atual)

### Dependências
- rsg-core: v1.0.0+
- ox_lib: v3.0.0+
- bln_notify: v1.0.0+

## Migração

### Da versão 0.x para 1.0.0
Esta é a primeira versão estável, então não há migração necessária.

### Futuras Migrações
Quando houver mudanças que quebrem compatibilidade, instruções detalhadas de migração serão fornecidas aqui.

## Suporte

Para reportar bugs ou solicitar funcionalidades, use:
- [GitHub Issues](https://github.com/Rexshack-RedM/rs-mining/issues)
- [Discord](https://discord.gg/s5uSk56B65)

## Agradecimentos

- Comunidade RSG-RedM
- Desenvolvedores do ox_lib
- Desenvolvedores do bln_notify
- Todos os testadores e contribuidores
