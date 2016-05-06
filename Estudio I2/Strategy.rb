class Informe
  def initialize(formatter)
    @title = "Informe"
    @text = "Todo va bien"
    @formatter = formatter
  end
  def crear_informe()
    @formatter.crear_informe(@title,@text)
  end
end

class HTMLformatter
  def crear_informe(title, content)
    puts "<html>"
    puts "<head>"
    puts "</head>"
    puts "<body>"
    puts "<h1>#{title}</h1>"
    puts "#{content}"
    puts "</body>"
    puts "</html>"
  end
end

class TXTformatter
  def crear_informe(title, content)
    puts "*******#{title}*******"
    puts "#{content}"
  end
end

reporte_html = Informe.new(HTMLformatter.new)
reporte_txt = Informe.new(TXTformatter.new)
print(reporte_html.crear_informe())
print(reporte_txt.crear_informe())
