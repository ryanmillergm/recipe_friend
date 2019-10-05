require 'rails_helper'

RSpec.describe 'As a visitor' do
  it 'I cannot visit the dashboard' do
    visit dashboard_index_path

    expect(current_path).to eq(new_session_path)
    expect(page).to have_content('You must log in or register to become a member')
  end

  it 'I cannot visit my favorites page' do
    visit(favorites_index_path)

    expect(current_path).to eq(new_session_path)
    expect(page).to have_content('You must log in or register to become a member')
  end
end
