class Category < ApplicationRecord
  has_many :posts, inverse_of: :category
  accepts_nested_attributes_for :posts

end
