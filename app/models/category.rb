class Category < ApplicationRecord

  validates :name, presence: true
  validates :icon, presence: true

  belongs_to :user, class_name: 'User'
  has_many :entity_groups, dependent: :destroy
  has_many :entities, through: :entity_groups

end
