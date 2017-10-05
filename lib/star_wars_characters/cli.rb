class StarWarsCharacters::CLI
  def call
    welcome
    character = get_character_from_user
    while character != 'exit'
      movies = get_movies(character)
      list(movies)
      character = get_character_from_user
    end
  end

  def welcome
    puts 'Welcome to the Star Wars API'
  end

  def get_character_from_user
    list_characters
    puts "Please enter a character or type 'exit' to quit"
    character = gets.strip.downcase
  end

  def get_movies(character)
    StarWarsCharacters::API.new(character)
  end

  def list(films)
    films.each.with_index(1) do |film, i|
      puts "#{i}. #{film['title']}"
    end
  end

  def list_characters
    StarWarsCharacters::API.characters.each.with_index do |char, index|
      puts "#{index}. #{char.character_name}"
    end
  end

end
  # def call
  #   puts "Welcome to the Star Wars Character Gem!"
  #   list_characters
  #   menu
  #   goodbye
  # end
  #
  # def list_characters
  #   puts <<-DOC
  #   1. Luke
  #   2. Leia
  #   3. Han
  #   4. C3PO
  #   5. R2D2
  #   6. Boba Fett
  #   7. Chewy
  #   8. Storm Troopers
  #   9. Ren
  #   10. Jarjar Binks
  #   DOC
  # end
  #
  # def menu
  #   input = nil
  #   while input != "exit"
  #     puts "Enter the number of the character that you would like more information on."
  #     input = gets.strip
  #     case input
  #     when "1"
  #       puts "more info on Luke"
  #     when "2"
  #       puts "more info on Leia"
  #     when 'list'
  #       list_characters
  #     else
  #       puts "Input unclear. Type list for a list of characters, or exit to exit the program."
  #     end
  #   end
  # end
  #
  # def goodbye
  #   puts "Live long and prosper."
  # end
