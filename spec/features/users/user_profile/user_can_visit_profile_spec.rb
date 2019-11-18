require 'rails_helper'

RSpec.describe "As a user" do

  before :each do
    @user1 = create(:user)
  end

  it 'I can visit my profile page' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
    # visit root_path

    # find("#user-options-path}").find("#my-profile-path").click

    visit dashboard_my_profile_path(@user1.id)

    expect(page).to have_content(@user1.username)
    expect(page).to have_content("About Me")
    expect(page).to have_content("Location")
    expect(page).to have_content("Favorite Quote")
    expect(page).to have_link("Edit Profile")
  end
end
