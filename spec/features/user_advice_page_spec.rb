require "rails_helper"

describe 'As a user' do
  it 'I can go to the advice page and see my saved advice' do
    user = create(:user)
    advice = create(:advice, user_id: user.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path
    click_on "Advice Page"

    expect(current_path).to eq(advice_path)

    expect(page).to have_content("If You Attempt to Rob a Bank, You Will Have No Trouble with Rent or Bills for the Next Ten Years, Whether You Are Successful or Not")
    expect(page).to have_content("Advice Saved on ")
  end
end
