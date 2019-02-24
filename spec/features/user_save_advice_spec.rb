require "rails_helper"

describe 'As a user' do
  it 'I can get advice with a topic and save it' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

    fill_in :advice_topic, with: "Friends"

    click_on "Get Advice"
    click_on "Save Advice"


    expect(page).to have_content("Advice Saved!")
    expect(User.last.advices).to be_a(Array)
    expect(User.last.advices.first.body).to be_a(String)
    expect(current_path).to eq(dashboard_path)
  end
end
