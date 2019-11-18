require 'rails_helper'

RSpec.describe "As a user" do

  before :each do
    @user1 = create(:user)
  end

  it 'I can visit my profile page' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)

    # visit root_path

    # find("#user-options-path}").find("#my-profile-path").click

    visit dashboard_my_profile_index_path
    save_and_open_page

    expect(page).to have_content(@user1.first_name)
    expect(page).to have_content(@user1.last_name)
    expect(page).to have_content("Edit Profile")
    expect(page).to have_content("About Me")
    expect(page).to have_content("Location")
    expect(page).to have_content("Favorite Quote")
  end
end
