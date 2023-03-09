class Tag < ApplicationRecord
  has_many :post_tags, dependent: :destroy
  has_many :posts, through: :post_tags

  validates :name, presence: true, uniqueness: true

  #人気のタグを取得　コントローラからモデルへ移動
  def self.popular_tags
    Tag.find(PostTag.group(:tag_id).count.sort_by{ |a| a[1]}.reverse.take(3).map{|b| b[0]})
    
  end
end
