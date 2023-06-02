class Category < ApplicationRecord
  # after_update :calculate_amount
  validates :name, presence: true
  validates :icon, presence: false

  belongs_to :user, class_name: 'User'
  has_one_attached :icon

  has_many :operation_category, dependent: :destroy
  has_many :operations, through: :operation_category, dependent: :destroy

  def calculate_amount
    operations.sum { |operation| operation.amount.to_i }
  end
end
