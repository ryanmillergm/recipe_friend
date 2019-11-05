require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validations' do
    it { should validate_presence_of :content }
    it { should validate_presence_of :commentable_id }
    it { should validate_presence_of :commentable_type }
  end

  describe 'relationships' do
    # it { should belong_to :user, through: :commentable }
    # it { should belong_to :recipe, through: :commentable }
    it { is_expected.to have_db_column(:commentable_id).of_type(:integer) }
    it { is_expected.to have_db_column(:commentable_type).of_type(:string) }
    it { is_expected.to belong_to(:commentable) }
  end
end
