require "rails_helper"

describe 'As a user' do
  it 'I can get advice with a topic' do

    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

    expect(page).to have_content("Please enter a vaild topic to recive advice.")

    fill_in :advice_topic, with: "Friends"

    click_on "Get Advice"

    expect(page).not_to have_content("Please enter a vaild topic to recive advice.")
    expect(current_path).to eq(dashboard_path)

    fill_in :advice_topic, with: "dvwjrhberqkhjebffe"

    click_on "Get Advice"

    expect(page).to have_content("Please enter a vaild topic to recive advice.")
  end
end
