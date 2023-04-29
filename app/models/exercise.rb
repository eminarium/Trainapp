class Exercise < ApplicationRecord

  # VALIDATIONS
  validates :name, presence: true, length: { minimum: 3 }
  validates :category_id, presence: true

  # ASSOCIATIONS
  belongs_to :category
end
