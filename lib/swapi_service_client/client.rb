require 'swapi_service_client/types/people_list'
require 'swapi_service_client/types/person'

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
        faraday.response :json, parser_options: { symbolize_names: true }

        # Adapter has to be defined after middleware
        faraday.adapter Faraday.default_adapter
      end
    end

    def get_people(options = {})
      path = 'people'
      params = { query_params: options }
      SwapiServiceClient::Types::PeopleList.new(make_get_request(path, params))
    end

    def get_person(person_id)
      path = 'people/{person_id}'
      params = { person_id: person_id }
      SwapiServiceClient::Types::Person.new(make_get_request(path, params))
    end

    private

    attr_reader :swapi_client

    def make_get_request(path, params = {})
      request_uri = Addressable::Template.new("#{path}/{?query_params*}")
      request_uri = request_uri.expand(params).to_s
      response = swapi_client.get("#{request_uri}").body
    end
  end
end
