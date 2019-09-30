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

    expect(current_path).to eq(user_path(@user1.id))
    expect(page).to have_content(@user1.username)
  end

  it 'I can log out' do
    visit root_path

    click_on 'Log in'

    expect(current_path).to eq(new_session_path)

    fill_in 'session[email]', with: @user1.email
    fill_in 'session[password]', with: @user1.password

    click_on 'Log In'

    expect(current_path).to eq(user_path(@user1.id))
    expect(page).to have_content(@user1.username)

    click_on 'Log out'

    expect(current_path).to eq(root_path)
    expect(page).to have_content('You have successfully logged out.')
  end
end