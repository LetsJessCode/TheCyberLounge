class Recipe
    attr_accessor :title, :ingredients, :href
        
    @@all = []
    def initialize(title:, ingredients:, href:)
        @title = title
        @ingredients = ingredients
        @href = href

        self.save
    end
    
    def save
        @@all << self
    end 

    def self.all
        @@all
    end 
end 