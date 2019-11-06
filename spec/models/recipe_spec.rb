require 'rails_helper'

RSpec.describe Recipe, type: :model do
  # it_behaves_like "commentable"

  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :description }
    it { should validate_presence_of :recipe_type }
    it { should validate_presence_of :user_id }
  end

  describe 'relationships' do
    it { should have_many(:ingredients).through :recipe_ingredients }
    it { should have_many :recipe_ingredients }
    it { should have_many :steps }
    it { should have_many :comments }
  end
end
