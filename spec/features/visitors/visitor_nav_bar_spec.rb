require 'rails_helper'

describe 'Navigation Requests Spec' do

  describe 'Navigation should be available' do
    it 'should show the navigation on the home page' do
      visit root_path
      
      page.should have_link('Home')
      page.should have_link('Dashboard')
      page.should have_link('Favorites')
      page.should have_link('Log in')
    end
  end
end
