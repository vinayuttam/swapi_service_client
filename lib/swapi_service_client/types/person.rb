require 'swapi_service_client/types/base'

module SwapiServiceClient
  module Types
    class Person < Base

      attribute :name, Dry.Types::Coercible::String
      attribute :birth_year, Dry.Types::Coercible::String
      attribute :eye_color, Dry.Types::Coercible::String
      attribute :gender, Dry.Types::Coercible::String
      attribute :hair_color, Dry.Types::Coercible::String
      attribute :height, Dry.Types::Coercible::Integer
      attribute :mass, Dry.Types::Coercible::Integer
      attribute :skin_color, Dry.Types::Coercible::String
      attribute :homeworld, Dry.Types::Coercible::String
      attribute :films, Dry.Types::Coercible::Array.of(Dry.Types::Coercible::String)
      attribute :species, Dry.Types::Coercible::Array.of(Dry.Types::Coercible::String)
      attribute :vehicles, Dry.Types::Coercible::Array.of(Dry.Types::Coercible::String)
      attribute :url, Dry.Types::Coercible::String
      attribute :created, Dry.Types::Coercible::String
      attribute :edited, Dry.Types::Coercible::String
    end
  end
end
