class Drink

    attr_accessor :name, :ingredients, :instructions
         
    @@all = []
  def initialize(name:, ingredients:, instructions:)
      self.name = name
      self.ingredients = ingredients
      self.instructions = instructions

      self.save 
  end 

  def save
    @@all << self
  end 

  def self.all
    @@all
  end 
end 
