class PokemonController < ApplicationController
  DEFAULT_LIMIT = 20
  def show
    @pokemon = PokeApiService.new.fetch_pokemon(params[:name])
  rescue StandardError => e
    render plain: e.message, status: :bad_request
  end

  def index
    limit = params[:limit] ? params[:limit].to_i : DEFAULT_LIMIT
    offset = params[:offset] ? params[:offset].to_i : 0
    @pokemons = PokeApiService.new.fetch_pokemon_list(limit, offset)

    @next_offset = offset + limit
    @prev_offset = offset - limit >= 0 ? offset - limit : 0

  rescue StandardError => e
    render plain: e.message, status: :bad_request
  end
end
