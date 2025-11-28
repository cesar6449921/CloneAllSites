# ⚙️ Configuração de Exemplo
# Este arquivo mostra como você pode personalizar o comportamento do script

# URLs de exemplo para testar
EXAMPLE_URLS = [
  "https://example.com",
  "https://pt.wikipedia.org",
  "https://www.ruby-lang.org"
]

# Configurações que você pode adicionar ao script no futuro:

# Timeout para downloads (em segundos)
DOWNLOAD_TIMEOUT = 30

# User Agent personalizado
USER_AGENT = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36"

# Extensões de arquivo para baixar
ALLOWED_IMAGE_EXTENSIONS = ['.jpg', '.jpeg', '.png', '.gif', '.svg', '.webp']
ALLOWED_SCRIPT_EXTENSIONS = ['.js']
ALLOWED_STYLE_EXTENSIONS = ['.css']

# Diretórios de saída
OUTPUT_BASE_DIR = "cloned_sites"
CSS_DIR = "css"
JS_DIR = "js"
IMAGES_DIR = "images"

# Opções de download
DOWNLOAD_IMAGES = true
DOWNLOAD_SCRIPTS = true
DOWNLOAD_STYLES = true

# Verbose mode (mostrar mais informações)
VERBOSE = true

# Retry attempts (tentativas de download)
MAX_RETRIES = 3

# ============================================
# Como usar estas configurações:
# ============================================
# 
# 1. Copie as configurações que você quer usar
# 2. Adicione-as no início do arquivo clone_site.rb
# 3. Modifique o código para usar essas constantes
#
# Exemplo:
# def download_file(url, destination)
#   retries = 0
#   begin
#     content = URI.open(url, 
#       'User-Agent' => USER_AGENT,
#       read_timeout: DOWNLOAD_TIMEOUT
#     ).read
#     File.binwrite(destination, content)
#   rescue => e
#     retries += 1
#     retry if retries < MAX_RETRIES
#     raise e
#   end
# end
