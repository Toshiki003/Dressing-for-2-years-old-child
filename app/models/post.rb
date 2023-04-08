class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  has_many :likes
  has_many :comments, dependent: :destroy
  has_one_attached :image

  validates :title, presence: true, length: { maximum: 255 }
  validates :content, presence: true, length: { maximum: 65_535 }
  validates :embed_youtube, length: { maximum: 200 }

  scope :with_tag, ->(tag_name) { joins(:tags).where(tags: { name: tag_name }) }
  scope :title_contain, ->(word) { where('title LIKE ?', "%#{word}%") }
  scope :content_contain, ->(word) { where('posts.content LIKE ?', "%#{word}%") }
  scope :with_category, ->(category_name) { joins(:category).where(categories: { name: category_name }) }
  scope :new_arrivals, -> { Post.order(created_at: :desc).limit(3) }

  scope :most_liked, -> { joins(:likes).group(:id).order('COUNT(likes.id) DESC') }


  def split_id_from_youtube_url
    # YoutubeならIDのみ抽出
    if self.embed_youtube?
      if self.embed_youtube.include?('youtu.be')
        embed_youtube.split('/').last
      elsif self.embed_youtube.include?('youtube.com')
        embed_youtube.split('=').last
      end
    end
  end

  #タグ保存失敗時の例外処理
  def save
    ActiveRecord::Base.transaction do
      save!
    end
    true
  rescue StandardError
    false
  end

  # twitterシェアボタン用のハッシュタグメソッドを定義
  def hash_tags
    return if self.tags.blank?
    hash_tags = ""
    self.tags.pluck(:name).each do |tag|
      hash_tag = "%0A%23#{tag}"
      hash_tags << hash_tag
    end
    return hash_tags
  end
end