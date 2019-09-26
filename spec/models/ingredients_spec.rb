require 'rails_helper'

RSpec.describe Ingredients, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :type }
  end

  describe 'relationships' do
    it { should have_many(:recipes).through :recipe_ingredients }
    it { should have_many :recipe_ingredients }
  end
end
