class WriteSimple
  def initialize(path)
    $path = path
    $file = File.open($path, "a+")
  end
  def write_line(line)
    $file.puts(line)
  end
end

class DecorateLineNumber
  def initialize(original)
    $original = original #writeSimple original
    $line_number = 1
  end
  def write_line(line)
    $original.write_line("#{$line_number} #{line}")
    $line_number += 1
  end
end

simple = WriteSimple.new("test.txt")
simple.write_line("Linea en el escritor simple")
decorated = DecorateLineNumber.new(simple)
decorated.write_line("Linea en el escritor decorado")
decorated.write_line("Otra Linea en el escritor decorado")
