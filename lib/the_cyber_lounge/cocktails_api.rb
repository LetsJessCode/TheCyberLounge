class COCKTAILS
    BASE_URL = "https://www.thecocktaildb.com/api/json/v2/9973533/randomselection.php/"

 def self.get_cocktails #woot woot
        response = RestClient.get(BASE_URL)
        data = JSON.parse(response)  
        
        data["drinks"].each do |drink_data|
        name = drink_data["strDrink"]
        ingredients = COCKTAILS.get_ingredients(drink_data)
        instructions = drink_data["strInstructions"]
        drink = Drink.new(
            name: name,
            ingredients: ingredients,
            instructions: instructions
        )     
     end
   end 
      
 def self.get_ingredients(drink_data) #woot woot
    ingredients = []
    drink_data.each do |key, value|
        if key.include?("Ingredient") && value != nil 
           ingredients.push(value)
       end
    end
    ingredients.join(", ") 
 end  
 #array of strings/ array of ingredients
end 