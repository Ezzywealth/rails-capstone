require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'associations' do
    it { should have_many(:operation_category).dependent(:destroy) }
    it { should have_many(:operations).dependent(:destroy) }
    it { should belong_to(:user) }
    it { should have_one_attached(:icon) }
  end
end
