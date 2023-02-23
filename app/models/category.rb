class Category < ApplicationRecord
  has_many :posts, dependent: :destroy

  enum name: {
    bath: 0,
    dentifrice: 1,
  }
end
