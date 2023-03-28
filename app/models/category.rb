class Category < ApplicationRecord
  has_many :posts, inverse_of: :category

  validates :name, presence: true
end
