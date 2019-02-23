require "rails_helper"

describe 'As a user' do
  it 'I can get advice with a topic' do

    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path

    fill_in 'advice_form', with: "Friends"

    click_on "Get Advice"

    expect(page).to have_content("Once you find a really good friend don't do anything that could mess up your friendship.")
    expect(current_path).to eq(dashboard_path)
  end
end
