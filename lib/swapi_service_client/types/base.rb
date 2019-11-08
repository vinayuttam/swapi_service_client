module SwapiServiceClient
  module Types
    include Dry.Types

    class Base < Dry::Struct
      transform_keys(&:to_sym)
    end
  end
end
