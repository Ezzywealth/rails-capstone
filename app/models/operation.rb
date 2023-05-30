class Operation < ApplicationRecord
  validates :name, presence: true
  validates :amount, presence: true

  belongs_to :user, class_name: 'User'
  has_many :operation_category, dependent: :destroy
  has_many :categories, through: :operation_category

end
