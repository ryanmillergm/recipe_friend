require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'validations' do
    it { should validate_presence_of :step }
    it { should validate_presence_of :recipe_id }
  end

  describe 'relationships' do
    it { should belong_to :recipe }
  end
end
