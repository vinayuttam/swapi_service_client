require 'swapi_service_client/types/base'

module SwapiServiceClient
  module Types
    class Person < Base

      attribute :name, Dry.Types::Coercible::String
      attribute :height, Dry.Types::Coercible::String
      attribute :mass, Dry.Types::Coercible::String
      attribute :hair_color, Dry.Types::Coercible::String
      attribute :skin_color, Dry.Types::Coercible::String
      attribute :eye_color, Dry.Types::Coercible::String

    end
  end
end
