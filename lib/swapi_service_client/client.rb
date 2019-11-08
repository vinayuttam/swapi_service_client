require './people_list'

module SwapiServiceClient
  class Person
    def initialize(person)
      @name = person.name
      @height = person.height
      @hair_color = person.hair_color
      @gneder = person.gender
    end

    private

    attr_reader :name, :height, :hair_color, :gender
  end

  class PeopleList

    def initialize(people)
      @people = people.map { |person| new Person.new(person) }
    end
  end

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
      puts 'get_people from client'
      # return PeopleList.new(swapi_client.get "people/").body.results)
    end

    private

    attr_reader :swapi_client
  end
end
