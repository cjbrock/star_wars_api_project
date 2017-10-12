class StarWarsCharacters::Characters
  attr_reader :character_name, :films
  @@all = []

  def self.new_from_json(char_info)
    self.new(
      char_info["name"],
      char_info["homeworld"],
      char_info["gender"]
    )
  end

  def initialize(character_name = nil, homeworld = nil, gender = nil)
    @character_name = character_name
    @homeworld = homeworld
    @gender = gender
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(char)
    self.all[char-1]
  end

  def gender
    @gender
  end

  def homeworld
    @homeworld
  end
end
