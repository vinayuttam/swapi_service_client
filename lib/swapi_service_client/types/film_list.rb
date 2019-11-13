require 'swapi_service_client/types/film'

module SwapiServiceClient
  module Types
    class FilmList < Base

      attribute :count, Dry.Types::Coercible::Integer
      attribute :next, Dry.Types::Coercible::String
      attribute :previous, Dry.Types::Coercible::String
      attribute :results, Dry.Types::Coercible::Array.of(SwapiServiceClient::Types::Film)

    end
  end
end
