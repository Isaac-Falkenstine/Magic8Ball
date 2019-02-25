require 'rails_helper'

describe 'AdviceService' do
  before(:each) do
    stub_request(:get, "https://api.adviceslip.com/advice")
      .to_return(body: File.read("./spec/fixtures/random_advice_results.json"))

    stub_request(:get, "https://api.adviceslip.com/advice/search/friends").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v0.15.4'
           }).
    to_return(body: File.read("./spec/fixtures/friends_advice_results.json"))

  stub_request(:get, "https://api.adviceslip.com/advice/search/dvwjrhberqkhjebffe").
       with(
         headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'User-Agent'=>'Faraday v0.15.4'
         }).
      to_return(body: File.read("./spec/fixtures/invalid_advice_request.json"))
  end

  it "exists" do
    service = AdviceService.new

    expect(service).to be_a(AdviceService)
  end

  context "instance methods" do
    context "#search_results" do
      it "returns a array of advice objects" do
        service = AdviceService.new

        expect(service.search_results("friends")).to be_a(Hash)
        expect(service.search_results("friends")).to have_key(:total_results)
        expect(service.search_results("friends")).to have_key(:slips)
        expect(service.search_results("friends")[:slips].first).to have_key(:advice)
        expect(service.search_results("friends")[:slips].first).to have_key(:slip_id)
      end

      it "returns a invalid message" do
        service = AdviceService.new

        expect(service.search_results("dvwjrhberqkhjebffe")).to be_a(Hash)
        expect(service.search_results("dvwjrhberqkhjebffe")).to have_key(:message)
        expect(service.search_results("dvwjrhberqkhjebffe")[:message]).to have_key(:text)
        expect(service.search_results("dvwjrhberqkhjebffe")[:message][:text]).to eq("No advice slips found matching that search term.")
      end
    end

    context "#random_advice" do
      it "returns a array of advice objects" do
        service = AdviceService.new

        expect(service.random_advice).to be_a(Hash)
        expect(service.random_advice).to have_key(:slip)
        expect(service.random_advice[:slip]).to have_key(:advice)
        expect(service.random_advice[:slip][:advice]).to be_a(String)
      end
    end
  end
end
