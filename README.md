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

### Uso básico (clona example.com):

```bash
ruby clone_site.rb
```

### Clonar um site específico:

```bash
ruby clone_site.rb https://www.seusite.com
```

### Exemplos:

```bash
# Clonar o site da Wikipedia
ruby clone_site.rb https://pt.wikipedia.org

# Clonar um blog
ruby clone_site.rb https://meublog.com
```

## 📁 Estrutura de saída

O script cria uma pasta `sites/` e organiza cada clonagem lá dentro:

```
sites/
└── cloned_site_1234567890/
    ├── index.html          # HTML principal
    ├── css/                # Arquivos CSS
    │   ├── style_0.css
    │   └── style_1.css
    ├── js/                 # Arquivos JavaScript
    │   ├── script_0.js
    │   └── script_1.js
    └── images/             # Imagens
        ├── image_0.jpg
        └── image_1.png
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
