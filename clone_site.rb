require 'nokogiri'
require 'open-uri'
require 'fileutils'
require 'uri'

class CloneSite
  def initialize(url)
    @url = url
    @base_uri = URI.parse(url)
    # Define a pasta base para os sites clonados
    @base_output_dir = "sites"
    FileUtils.mkdir_p(@base_output_dir)
    
    # Extrair o nome do domínio para usar na pasta (ex: google.com)
    domain = @base_uri.host.gsub(/^www\./, '')
    timestamp = Time.now.to_i
    
    # Define o diretório específico: sites/google.com_1234567890
    @output_dir = File.join(@base_output_dir, "#{domain}_#{timestamp}")
  end

  def clone
    puts "🚀 Iniciando clonagem do site: #{@url}"
    puts "📁 Salvando em: #{@output_dir}"
    
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
      File.write("#{@output_dir}/index.html", doc.to_html)
      
      puts "✅ Clonagem concluída com sucesso!"
      puts "📂 Arquivos salvos em: #{File.expand_path(@output_dir)}"
      
    rescue => e
      puts "❌ Erro durante a clonagem: #{e.message}"
      puts e.backtrace.join("\n")
    end
  end

  private

  def download_page(url)
    puts "📥 Baixando página principal..."
    URI.open(url).read
  end

  def download_stylesheets(doc)
    puts "🎨 Baixando arquivos CSS..."
    doc.css('link[rel="stylesheet"]').each_with_index do |link, index|
      href = link['href']
      next unless href
      
      begin
        css_url = resolve_url(href)
        filename = "style_#{index}.css"
        download_file(css_url, "#{@output_dir}/css/#{filename}")
        link['href'] = "css/#{filename}"
        puts "  ✓ #{filename}"
      rescue => e
        puts "  ✗ Erro ao baixar CSS: #{href} - #{e.message}"
      end
    end
  end

  def download_scripts(doc)
    puts "📜 Baixando arquivos JavaScript..."
    doc.css('script[src]').each_with_index do |script, index|
      src = script['src']
      next unless src
      
      begin
        js_url = resolve_url(src)
        filename = "script_#{index}.js"
        download_file(js_url, "#{@output_dir}/js/#{filename}")
        script['src'] = "js/#{filename}"
        puts "  ✓ #{filename}"
      rescue => e
        puts "  ✗ Erro ao baixar JS: #{src} - #{e.message}"
      end
    end
  end

  def download_images(doc)
    puts "🖼️  Baixando imagens..."
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
        puts "  ✓ #{filename}"
      rescue => e
        puts "  ✗ Erro ao baixar imagem: #{src} - #{e.message}"
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
  puts "=" * 60
  puts "🌐 CLONADOR DE SITES - Ruby Edition"
  puts "=" * 60
  puts ""
  
  # Você pode alterar a URL aqui ou passar como argumento
  site_url = ARGV[0] || "https://example.com"
  
  clone_site = CloneSite.new(site_url)
  clone_site.clone
  
  puts ""
  puts "=" * 60
end
