require 'swapi_service_client/types/people_list'
require 'swapi_service_client/types/person'

module SwapiServiceClient
  module People
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
  end
end
