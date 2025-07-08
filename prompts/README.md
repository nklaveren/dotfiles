# VS Code Copilot Customization

Este diretório contém arquivos de instruções personalizadas e prompts reutilizáveis para GitHub Copilot no VS Code.

## Estrutura dos Arquivos

### 📋 Instruction Files (`.instructions.md`)
Arquivos de instruções definem diretrizes e boas práticas que são aplicadas automaticamente:

- **`general-coding.instructions.md`** - Padrões gerais de codificação
- **`typescript-react.instructions.md`** - Diretrizes específicas para TypeScript e React
- **`angular-best-practices.instructions.md`** - Boas práticas específicas para Angular
- **`javascript-best-practices.instructions.md`** - Boas práticas para JavaScript/TypeScript
- **`testing-standards.instructions.md`** - Padrões para testes unitários e integração

### 🚀 Prompt Files (`.prompt.md`)
Arquivos de prompt são comandos reutilizáveis para tarefas específicas:

- **`create-react-form.prompt.md`** - Gera componentes de formulário React
- **`create-angular-component.prompt.md`** - Gera componentes Angular seguindo boas práticas
- **`create-angular-service.prompt.md`** - Gera serviços Angular com tipagem adequada
- **`create-angular-form.prompt.md`** - Gera formulários reativos Angular
- **`migrate-angular-code.prompt.md`** - Migra código Angular para práticas modernas
- **`api-security-review.prompt.md`** - Realiza revisão de segurança em APIs
- **`generate-tests.prompt.md`** - Gera testes unitários abrangentes
- **`performance-analysis.prompt.md`** - Analisa e otimiza performance
- **`generate-api-docs.prompt.md`** - Gera documentação de API
- **`refactor-code.prompt.md`** - Refatora código para melhor manutenibilidade
- **`debug-code.prompt.md`** - Ajuda na depuração e correção de código

## Como Usar

### Instructions Files
As instruções são aplicadas automaticamente baseadas no padrão `applyTo` definido em cada arquivo:

```markdown
---
applyTo: "**/*.ts,**/*.tsx"
---
# Instruções específicas para TypeScript
```

### Prompt Files
Execute prompts no VS Code Chat de diferentes formas:

1. **Via Command Palette**: `Ctrl+Shift+P` → "Chat: Run Prompt"
2. **No Chat**: Digite `/nome-do-prompt` (ex: `/create-react-form`)
3. **Via Editor**: Abra o arquivo `.prompt.md` e clique no botão play

### Exemplos de Uso

#### Criar um formulário React:
```
/create-react-form
```

#### Criar um componente Angular:
```
/create-angular-component
```

#### Criar um serviço Angular:
```
/create-angular-service
```

#### Criar um formulário Angular reativo:
```
/create-angular-form
```

#### Migrar código Angular para práticas modernas:
```
/migrate-angular-code
```

#### Revisar segurança de API:
```
/api-security-review
```

#### Gerar testes para código selecionado:
```
/generate-tests
```

#### Analisar performance:
```
/performance-analysis
```

## Configuração no VS Code

As seguintes configurações foram adicionadas ao `settings.json`:

```json
{
  "github.copilot.chat.codeGeneration.useInstructionFiles": true,
  "chat.promptFiles": true,
  "chat.promptFilesLocations": {
    "prompts": true,
    ".github/prompts": true
  },
  "chat.instructionsFilesLocations": {
    "prompts": true,
    ".github/instructions": true
  },
  "github.copilot.chat.codeGeneration.instructions": [
    {
      "file": "prompts/general-coding.instructions.md"
    },
    {
      "file": "prompts/typescript-react.instructions.md"
    }
  ]
}
```

## Personalizando

### Criando Novos Prompts
1. Crie um arquivo `.prompt.md` na pasta `prompts/`
2. Adicione metadados no cabeçalho:
   ```markdown
   ---
   mode: 'agent'
   tools: ['codebase']
   description: 'Descrição do prompt'
   ---
   ```
3. Escreva as instruções em Markdown

### Criando Novas Instruções
1. Crie um arquivo `.instructions.md` na pasta `prompts/`
2. Adicione metadados:
   ```markdown
   ---
   applyTo: "**/*.ts"
   description: "Instruções para TypeScript"
   ---
   ```
3. Defina as diretrizes em Markdown

### Variáveis Disponíveis
Nos prompt files, você pode usar:
- `${workspaceFolder}` - Pasta do workspace
- `${file}` - Arquivo atual
- `${selection}` - Texto selecionado
- `${input:variableName}` - Input do usuário

## Dicas

1. **Mantenha instruções simples** - Uma instrução por conceito
2. **Use referências** - Referencie outros arquivos com `[link](./outro-arquivo.md)`
3. **Seja específico** - Quanto mais específico, melhor o resultado
4. **Teste regularmente** - Teste os prompts para garantir qualidade
5. **Organize por contexto** - Agrupe instruções relacionadas

## Recursos Adicionais

- [Documentação oficial do VS Code](https://code.visualstudio.com/docs/copilot/copilot-customization)
- [GitHub Copilot Chat Cookbook](https://docs.github.com/en/copilot/copilot-chat-cookbook)
- [Prompt Engineering Guide](https://code.visualstudio.com/docs/copilot/chat/prompt-crafting)
