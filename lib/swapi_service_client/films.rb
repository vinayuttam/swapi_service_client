require 'swapi_service_client/types/film_list'
require 'swapi_service_client/types/film'

module SwapiServiceClient
  module Films
    def get_films(options = {})
      path = 'films'
      params = { query_params: options }
      SwapiServiceClient::Types::FilmList.new(make_get_request(path, params))
    end

    def get_film(film_id)
      path = 'films/{film_id}'
      params = { film_id: film_id }
      SwapiServiceClient::Types::Film.new(make_get_request(path, params))
    end
  end
end
