class Operation < ApplicationRecord
  validates :name, presence: true
  validates :amount, presence: true

  belongs_to :user
  has_many :entity_groups, dependent: :destroy
  has_many :groups, through: :entity_groups

end
