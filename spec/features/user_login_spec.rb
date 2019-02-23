require "rails_helper"

describe 'As a visitor' do
  it 'I can login' do

    password = "password"

    visit '/'
    click_on "Log In"

    expect(current_path).to eq(login_path)

    fill_in 'session[email]', with: "isaac@email.com"
    fill_in 'session[password]', with: password

    click_on "Log In"

    expect(page).to have_content("Welcome Isaac Falkenstine!")
    expect(current_path).to eq(dashboard_path)
  end
end
