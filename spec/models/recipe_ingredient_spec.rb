require 'rails_helper'

RSpec.describe RecipeIngredient, type: :model do
  describe 'validations' do
    it { should validate_presence_of :recipe_id }
    it { should validate_presence_of :ingredient_id }
    it { should validate_presence_of :measurement_type }
    it { should validate_presence_of :measurement }
    it { should validate_presence_of :quantity }
  end

  describe 'relationships' do
    it { should belong_to :recipe }
    it { should belong_to :ingredient }
  end
end
