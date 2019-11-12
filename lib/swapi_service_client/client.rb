require 'swapi_service_client/people'

module SwapiServiceClient
  class Client
    include SwapiServiceClient::People

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
        faraday.use :instrumentation

        # Adapter has to be defined after middleware
        faraday.adapter Faraday.default_adapter
      end
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
