class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :name, presence: true, length: { maximum: 15 }
  validates :email, presence: true, uniqueness: true

  validates :reset_password_token, presence: true, uniqueness: true, allow_nil: true

  has_many :posts, dependent: :destroy
  has_many :likes

  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_posts, through: :bookmarks, source: :post

  has_many :comments, dependent: :destroy


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

  enum role: {
    general: 0,
    admin: 1,
    guest: 2
  }

  def own?(object)
    id == object.user_id
  end

  def liked_by?(post_id)
    likes.where(post_id: post_id).exists?
  end
    
  def bookmark(post)
    bookmark_posts << post
  end

  def unbookmark(post)
    bookmark_posts.destroy(post)
  end

  def bookmark?(post)
    bookmark_posts.include?(post)
  end
end
