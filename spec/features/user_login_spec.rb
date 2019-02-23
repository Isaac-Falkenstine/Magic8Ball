require "rails_helper"

describe 'As a visitor' do
  it 'I can login' do
    password = "password"
    user = create(:user, email: "isaac@email.com", password: password)
    visit '/'
    click_on "Log In"

    expect(current_path).to eq(login_path)

    fill_in 'session[email]', with: "isaac@email.com"
    fill_in 'session[password]', with: password

    click_on "Log In"

    expect(page).to have_content("Welcome #{user.name}!")
    expect(current_path).to eq(dashboard_path)
  end

  it "I can't login if my info is wrong" do
    password = "password"
    user = create(:user, email: "isaac@email.com", password: password)
    visit '/'
    click_on "Log In"

    expect(current_path).to eq(login_path)

    fill_in 'session[email]', with: "izack@email.com"
    fill_in 'session[password]', with: password

    click_on "Log In"

    expect(page).to have_content("Looks like your email or password is invalid")
    expect(current_path).to eq(login_path)
  end

  it "I can't login if I don't exist" do
    password = "password"
    visit '/'
    click_on "Log In"

    expect(current_path).to eq(login_path)

    fill_in 'session[email]', with: "izack@email.com"
    fill_in 'session[password]', with: password

    click_on "Log In"

    expect(page).to have_content("Looks like your email or password is invalid")
    expect(current_path).to eq(login_path)
  end
end
