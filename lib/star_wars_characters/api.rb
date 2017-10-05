class StarWarsCharacters::API
  attr_reader :character_name, :films

  @@all = []

  def initialize(character_name)
    @character_name = character_name
    @films = get_films
  end

  def get_character_movies_from_api
    character = characters['results'].find {|character| character['name'].downcase == character_name.downcase }
  end

  def self.characters
    all_characters = RestClient.get('http://www.swapi.co/api/people/')
    character_hash = JSON.parse(all_characters)
    @@all << character_hash
    binding.pry
  end

  def show_character_movies(character)
    films_hash = get_character_movies_from_api(character)
    parse_character_movies(films_hash)
  end

  def get_films
    film_urls = character['films']
    film_urls.map do |url|
      film_data = RestClient.get(url)
      JSON.parse(film_data)
    end
  end

  def character

    characters['results'].find {|character| character['name'].downcase == character_name.downcase }
  end
end
