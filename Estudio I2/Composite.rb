class Component
  def initialize(price, *args)
    $price = price
    $parts = []
    args.each do |x|
      $parts.push(x)
    end
  end
  def total_price
    price = $price
    $parts.each do |x|
      price += x.price
    return price
    end
  end
end

class Escritorio < Component
  def initialize(price)
    super(price)
  end
end

class Cama < Component
  def initialize(price)
    super(price)
  end
end

class Pieza < Component
  def initialize(price)
    @cama = Cama.new(200)
    @escritorio = Escritorio.new(300)
    super(price, @cama,@escritorio)
  end
end

p = Pieza.new(500)
print(p.total_price)
