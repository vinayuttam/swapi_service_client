require 'swapi_service_client/types/base'

module SwapiServiceClient
  module Types
    class Film < Base

      attribute :title, Dry.Types::Coercible::String
      attribute :episode_id, Dry.Types::Coercible::Integer
      attribute :opening_crawl, Dry.Types::Coercible::String
      attribute :director, Dry.Types::Coercible::String
      attribute :producer, Dry.Types::Coercible::String
      attribute :release_date, Dry.Types::Coercible::String
      attribute :species, Dry.Types::Coercible::Array.of(Dry.Types::Coercible::String)  
      attribute :characters, Dry.Types::Coercible::Array.of(Dry.Types::Coercible::String)
      attribute :starships, Dry.Types::Coercible::Array.of(Dry.Types::Coercible::String)
      attribute :vehicles, Dry.Types::Coercible::Array.of(Dry.Types::Coercible::String)
      attribute :planets, Dry.Types::Coercible::Array.of(Dry.Types::Coercible::String)
      attribute :url, Dry.Types::Coercible::String
      attribute :created, Dry.Types::Coercible::String
      attribute :edited, Dry.Types::Coercible::String
    end
  end
end
