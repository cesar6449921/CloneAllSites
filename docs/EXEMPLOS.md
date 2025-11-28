# 📸 Exemplos de Uso e Resultados

## Exemplo 1: Clonando Example.com

### Comando:
```bash
ruby clone_site.rb https://example.com
```

### Saída no Terminal:
```
============================================================
🌐 CLONADOR DE SITES - Ruby Edition
============================================================

🚀 Iniciando clonagem do site: https://example.com
📁 Salvando em: cloned_site_1732752098

📥 Baixando página principal...
🎨 Baixando arquivos CSS...
  ✓ style_0.css
📜 Baixando arquivos JavaScript...
  ✓ script_0.js
🖼️  Baixando imagens...
  ✓ image_0.png

✅ Clonagem concluída com sucesso!
📂 Arquivos salvos em: D:/PROJETOS-GITHUB/CL-SIT/cloned_site_1732752098

============================================================
```

### Estrutura Criada:
```
cloned_site_1732752098/
├── index.html          (2.1 KB)
├── css/
│   └── style_0.css     (1.5 KB)
├── js/
│   └── script_0.js     (3.2 KB)
└── images/
    └── image_0.png     (15.3 KB)
```

---

## Exemplo 2: Clonando um Blog

### Comando:
```bash
ruby clone_site.rb https://meublog.com.br
```

### Saída no Terminal:
```
============================================================
🌐 CLONADOR DE SITES - Ruby Edition
============================================================

🚀 Iniciando clonagem do site: https://meublog.com.br
📁 Salvando em: cloned_site_1732752150

📥 Baixando página principal...
🎨 Baixando arquivos CSS...
  ✓ style_0.css
  ✓ style_1.css
  ✓ style_2.css
📜 Baixando arquivos JavaScript...
  ✓ script_0.js
  ✓ script_1.js
  ✗ Erro ao baixar JS: https://cdn.example.com/blocked.js - 403 Forbidden
🖼️  Baixando imagens...
  ✓ image_0.jpg
  ✓ image_1.jpg
  ✓ image_2.png
  ✓ image_3.jpg
  ✗ Erro ao baixar imagem: https://cdn.example.com/blocked.png - 403 Forbidden

✅ Clonagem concluída com sucesso!
📂 Arquivos salvos em: D:/PROJETOS-GITHUB/CL-SIT/cloned_site_1732752150

============================================================
```

### Estrutura Criada:
```
cloned_site_1732752150/
├── index.html          (45.2 KB)
├── css/
│   ├── style_0.css     (12.5 KB)
│   ├── style_1.css     (8.3 KB)
│   └── style_2.css     (3.1 KB)
├── js/
│   ├── script_0.js     (25.7 KB)
│   └── script_1.js     (15.2 KB)
└── images/
    ├── image_0.jpg     (125.3 KB)
    ├── image_1.jpg     (98.7 KB)
    ├── image_2.png     (45.2 KB)
    └── image_3.jpg     (156.8 KB)
```

---

## Exemplo 3: Site com Muitos Recursos

### Comando:
```bash
ruby clone_site.rb https://site-complexo.com
```

### Resultado:
```
cloned_site_1732752200/
├── index.html          (125.5 KB)
├── css/
│   ├── style_0.css     (45.2 KB)
│   ├── style_1.css     (32.1 KB)
│   ├── style_2.css     (18.5 KB)
│   ├── style_3.css     (12.3 KB)
│   └── style_4.css     (8.7 KB)
├── js/
│   ├── script_0.js     (125.3 KB)
│   ├── script_1.js     (98.7 KB)
│   ├── script_2.js     (75.2 KB)
│   ├── script_3.js     (45.8 KB)
│   └── script_4.js     (32.1 KB)
└── images/
    ├── image_0.jpg     (256.3 KB)
    ├── image_1.png     (198.7 KB)
    ├── image_2.jpg     (175.2 KB)
    ├── image_3.png     (145.8 KB)
    ├── image_4.jpg     (132.1 KB)
    ├── image_5.png     (98.5 KB)
    ├── image_6.jpg     (87.3 KB)
    ├── image_7.png     (65.2 KB)
    ├── image_8.jpg     (54.1 KB)
    └── image_9.png     (42.8 KB)
```

**Total:** ~2.5 MB de recursos baixados

---

## Comparação: Antes e Depois

### HTML Original (no servidor):
```html
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="/assets/css/main.css">
    <link rel="stylesheet" href="https://cdn.example.com/bootstrap.css">
</head>
<body>
    <img src="/images/logo.png" alt="Logo">
    <img src="../assets/banner.jpg" alt="Banner">
    <script src="/js/app.js"></script>
    <script src="https://cdn.example.com/jquery.js"></script>
</body>
</html>
```

### HTML Clonado (local):
```html
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="css/style_0.css">
    <link rel="stylesheet" href="css/style_1.css">
</head>
<body>
    <img src="images/image_0.png" alt="Logo">
    <img src="images/image_1.jpg" alt="Banner">
    <script src="js/script_0.js"></script>
    <script src="js/script_1.js"></script>
</body>
</html>
```

---

## Casos de Uso Reais

### ✅ Funciona Bem Com:
- Sites estáticos simples
- Landing pages
- Blogs tradicionais
- Páginas de documentação
- Sites institucionais básicos

### ⚠️ Funciona Parcialmente Com:
- Sites com muito JavaScript
- Páginas com recursos CDN bloqueados
- Sites com autenticação
- Páginas com lazy loading

### ❌ Não Funciona Com:
- Single Page Applications (React, Vue, Angular)
- Sites que requerem login
- Conteúdo carregado via WebSocket
- Sites com proteção anti-scraping agressiva

---

## Dicas de Uso

### 1. Teste Primeiro com Sites Simples
```bash
ruby clone_site.rb https://example.com
```

### 2. Use URLs Completas
```bash
# ✅ Correto
ruby clone_site.rb https://www.site.com

# ❌ Incorreto
ruby clone_site.rb www.site.com
ruby clone_site.rb site.com
```

### 3. Verifique os Resultados
```bash
# Após clonar, abra o index.html no navegador
cd cloned_site_1732752098
start index.html  # Windows
```

### 4. Lide com Erros
- Alguns recursos podem falhar (403, 404)
- O script continua mesmo com erros
- Verifique quais recursos não foram baixados

---

## Estatísticas Típicas

| Tipo de Site | Arquivos CSS | Arquivos JS | Imagens | Tempo |
|--------------|--------------|-------------|---------|-------|
| Simples      | 1-2          | 1-2         | 1-5     | 5-10s |
| Médio        | 3-5          | 3-5         | 5-15    | 15-30s|
| Complexo     | 5-10         | 5-10        | 15-30   | 30-60s|

*Tempos variam com a velocidade da internet e tamanho dos arquivos
