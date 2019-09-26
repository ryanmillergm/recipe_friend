require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :description }
    it { should validate_presence_of :type }
    it { should validate_presence_of :ingredient_id }
    it { should validate_presence_of :user_id }
  end

  describe 'relationships' do
    it { should have_many(:ingredients).through :recipe_ingredients }
    it { should have_many :recipe_ingredients }
  end
end