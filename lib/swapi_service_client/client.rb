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
    def initialize(config = {})
      @base_url = config[:base_url]
    end
  end
end
