class Category < ApplicationRecord
  # VALIDATIONS
  validates :name, presence: true, length: { minimum: 3 }
end
