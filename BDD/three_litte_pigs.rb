class Pig
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def build_house
    case name
    when 'first litte pig'
      @house = House.new(Straw.new)
    when 'second litte pig'
      @house = House.new(Stick.new)
    when 'third litte pig'
      @house = House.new(Brick.new)
    end
  end
end


class House
  attr_accessor :material

  def initialize(material)
    @material = material
  end

  def destroy?(wind_power = 1)
    material.wind_resistance_ability <= wind_power ? true : false
  end
end

class Wolf
  def blow(wind_power = 1)
    wind_power
  end
end

class Material
  attr_accessor :wind_resistance_ability
end

class Straw < Material
  def initialize
    @wind_resistance_ability = 1
  end
end

class Stick < Material
  def initialize
    @wind_resistance_ability = 2
  end
end

class Brick < Material
  def initialize
    @wind_resistance_ability = 999
  end
end