require 'rails_helper'

RSpec.describe Operation, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:amount) }
  end

  describe 'associations' do
    it { should have_many(:operation_category).dependent(:destroy) }
    it { should have_many(:categories).dependent(:destroy) }
    it { should belong_to(:user) }
  end
end
