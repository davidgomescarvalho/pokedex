require 'httparty'

class PokeApiService
  include HTTParty
  base_uri 'https://pokeapi.co/api/v2'

  def fetch_pokemon(name)
    response = self.class.get("/pokemon/#{name}")
    if response.success?
      response.parsed_response
    else
      raise "Error fetching Pokémon: #{response.message}"
    end
  end

  def fetch_pokemon_list(limit = 20, offset = 0)
    response = self.class.get("/pokemon", query: { limit: limit, offset: offset })
    if response.success?
      response.parsed_response
    else
      raise "Error fetching Pokémon list: #{response.message}"
    end
  end
end
