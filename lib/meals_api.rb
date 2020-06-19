class MEALS
    BASE_URL ="http://www.recipepuppy.com/api/"

    def self.get_recipes
        response = RestClient.get(BASE_URL) 
        data = JSON.parse(response)
        
    data["results"].each do |recipes_data|
        title = recipes_data["title"]
        ingredients = recipes_data["ingredients"]
        href =  recipes_data["href"]
     Recipe.new(
         title: title,
         ingredients: ingredients,
         href: href)
    end 
   end
  end
 