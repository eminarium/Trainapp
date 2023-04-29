class Exercise < ApplicationRecord

  # VALIDATIONS
  validates :name, presence: true
  validates :category_id, presence: true

  # ASSOCIATIONS
  belongs_to :category
end
