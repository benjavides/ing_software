class Informe
  def initialize
    @title = "Informe"
    @text = "Todo va bien"
  end
  def crear_informe()
    header()
    body()
    footer()
  end
  def header()
  end
  def body()
  end
  def footer()
  end
end

class InformeHTML < Informe
  def header()
    puts "<html>"
    puts "<head>"
    puts "</head>"
  end
  def body()
    puts "<body>"
    puts "<h1>#{@title}</h1>"
    puts "#{@text}"
    puts "</body>"
  end
  def footer()
    puts "</html>"
  end
end

class InformeTxt < Informe
  def header()
    puts "*******#{@title}*******"
  end
  def body()
    puts "#{@text}"
  end
  def footer()
  end
end
reporte_html = InformeHTML.new
reporte_txt = InformeTxt.new
print(reporte_html.crear_informe())
print(reporte_txt.crear_informe())
