require 'nokogiri'
require 'open-uri'
require 'fileutils'
require 'uri'

require 'json'

class CloneSite
  def initialize(url, options = {})
    @url = url
    @base_uri = URI.parse(url)
    @options = options
    
    # Define a pasta base para os sites clonados
    @base_output_dir = "sites"
    FileUtils.mkdir_p(@base_output_dir)
    
    # Extrair o nome do domínio para usar na pasta (ex: google.com)
    domain = @base_uri.host.gsub(/^www\./, '')
    timestamp = Time.now.to_i
    
    # Define o diretório específico: sites/google.com_1234567890
    @output_dir = File.join(@base_output_dir, "#{domain}_#{timestamp}")
    
    @stats = {
      css: 0,
      js: 0,
      images: 0
    }
  end

  def log(message)
    puts message unless @options[:json]
  end

  def clone
    log "🚀 Iniciando clonagem do site: #{@url}"
    log "📁 Salvando em: #{@output_dir}"
    
    # Criar diretório de saída
    FileUtils.mkdir_p(@output_dir)
    FileUtils.mkdir_p("#{@output_dir}/css")
    FileUtils.mkdir_p("#{@output_dir}/js")
    FileUtils.mkdir_p("#{@output_dir}/images")
    
    begin
      # Baixar e processar o HTML
      html_content = download_page(@url)
      doc = Nokogiri::HTML(html_content)
      
      # Baixar recursos (CSS, JS, imagens)
      download_stylesheets(doc)
      download_scripts(doc)
      download_images(doc)
      
      # Salvar HTML modificado
      main_file = "#{@output_dir}/index.html"
      File.write(main_file, doc.to_html)
      
      log "✅ Clonagem concluída com sucesso!"
      log "📂 Arquivos salvos em: #{File.expand_path(@output_dir)}"
      
      if @options[:json]
        result = {
          status: "success",
          original_url: @url,
          local_path: File.expand_path(@output_dir),
          main_file: File.expand_path(main_file),
          stats: @stats,
          timestamp: Time.now.to_s
        }
        puts result.to_json
      end
      
    rescue => e
      if @options[:json]
        error_result = {
          status: "error",
          message: e.message,
          backtrace: e.backtrace.first(5)
        }
        puts error_result.to_json
      else
        puts "❌ Erro durante a clonagem: #{e.message}"
        puts e.backtrace.join("\n")
      end
    end
  end

  private

  def download_page(url)
    log "📥 Baixando página principal..."
    URI.open(url).read
  end

  def download_stylesheets(doc)
    log "🎨 Baixando arquivos CSS..."
    doc.css('link[rel="stylesheet"]').each_with_index do |link, index|
      href = link['href']
      next unless href
      
      begin
        css_url = resolve_url(href)
        filename = "style_#{index}.css"
        download_file(css_url, "#{@output_dir}/css/#{filename}")
        link['href'] = "css/#{filename}"
        log "  ✓ #{filename}"
        @stats[:css] += 1
      rescue => e
        log "  ✗ Erro ao baixar CSS: #{href} - #{e.message}"
      end
    end
  end

  def download_scripts(doc)
    log "📜 Baixando arquivos JavaScript..."
    doc.css('script[src]').each_with_index do |script, index|
      src = script['src']
      next unless src
      
      begin
        js_url = resolve_url(src)
        filename = "script_#{index}.js"
        download_file(js_url, "#{@output_dir}/js/#{filename}")
        script['src'] = "js/#{filename}"
        log "  ✓ #{filename}"
        @stats[:js] += 1
      rescue => e
        log "  ✗ Erro ao baixar JS: #{src} - #{e.message}"
      end
    end
  end

  def download_images(doc)
    log "🖼️  Baixando imagens..."
    doc.css('img[src]').each_with_index do |img, index|
      src = img['src']
      next unless src
      
      begin
        img_url = resolve_url(src)
        ext = File.extname(URI.parse(img_url).path)
        ext = '.jpg' if ext.empty?
        filename = "image_#{index}#{ext}"
        download_file(img_url, "#{@output_dir}/images/#{filename}")
        img['src'] = "images/#{filename}"
        log "  ✓ #{filename}"
        @stats[:images] += 1
      rescue => e
        log "  ✗ Erro ao baixar imagem: #{src} - #{e.message}"
      end
    end
  end

  def resolve_url(path)
    # Resolver URLs relativas para absolutas
    uri = URI.parse(path)
    if uri.relative?
      @base_uri.merge(path).to_s
    else
      path
    end
  rescue
    @base_uri.merge(path).to_s
  end

  def download_file(url, destination)
    content = URI.open(url, 'User-Agent' => 'Mozilla/5.0').read
    File.binwrite(destination, content)
  end
end

# Exemplo de uso
if __FILE__ == $0
  # Verificar flags
  options = {}
  args = ARGV.dup
  
  if args.include?('--json')
    options[:json] = true
    args.delete('--json')
  end

  site_url = args[0]
  
  if site_url
    clone_site = CloneSite.new(site_url, options)
    clone_site.clone
  else
    unless options[:json]
      puts "=" * 60
      puts "🌐 CLONADOR DE SITES - Ruby Edition"
      puts "=" * 60
      puts ""
      puts "Uso: ruby clone_site.rb <URL> [--json]"
      puts ""
      puts "=" * 60
    end
  end
end
