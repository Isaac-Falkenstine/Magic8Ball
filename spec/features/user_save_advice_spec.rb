require "rails_helper"

describe 'As a user' do
  it 'I can get advice with a topic and save it' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

    expect(User.last.advices.length).to eq(0)

    fill_in :advice_topic, with: "Friends"

    click_on "Get Advice"
    click_on "Save Advice"

    expect(page).to have_content("Advice Saved!")
    expect(User.last.advices.length).to eq(1)
    expect(User.last.advices.first.body).to be_a(String)
    expect(current_path).to eq(dashboard_path)
  end

  it 'I can get random advice and save it' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

    expect(User.last.advices.length).to eq(0)

    click_on "Get Random Advice"
    click_on "Save Random Advice"

    expect(page).to have_content("Advice Saved!")
    expect(User.last.advices.length).to eq(1)
    expect(User.last.advices.first.body).to be_a(String)
    expect(current_path).to eq(dashboard_path)
  end
end
