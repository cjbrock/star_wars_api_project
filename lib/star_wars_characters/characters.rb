class StarWarsCharacters::Characters
  attr_reader :character_name, :films

  

  def self.initialize(character_name)
    @character_name = character_name
    @films = get_films
    @@all << self
  end
end
