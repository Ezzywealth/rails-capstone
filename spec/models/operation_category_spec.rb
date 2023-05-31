require 'rails_helper'

RSpec.describe OperationCategory, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:category_id) }
    it { should validate_presence_of(:operation_id) }
  end

  describe 'associations' do
    it { should belong_to(:category) }
    it { should belong_to(:operation) }
  end
end
