# 📊 Como Funciona o Clonador de Sites

## Fluxo de Execução

```
┌─────────────────────────────────────────────────────────────┐
│  1. INÍCIO                                                  │
│  ruby clone_site.rb https://exemplo.com                    │
└────────────────────┬────────────────────────────────────────┘
                     │
                     ▼
┌─────────────────────────────────────────────────────────────┐
│  2. CRIAR DIRETÓRIOS                                        │
│  ├── cloned_site_1234567890/                               │
│  ├── css/                                                   │
│  ├── js/                                                    │
│  └── images/                                                │
└────────────────────┬────────────────────────────────────────┘
                     │
                     ▼
┌─────────────────────────────────────────────────────────────┐
│  3. BAIXAR HTML PRINCIPAL                                   │
│  GET https://exemplo.com                                    │
│  └── Salva em memória para processar                        │
└────────────────────┬────────────────────────────────────────┘
                     │
                     ▼
┌─────────────────────────────────────────────────────────────┐
│  4. PROCESSAR COM NOKOGIRI                                  │
│  doc = Nokogiri::HTML(html_content)                         │
│  └── Cria árvore DOM para manipulação                       │
└────────────────────┬────────────────────────────────────────┘
                     │
                     ▼
┌─────────────────────────────────────────────────────────────┐
│  5. BAIXAR CSS                                              │
│  ├── Encontra: <link rel="stylesheet" href="...">          │
│  ├── Resolve URLs relativas → absolutas                     │
│  ├── Baixa cada arquivo CSS                                 │
│  ├── Salva em: css/style_0.css, style_1.css, ...           │
│  └── Atualiza href no HTML: href="css/style_0.css"         │
└────────────────────┬────────────────────────────────────────┘
                     │
                     ▼
┌─────────────────────────────────────────────────────────────┐
│  6. BAIXAR JAVASCRIPT                                       │
│  ├── Encontra: <script src="...">                          │
│  ├── Resolve URLs relativas → absolutas                     │
│  ├── Baixa cada arquivo JS                                  │
│  ├── Salva em: js/script_0.js, script_1.js, ...            │
│  └── Atualiza src no HTML: src="js/script_0.js"            │
└────────────────────┬────────────────────────────────────────┘
                     │
                     ▼
┌─────────────────────────────────────────────────────────────┐
│  7. BAIXAR IMAGENS                                          │
│  ├── Encontra: <img src="...">                             │
│  ├── Resolve URLs relativas → absolutas                     │
│  ├── Baixa cada imagem                                      │
│  ├── Salva em: images/image_0.jpg, image_1.png, ...        │
│  └── Atualiza src no HTML: src="images/image_0.jpg"        │
└────────────────────┬────────────────────────────────────────┘
                     │
                     ▼
┌─────────────────────────────────────────────────────────────┐
│  8. SALVAR HTML MODIFICADO                                  │
│  File.write("index.html", doc.to_html)                      │
│  └── HTML agora aponta para arquivos locais                 │
└────────────────────┬────────────────────────────────────────┘
                     │
                     ▼
┌─────────────────────────────────────────────────────────────┐
│  9. CONCLUÍDO ✅                                            │
│  Site clonado em: cloned_site_1234567890/                  │
└─────────────────────────────────────────────────────────────┘
```

## Exemplo de Transformação de URLs

### Antes (HTML Original):
```html
<link rel="stylesheet" href="/assets/style.css">
<script src="../js/app.js"></script>
<img src="images/logo.png">
```

### Processamento:
```
1. /assets/style.css → https://exemplo.com/assets/style.css
   └── Baixa e salva em: css/style_0.css

2. ../js/app.js → https://exemplo.com/js/app.js
   └── Baixa e salva em: js/script_0.js

3. images/logo.png → https://exemplo.com/images/logo.png
   └── Baixa e salva em: images/image_0.png
```

### Depois (HTML Modificado):
```html
<link rel="stylesheet" href="css/style_0.css">
<script src="js/script_0.js"></script>
<img src="images/image_0.png">
```

## Tratamento de Erros

```
Para cada recurso:
├── Tenta baixar
├── Se sucesso: ✓ Salva e atualiza HTML
└── Se falha: ✗ Mostra erro mas continua
    └── Outros recursos ainda são processados
```

## Tecnologias Utilizadas

- **Ruby**: Linguagem de programação
- **Nokogiri**: Parser HTML/XML (como jQuery para Ruby)
- **URI**: Manipulação de URLs
- **FileUtils**: Operações com arquivos e diretórios
- **OpenURI**: Download de conteúdo HTTP

## Limitações Técnicas

1. **JavaScript Dinâmico**: Não executa JavaScript
   - Sites React/Vue podem não funcionar
   - Conteúdo carregado via AJAX não é capturado

2. **Uma Página Apenas**: Não segue links
   - Clona apenas a URL fornecida
   - Não baixa páginas linkadas

3. **Recursos Inline**: Não processa
   - CSS inline em `<style>` tags
   - JavaScript inline em `<script>` tags sem src

4. **Fontes Web**: Não baixa
   - Google Fonts
   - Font Awesome
   - Outras fontes externas
