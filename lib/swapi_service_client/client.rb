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
        faraday.adapter Faraday.default_adapter
      end
    end

    def get_people
      SwapiServiceClient::Types::PeopleList.new(JSON.parse(swapi_client.get("people/").body))
    end

    private

    attr_reader :swapi_client
  end
end
