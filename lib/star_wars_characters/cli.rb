class StarWarsCharacters::CLI
  def call
    StarWarsCharacters::API.character_list
    puts "Welcome to the Star Wars Character Gem!"
    menu
    goodbye
  end

  def menu
    input = nil
    puts "------ Please choose a character's number. ------"
    list_characters
    input = gets.strip.downcase
    #if input == exit, then exit
    #send input to integer
    #if input is 1-10, show character
    #if not, then show error message, and go back to menu
    if input == "exit"
      goodbye
    else
      its = input.to_i
      if its != 0
        char_input = StarWarsCharacters::Characters.find(its)
        character_details(char_input)
        puts "Would you like to see information for another character?"
        ac = gets.strip.downcase
        if ac == "yes" || ac == "y"
          menu
        else
          goodbye
        end
      else
        puts "I don't understand that selection."
        puts "Please select a character's number, or type exit to leave the program."
        menu
      end
    end
  end

  def goodbye
    puts "Live long and prosper."
    exit
  end

  def list_characters
    StarWarsCharacters::Characters.all.each.with_index(1) do |char, index|
      puts "#{index}. #{char.character_name}"
    end
  end

  def character_details(char_input)
    puts "_____#{char_input.character_name}_____"
    puts "Homeworld: #{char_input.homeworld}"
    puts "Gender: #{char_input.gender}"
  end

end
