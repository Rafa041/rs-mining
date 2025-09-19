# Guia de Contribuição

Obrigado por considerar contribuir para o RSG Mining! Este documento fornece diretrizes para contribuir com o projeto.

## 📋 Como Contribuir

### 🐛 Reportando Bugs

Antes de reportar um bug, verifique se ele já foi reportado:
1. Vá para a aba [Issues](https://github.com/Rexshack-RedM/rs-mining/issues)
2. Use a busca para verificar se o bug já foi reportado
3. Se não foi reportado, crie uma nova issue

**Ao reportar um bug, inclua:**
- Descrição clara do problema
- Passos para reproduzir o bug
- Comportamento esperado vs comportamento atual
- Screenshots ou vídeos (se aplicável)
- Informações do servidor (versão do RedM, outras dependências)
- Logs do servidor (se disponíveis)

### ✨ Sugerindo Melhorias

Para sugerir uma nova funcionalidade ou melhoria:
1. Vá para a aba [Issues](https://github.com/Rexshack-RedM/rs-mining/issues)
2. Crie uma nova issue com o label "enhancement"
3. Descreva detalhadamente sua sugestão
4. Explique por que seria útil para outros usuários

### 🔧 Contribuindo com Código

#### Pré-requisitos
- Conhecimento em Lua
- Familiaridade com RedM/FiveM
- Entendimento do framework RSG-Core
- Git instalado

#### Processo de Contribuição

1. **Fork do Repositório**
   ```bash
   git clone https://github.com/SEU_USUARIO/rs-mining.git
   cd rs-mining
   ```

2. **Criar uma Branch**
   ```bash
   git checkout -b feature/nome-da-sua-feature
   # ou
   git checkout -b bugfix/descricao-do-bug
   ```

3. **Fazer suas Mudanças**
   - Mantenha o código limpo e bem comentado
   - Siga as convenções de nomenclatura existentes
   - Teste suas mudanças antes de submeter

4. **Commit das Mudanças**
   ```bash
   git add .
   git commit -m "feat: adiciona nova funcionalidade X"
   # ou
   git commit -m "fix: corrige bug em Y"
   ```

5. **Push para o Fork**
   ```bash
   git push origin feature/nome-da-sua-feature
   ```

6. **Criar Pull Request**
   - Vá para o repositório original
   - Clique em "New Pull Request"
   - Selecione sua branch
   - Descreva suas mudanças detalhadamente

## 📝 Convenções de Código

### Lua
- Use indentação de 4 espaços
- Nomes de variáveis em camelCase
- Nomes de funções em camelCase
- Comentários em português quando necessário
- Use aspas simples para strings quando possível

### Commits
Use o padrão Conventional Commits:
- `feat:` nova funcionalidade
- `fix:` correção de bug
- `docs:` mudanças na documentação
- `style:` formatação, espaços em branco
- `refactor:` refatoração de código
- `test:` adição de testes
- `chore:` mudanças em ferramentas, configurações

Exemplos:
```
feat: adiciona sistema de durabilidade para picaretas
fix: corrige bug na detecção de locais de mineração
docs: atualiza README com novas instruções de instalação
```

## 🧪 Testando Mudanças

Antes de submeter suas mudanças:

1. **Teste Local**
   - Instale o resource em um servidor de teste
   - Teste todas as funcionalidades relacionadas às suas mudanças
   - Verifique se não quebrou funcionalidades existentes

2. **Verificar Logs**
   - Monitore os logs do servidor
   - Verifique se não há erros relacionados às suas mudanças

3. **Teste com Diferentes Configurações**
   - Teste com diferentes configurações do config.lua
   - Verifique compatibilidade com diferentes versões de dependências

## 📋 Checklist para Pull Requests

Antes de submeter um PR, verifique:

- [ ] Código segue as convenções do projeto
- [ ] Mudanças foram testadas localmente
- [ ] Documentação foi atualizada (se necessário)
- [ ] Commits seguem o padrão Conventional Commits
- [ ] Não há conflitos com a branch principal
- [ ] Descrição do PR é clara e detalhada

## 🏷️ Labels

Usamos as seguintes labels para organizar issues e PRs:

- `bug` - Algo não está funcionando
- `enhancement` - Nova funcionalidade ou melhoria
- `documentation` - Melhorias na documentação
- `good first issue` - Bom para iniciantes
- `help wanted` - Precisa de ajuda extra
- `priority: high` - Alta prioridade
- `priority: low` - Baixa prioridade
- `status: needs review` - Precisa de revisão

## 💬 Comunicação

- **Issues**: Use para bugs e sugestões
- **Discussions**: Use para perguntas gerais e discussões
- **Discord**: [RexshackGaming](https://discord.gg/s5uSk56B65) para suporte mais rápido

## 📄 Licença

Ao contribuir, você concorda que suas contribuições serão licenciadas sob a mesma licença GPL v3 do projeto.

## 🎉 Reconhecimento

Todos os contribuidores serão reconhecidos no README do projeto. Obrigado por ajudar a tornar o RSG Mining melhor!

---

Se você tem dúvidas sobre como contribuir, sinta-se à vontade para abrir uma issue ou entrar em contato conosco no Discord!
