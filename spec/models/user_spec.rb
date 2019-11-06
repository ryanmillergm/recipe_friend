require 'rails_helper'

RSpec.describe User, type: :model do
  # it_behaves_like "commentable"

  describe "validations" do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_uniqueness_of :username }
    it { should validate_uniqueness_of :email }
    it { should validate_uniqueness_of :telephone }
  end

  describe "relationships" do
    it { should have_and_belong_to_many :friends }
    it { should have_many :favorites }
    it { should have_many :comments }
  end
end
