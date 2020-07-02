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
    
    def main_menu #woot woot
        puts "Would you like to view the Food Menu or the Cocktail Menu?"
        puts "To exit the Cyber Lounge, you may type 'leave'."
        puts ""
        puts "Enter 'Food' or 'Cocktail'".bold
        user_input = gets.strip
       
        if user_input.downcase == "food"
            puts "Prepping meals...".bold.yellow
            sleep 1
            print_recipes
            main_menu
        elsif user_input.downcase == "cocktail"
            puts "Grab a glass...".bold.magenta
            sleep 1
                print_cocktails
                sleep 1
                puts "Type the number of your drink selection".bold.yellow
                puts "Type 'Next' for more drinks".bold.green
                puts "Type 'Menu' to view Main Menu".bold.blue
                user_input = gets.strip
                display_drink_options(user_input) 
            elsif user_input.downcase == "menu"
                sleep 1
                main_menu
            elsif 
                user_input.downcase == "leave"
                good_bye
                exit
            else 
                invalid_input
                main_menu     
        end 
    end
 ################################### HELPER METHODS ################################
    def display_drink_options(user_input) #woot woot
            if user_input.downcase == "next"
                puts "Generating new drink menu!".bold.yellow
                sleep 1
                next_drinks
            elsif user_input.downcase == "menu"
                sleep 1
                main_menu
            elsif user_input.to_i > 0 && user_input.to_i <= Drink.all.length
                input_num = user_input.to_i          
                index_of_drink = input_num - 1
                print_drink(index_of_drink)
                sleep 1
                puts "To select another drink enter another number".bold.yellow
                puts "Type 'Next' for more drink selections".bold.green
                puts "Type 'Menu' to view Main Menu".bold.blue
                user_input = gets.strip
                display_drink_options(user_input)
            else 
                invalid_input
                sleep 1
                puts "Type the number of your drink selection".bold.yellow
                puts "Type 'Menu' to view Main Menu".bold.blue
                user_input = gets.strip
                display_drink_options(user_input)
            end 
        end

    def invalid_input #woot woot
            puts "Uh oh! It seems you've entered an invalid option! Please try again.".bold.yellow
    end   

    def next_drinks #woot woot
        Drink.clear_drinks
        print_cocktails     
        puts "Type the number of your drink selection".bold.yellow
        puts  "Type 'Next' for more drink selections".bold.green
        puts "Type 'Menu' to view Main Menu".bold.blue
        user_input = gets.strip
        if user_input.downcase == "next"
            next_drinks
        elsif user_input.downcase == "menu"
            sleep 1
            main_menu
        elsif  user_input.to_i > 0 && user_input.to_i <= Drink.all.length
            input_num = user_input.to_i          
            index_of_drink = input_num - 1
            print_drink(index_of_drink)
            sleep 1
            puts "To select another drink enter another number".bold.yellow
            puts "Type 'Next' for more drink selections".bold.green
            puts "Type 'Menu' to view Main Menu".bold.blue
            user_input = gets.strip
            display_drink_options(user_input)
        else
            invalid_input
            sleep 1
            puts "Please enter the number of the drink you wish to select.".bold.magenta 
            user_input = gets.strip
            display_drink_options(user_input)
        end
    end

    def print_recipes #woot woot
        if Recipe.all.length != 10
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
    end

   def print_cocktails#woot woot
         COCKTAILS.get_cocktails
            sleep 2
        Drink.all.each.with_index(1) do |drink, index|
            puts 
            puts "#{index}. #{drink.name}".magenta.bold
            end 
        end  

    def print_drink(index) #woot woot
        drink = Drink.all[index]
        puts  "#{drink.name}".magenta.bold
        puts "_____________________________"         
        puts "Ingredients: #{drink.ingredients}".bold
        puts ""
        puts "#{drink.instructions}".cyan
        puts "_____________________________"         
        puts ""   
    end
end   
