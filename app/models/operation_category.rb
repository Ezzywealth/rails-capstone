class OperationCategory < ApplicationRecord
  validates :category_id, presence: true
  validates :operation_id, presence: true
  belongs_to :category
  belongs_to :operation
end
