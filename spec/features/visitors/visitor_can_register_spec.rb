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
    VCR.use_cassette('email_verification_when_registering') do
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
      expect(page).to have_content('A confirmation email has been sent. To gain full access, please confirm your email. Thanks!')
      expect(page).to_not have_content('Sign In')
    end
  end

  it 'I click the registration link in email with valid confirmation token' do
    user = create(:user)
    user.update(confirm_token: 'GbnhJzPxJR5f3uCJVJKQgA')

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit confirm_email_user_path(id: 'GbnhJzPxJR5f3uCJVJKQgA')

    expect(page).to have_content('Thanks for confirming your email address! You now have full access.')
  end

  it 'I click the registration link in email with invalid confirmation token' do
    user = create(:user)
    user.update(confirm_token: 'GbnhJzPxJR5f3uCJVJKQgA')

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit confirm_email_user_path(id: 'fake_token')

    expect(page).to have_content('Sorry, User does not exist')
  end


  it 'I cannot register without required fields' do
    visit new_user_path

    fill_in 'user[last_name]', with: @last_name
    fill_in 'user[username]', with: @username
    fill_in 'user[password]', with: @password
    fill_in 'user[password_confirmation]', with: @password
    fill_in 'user[email]', with: @email
    fill_in 'user[avatar]', with: @avatar
    fill_in 'user[about]', with: @about
    fill_in 'user[telephone]', with: @telephone

    click_on 'Create Account'

    expect(current_path).to eq(users_path)
    expect(page).to have_content("First name can't be blank")
  end
end
