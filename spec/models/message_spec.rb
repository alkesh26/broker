require 'rails_helper'

RSpec.describe Message, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:publisher_name) }
  end

  describe 'associations' do
    it { should belong_to(:topic) }
  end

  describe 'factory' do
    it 'has a valid factory' do
      expect(build(:message)).to be_valid
    end
  end
end 