require 'rails_helper'

RSpec.describe 'as a user' do
  before :each do
    @user1 = create(:user)
  end
  it 'I can log in' do
    visit root_path

    click_on 'Log in'

    expect(current_path).to eq(new_session_path)

    fill_in 'session[email]', with: @user1.email
    fill_in 'session[password]', with: @user1.password

    click_on 'Log In'

    expect(current_path).to eq(root_path)
    expect(page).to have_content(@user1.first_name)
  end

  it 'I can log out' do
    visit root_path

    click_on 'Log in'

    expect(current_path).to eq(new_session_path)

    fill_in 'session[email]', with: @user1.email
    fill_in 'session[password]', with: @user1.password

    click_on 'Log In'

    expect(current_path).to eq(root_path)
    expect(page).to have_content(@user1.first_name)

    click_on 'Log out'

    expect(current_path).to eq(new_session_path)
    expect(page).to have_content('You have successfully logged out.')
  end

  it 'I cannot login in if password is incorrect' do
    visit root_path

    click_on 'Log in'

    expect(current_path).to eq(new_session_path)

    fill_in 'session[email]', with: @user1.email
    fill_in 'session[password]', with: "NotMyPassworD"

    click_on 'Log In'

    expect(page).to have_content('Oops! Looks like your email or password is invalid')
  end

  it 'I cannot login in if email is incorrect' do
    visit root_path

    click_on 'Log in'

    expect(current_path).to eq(new_session_path)

    fill_in 'session[email]', with: "user2@gmail.com"
    fill_in 'session[password]', with: @user1.password

    click_on 'Log In'

    expect(page).to have_content('Oops! Looks like your email or password is invalid')
  end
end
