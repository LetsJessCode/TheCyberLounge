class COCKTAILS
    BASE_URL = "https://www.thecocktaildb.com/api/json/v2/9973533/randomselection.php/"

 def self.get_cocktails #woot woot
        response = RestClient.get(BASE_URL)
        data = JSON.parse(response)  
        
        data["drinks"].each do |drinks_data|
        name = drinks_data["strDrink"]
        ingredients = COCKTAILS.get_ingredients(drinks_data)
        instructions = drinks_data["strInstructions"]
        drink = Drink.new(
            name: name,
            ingredients: ingredients,
            instructions: instructions
        )     
     end
   end 
      
 def self.get_ingredients(drinks_data) #woot woot
    ingredients = []
    drinks_data.each do |key, value|
        if key.include?("Ingredient") && value != nil 
           ingredients.push(value)
       end
    end
    ingredients 
 end  
 #array of strings/ array of ingredients
end 