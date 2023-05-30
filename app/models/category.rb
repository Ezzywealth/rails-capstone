class Category < ApplicationRecord

  validates :name, presence: true
  validates :icon, presence: true

  belongs_to :user, class_name: 'User'
  has_one_attached :icon
  has_many :operation_category, dependent: :destroy
  has_many :operations, through: :operation_category

end
