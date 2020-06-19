class Cli 
    def run
        welcome
        main_menu
        good_bye      
    end
  ################################ MAIN METHODS ######################################
    def welcome #woot woot
        puts "Hello! Welcome to The Cyber Lounge!!".green.bold
        puts "------------------------"
        puts "Please hold, while we prep your meal and cocktail recipe selections... "
        puts "------------------------"
    end 
    sleep 2

    def good_bye #woot woot
        puts "------------------------"
        puts "Your meal and drink choices have been selected! Thank you for visiting Cyber Lounge!".bold.green
        puts "------------------------"
    end
    
    def main_menu
        puts "Would you like to view the Food Menu or the Cocktail Menu?"
        puts "To exit the Cyber Lounge, you may type 'leave'."
        puts ""
        puts "Enter 'Food' or 'Cocktail'".bold
        user_input = gets.strip
        
        if user_input.downcase == "food"
            puts "Prepping meals...".bold.yellow
            sleep 2
            print_recipes
            main_menu
        elsif 
            user_input.downcase == "cocktail"
            puts "Grab a glass...".bold.magenta
            sleep 2
            print_cocktails
            puts ""
            puts "To view more drink selections simply type 'next'!".bold.green
            main_menu
        elsif user_input.downcase == "menu"
            sleep 2
             main_menu
        elsif 
            user_input.downcase == "leave"
            good_bye
            exit
        elsif user_input.downcase == "next"
            sleep 1
            puts "Happy Hour...starts now!".bold.magenta
            print_cocktails
            puts ""
            puts "To view more drink selections simply type 'next'!".bold.green

            main_menu
        else 
            invalid_input
            main_menu
        end 
    end 
 ################################### HELPER METHODS ################################
    def invalid_input
            puts "Uh oh! It seems you've entered an invalid option! Please try again.".bold.yellow
    end     

    def print_recipes #woot woot
        MEALS.get_recipes
        puts  " __________________".bold.cyan
        puts "|  ___   ___   ___  |".bold.magenta
        puts "| |___  |___|   |   |".bold.cyan
        puts "| |___  |   |   |   |".bold.magenta
        puts  " -------------------".bold.cyan
         sleep 2
        Recipe.all.each.with_index(1) do |recipes_data, index|
          puts ""
          puts "#{index}. #{recipes_data.title}".magenta.bold
          puts ""
          puts "Ingredients: #{recipes_data.ingredients}"
          puts ""
          puts "Link to recipe: #{recipes_data.href}.".light_blue
          puts "______________________________"
          
        end
    end 

   def print_cocktails#woot woot
        COCKTAILS.get_cocktails
            sleep 2
        Drink.all.each.with_index(1) do |drinks_data, index|
            puts 
            puts "#{index}. #{drinks_data.name}".magenta.bold
            puts "Ingredients: #{drinks_data.ingredients}".bold
            puts ""
            puts "#{drinks_data.instructions}".cyan
            puts "_____________________________"   
      end 
    end 
end