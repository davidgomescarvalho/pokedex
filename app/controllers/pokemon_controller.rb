class PokemonController < ApplicationController
  def show
    @pokemon = PokeApiService.new.fetch_pokemon(params[:name])
  rescue StandardError => e
    render plain: e.message, status: :bad_request
  end

  def index
    @pokemons = PokeApiService.new.fetch_pokemon_list(params[:limit], params[:offset])
  rescue StandardError => e
    render plain: e.message, status: :bad_request
  end
end
