require 'rails_helper'

describe 'AdviceService' do
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
    end
  end
end
