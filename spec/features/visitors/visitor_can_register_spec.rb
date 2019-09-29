require 'rails_helper'

RSpec.describe 'as a visitor' do
  before :each do
    @first_name = 'Joe'
    @last_name = 'Bob'
    @username = 'joebob'
    @password = 'password'
    @email = 'joebob@gmail.com'
    @avatar = 'avatar'
    @about = 'about'
    @telephone = 5555555555
  end

  it 'I can register and create account' do
    visit root_path

    click_on 'Log in'

    expect(current_path).to eq(new_session_path)

    click_on 'Click here to create an account'

    expect(current_path).to eq(new_user_path)

    fill_in 'user[first_name]', with: @first_name
    fill_in 'user[last_name]', with: @last_name
    fill_in 'user[username]', with: @username
    fill_in 'user[password]', with: @password
    fill_in 'user[password_confirmation]', with: @password
    fill_in 'user[email]', with: @email
    fill_in 'user[avatar]', with: @avatar
    fill_in 'user[about]', with: @about
    fill_in 'user[telephone]', with: @telephone

    click_on 'Create Account'

    user = User.last

    expect(current_path).to eq(user_path(user.id))
    expect(page).to have_content("Logged in as #{user.username}")
    expect(page).to have_content('This account has not yet been activated. Please check your email to confirm your email address.')
    expect(page).to_not have_content('Sign In')
  end
end
