class StarWarsCharacters::API
  attr_accessor :character_hash, :characters


  def self.character_list
    characters = RestClient.get('https://swapi.co/api/people/')
    @character_hash = JSON.parse(characters)
    @character_hash["results"].each do |chars|
          StarWarsCharacters::Characters.new_from_json(chars)
    end
  end




end
