require 'addressable/uri'
require 'swapi_service_client/types/people_list'

module SwapiServiceClient
  class Client
    DEFAULT_HEADERS = {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    }

    # Public: Initialize the service client with configuration object
    #
    # options - The Hash options used to initialize the client
    #           :base_url  - The String URL for the SWAPI.
    def initialize(config)
      @swapi_client = Faraday.new(url: config[:base_url], headers: DEFAULT_HEADERS) do |faraday|
        faraday.request :url_encoded
        faraday.response :logger, Rails.logger, { headers: false, bodies: false }

        # Adapter has to be defined after middleware
        faraday.adapter Faraday.default_adapter
      end
    end

    def get_people(options = {})
      addressable = Addressable::URI.new
      addressable.query_values = options
      SwapiServiceClient::Types::PeopleList.new(JSON.parse(swapi_client.get("people/?#{addressable.query}").body))
    end

    private

    attr_reader :swapi_client
  end
end
