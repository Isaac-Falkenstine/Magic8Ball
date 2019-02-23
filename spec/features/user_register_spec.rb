require "rails_helper"

describe 'As a visitor' do
  it 'I can register with a new email' do

    password = "password"

    visit '/'
    click_on "Register"

    expect(current_path).to eq(register_path)

    fill_in 'user[email]', with: "isaac@email.com"
    fill_in 'user[name]', with: "Isaac Falkenstine"
    fill_in 'user[password]', with: password
    fill_in 'user[password_confirmation]', with: password

    click_on "Register"

    expect(page).to have_content("Welcome Isaac Falkenstine!")
    expect(User.last.name).to eq("Isaac Falkenstine")
    expect(User.last.email).to eq("isaac@email.com")
    expect(current_path).to eq(dashboard_path)
  end
end
