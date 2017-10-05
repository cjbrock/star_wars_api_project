class StarWarsCharacters::CLI
  def call
    puts "Welcome to the Star Wars Character Gem!"
    list_characters
    menu
    goodbye
  end

  def list_characters
    puts <<-DOC
    1. Luke
    2. Leia
    3. Han
    4. C3PO
    5. R2D2
    6. Boba Fett
    7. Chewy
    8. Storm Troopers
    9. Ren
    10. Jarjar Binks
    DOC
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the character that you would like more information on."
      input = gets.strip
      case input
      when "1"
        StarWarsCharacters::API.character_list
      when "2"
        puts "more info on Leia"
      when 'list'
        list_characters
      end
    end
  end

  def goodbye
    puts "Live long and prosper."
  end
end
