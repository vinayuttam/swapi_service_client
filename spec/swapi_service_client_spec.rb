RSpec.describe SwapiServiceClient do
  class Rails
  end

  let (:mock_faraday_instance) { double('Faraday::Connection') }

  before do
    allow(Rails).to receive(:logger)
    allow(Faraday).to receive(:new).and_return(mock_faraday_instance)
  end

  let (:client) { SwapiServiceClient::Client.new({ base_url: 'http://example.com' }) }

  describe '#initialize' do
    it 'should initialize the client with swapi_client attribute' do
      expect(client.send(:swapi_client)).to eq(mock_faraday_instance)
    end
  end
end
