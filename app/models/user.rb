class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :name, presence: true, length: { maximum: 15 }
  validates :email, presence: true, uniqueness: true

  has_many :posts, dependent: :destroy

  enum avatar: {
    fox: 0, 
    dog: 1, 
    cat: 2,
    lion: 3,
    hourse: 4,
    panda: 5,
    bee: 6,
    whitetiger: 7,
    stegosaurus: 8
  } 

  def own?(object)
    id == object.user_id
  end
end
