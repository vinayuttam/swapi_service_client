require 'swapi_service_client/types/person'

module SwapiServiceClient
  module Types
    class PeopleList < Base

      attribute :count, Dry.Types::Coercible::Integer
      attribute :next, Dry.Types::Coercible::String
      attribute :previous, Dry.Types::Coercible::String
      attribute :results, Dry.Types::Coercible::Array.of(SwapiServiceClient::Types::Person)

    end
  end
end
