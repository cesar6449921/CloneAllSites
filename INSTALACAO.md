# 📦 Guia de Instalação - Clonador de Sites Ruby

## Passo 1: Instalar Ruby no Windows

### Opção 1: Usando RubyInstaller (Recomendado)

1. **Baixar o RubyInstaller**
   - Acesse: https://rubyinstaller.org/downloads/
   - Baixe a versão **Ruby+Devkit 3.2.x (x64)** ou superior
   - Exemplo: `rubyinstaller-devkit-3.2.2-1-x64.exe`

2. **Executar o Instalador**
   - Execute o arquivo baixado
   - Marque a opção: ✅ **"Add Ruby executables to your PATH"**
   - Clique em "Install"
   - Quando aparecer a janela do MSYS2, pressione Enter para instalar tudo

3. **Verificar a Instalação**
   - Abra um **novo** PowerShell ou CMD
   - Execute:
     ```bash
     ruby --version
     ```
   - Deve aparecer algo como: `ruby 3.2.2 (2023-03-30 revision e51014f9c0)`

## Passo 2: Instalar a Gem Nokogiri

Após instalar o Ruby, execute no PowerShell ou CMD:

```bash
gem install nokogiri
```

Aguarde a instalação (pode levar alguns minutos).

Para verificar se foi instalado:

```bash
gem list nokogiri
```

## Passo 3: Testar o Script

Navegue até a pasta do projeto e execute:

```bash
cd d:\PROJETOS-GITHUB\CL-SIT
ruby clone_site.rb
```

Isso deve clonar o site example.com como teste.

## Passo 4: Usar com Seus Sites

```bash
# Exemplo 1: Clonar Wikipedia
ruby clone_site.rb https://pt.wikipedia.org

# Exemplo 2: Clonar qualquer site
ruby clone_site.rb https://www.seusite.com.br
```

## 🔧 Solução de Problemas

### Erro: "ruby is not recognized"

**Solução**: 
1. Certifique-se de ter marcado "Add Ruby executables to your PATH" durante a instalação
2. Feche e abra um **novo** terminal
3. Se ainda não funcionar, reinicie o computador

### Erro: "cannot load such file -- nokogiri"

**Solução**:
```bash
gem install nokogiri
```

### Erro: "SSL certificate problem"

**Solução**: Isso é normal para alguns sites. O script tentará continuar mesmo assim.

### Erro: "Permission denied"

**Solução**: Execute o PowerShell como Administrador

## 📝 Comandos Úteis

```bash
# Ver versão do Ruby
ruby --version

# Ver versão do Gem
gem --version

# Listar todas as gems instaladas
gem list

# Atualizar o Nokogiri
gem update nokogiri

# Desinstalar o Nokogiri (se necessário)
gem uninstall nokogiri
```

## 🎯 Próximos Passos

Após a instalação bem-sucedida:

1. ✅ Ruby instalado
2. ✅ Nokogiri instalado
3. ✅ Script testado com example.com
4. 🚀 Pronto para clonar qualquer site!

## 💡 Dicas

- Use sites simples primeiro para testar (como example.com)
- Sites muito complexos podem não funcionar perfeitamente
- Sempre respeite os direitos autorais e termos de uso
- O script cria uma pasta nova para cada clonagem com timestamp
