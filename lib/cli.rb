class CLI
  
  def menu
    API.get_beers
    puts ""
    puts "------------------------------------------"
    puts "Welcome to the Punk Brewdog Recipe Catalog"
    puts "------------------------------------------"
    puts ""
    print_beers
    puts "-----------------------------------------------------------------------------------"
    puts "Enter a number to learn more about a beer you would like to brew or 'exit' to exit."
    puts ""
    input = gets.strip
    while input != "exit" do
        if input.to_i > 0 && input.to_i <= 25
          beer = Beer.all[input.to_i-1]
          print_beer(beer)
        input = gets.strip
        elsif input != input.to_i || input.to_i <= 0 || input.to_i > 25
          puts ""
          puts "----------------------------------------------------------------------------------------------------------"
          puts "If you would like to see the list of beers again, enter 'beers' or enter a different number to learn another beer."
          puts ""
          input = gets.strip.downcase
          if input == "beers"
            print_beers
          input = gets.strip
          elsif input.to_i > 0 && input.to_i <= 25
            print_beer(beer)
          input = gets.strip
          elsif input != "exit" || input.to_i <= 0 || input.to_i > 25
            puts ""
            puts "--------------------------------------------------------"
            puts "We can't find what you're looking for. Please try again."
            puts ""
          end
        else
          prompt
          input = gets.strip
        end
    end
    puts ""
    puts "-----------------------------------------"
    puts "Come again if you want to make more beer!"
    puts "-----------------------------------------"
    puts ""
  end
  
    def prompt
      puts ""
      puts "------------------------------------------------"
      puts "Enter another number to view a different recipe, or enter 'exit' to exit."
      puts ""
    end
  
    def print_beers
      Beer.all.each_with_index do |beer, i|
        puts "#{i+1}. #{beer.name}"
      end
    end
    
    def print_beer(beer)
      puts "Name: #{beer.name}"
      puts ""
      puts "Tagline: #{beer.tagline}"
      puts ""
      puts "First Brewed: #{beer.first_brewed}"
      puts ""
      puts "Description: #{beer.description}"
      puts ""
      puts "Alcohol By Volume: #{beer.abv}"
      puts ""
      puts "Bitterness(IBU): #{beer.ibu}"
      puts ""
      puts "ph: #{beer.ph}"
      puts ""
      puts "Ingredients: #{beer.ingredients}"
      puts ""
    end
end