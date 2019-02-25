require "rails_helper"

describe 'As a user' do
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

  it 'I can get advice with a topic' do

    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

    expect(page).to have_content("Please enter a vaild topic to recive advice.")

    fill_in :advice_topic, with: "friends"

    click_on "Get Advice"

    expect(page).not_to have_content("Please enter a vaild topic to recive advice.")
    expect(current_path).to eq(dashboard_path)

    fill_in :advice_topic, with: "dvwjrhberqkhjebffe"

    click_on "Get Advice"

    expect(page).to have_content("Please enter a vaild topic to recive advice.")
  end

  it 'I can get random advice' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

    expect(page).to have_content("Click here to get random advice")

    click_on "Get Random Advice"

    expect(page).not_to have_content("Click here to get random advice")
  end
end
