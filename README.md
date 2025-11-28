# 🌐 Clonador de Sites - Ruby Edition

Um script Ruby funcional para clonar sites, baixando HTML, CSS, JavaScript e imagens.

## 📋 Pré-requisitos

### 1. Instalar Ruby

Baixe e instale o Ruby para Windows:
- **Site oficial**: https://rubyinstaller.org/
- Recomendado: Ruby+Devkit 3.2.x ou superior

### 2. Instalar a gem Nokogiri

Após instalar o Ruby, abra o PowerShell ou CMD e execute:

```bash
gem install nokogiri
```

## 🚀 Como usar

### Uso básico:

```bash
ruby src/clone_site.rb
```

### Clonar um site específico:

```bash
ruby src/clone_site.rb https://www.seusite.com
```

## 📖 Documentação Completa

- **[docs/QUICKSTART.md](docs/QUICKSTART.md)** - Início rápido em 3 passos
- **[docs/INSTALACAO.md](docs/INSTALACAO.md)** - Guia detalhado de instalação
- **[docs/README.md](docs/README.md)** - Visão geral e funcionalidades
- **[docs/EXEMPLOS.md](docs/EXEMPLOS.md)** - Exemplos práticos de uso
- **[docs/COMO_FUNCIONA.md](docs/COMO_FUNCIONA.md)** - Arquitetura interna

## 📁 Estrutura do Projeto

```
CL-SIT/
│
├── 📂 src/                   # Código fonte
│   ├── clone_site.rb         # Script principal
│   └── config.example.rb     # Configurações
│
├── 📂 docs/                  # Documentação
│   ├── QUICKSTART.md
│   ├── INSTALACAO.md
│   └── ...
│
├── 📂 sites/                 # Sites clonados (Output)
│
├── 📂 agent_setup/           # Configuração do Agent AI
│
├── README.md                 # Este arquivo
└── LICENSE                   # Licença
```

## ✨ Funcionalidades

- ✅ Baixa o HTML da página
- ✅ Baixa todos os arquivos CSS
- ✅ Baixa todos os arquivos JavaScript
- ✅ Baixa todas as imagens
- ✅ Atualiza os links no HTML para apontar para os arquivos locais
- ✅ Resolve URLs relativas automaticamente
- ✅ Tratamento de erros robusto

## ⚠️ Limitações

- Clona apenas uma página (não segue links)
- Alguns sites podem bloquear o acesso via script
- Sites com conteúdo dinâmico (React, Vue, etc.) podem não funcionar perfeitamente
- Recursos carregados via JavaScript podem não ser capturados

## 🔧 Troubleshooting

### Erro: "cannot load such file -- nokogiri"

Solução: Instale a gem nokogiri:

```bash
gem install nokogiri
```

### Erro: "SSL certificate problem"

Alguns sites podem ter problemas de certificado SSL. Isso é normal e o script tentará continuar.

### Site não carrega corretamente

Alguns sites modernos usam muito JavaScript. Para esses casos, considere usar ferramentas mais avançadas como Puppeteer ou Selenium.

## 📝 Notas legais

⚠️ **IMPORTANTE**: Este script é apenas para fins educacionais. Sempre respeite:

- Direitos autorais
- Termos de serviço dos sites
- Leis de propriedade intelectual
- Arquivo robots.txt dos sites

Não use este script para copiar conteúdo protegido ou violar direitos autorais.

## 🤝 Contribuindo

Sinta-se à vontade para melhorar este script! Algumas ideias:

- Adicionar suporte para fontes web
- Implementar download recursivo (seguir links)
- Adicionar barra de progresso
- Suporte para vídeos e outros recursos

## 📄 Licença

Código livre para uso educacional.
