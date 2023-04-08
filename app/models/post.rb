class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  has_many :likes
  has_many :comments, dependent: :destroy
  has_one_attached :image
  has_many :bookmarks, dependent: :destroy

  validates :title, presence: true, length: { maximum: 255 }
  validates :content, presence: true, length: { maximum: 65_535 }
  validates :embed_youtube, length: { maximum: 200 }

  scope :with_tag, ->(tag_name) { joins(:tags).where(tags: { name: tag_name }) }
  scope :title_contain, ->(word) { where('title LIKE ?', "%#{word}%") }
  scope :content_contain, ->(word) { where('posts.content LIKE ?', "%#{word}%") }
  scope :with_category, ->(category_name) { joins(:category).where(categories: { name: category_name }) }
  scope :new_arrivals, -> { Post.order(created_at: :desc).limit(3) }
  scope :most_liked, -> { joins(:likes).group(:id).order('COUNT(likes.id) DESC') }
  scope :most_bookmarked, lambda {
    select('posts.*, COUNT(bookmarks.id) AS bookmarks_count')
      .joins(:bookmarks)
      .group('posts.id')
      .order('bookmarks_count DESC')
  }
  scope :conprehensive, lambda {
    select('posts.*, (COUNT(likes.id) * 5 + COUNT(bookmarks.id) * 10 + COUNT(comments.id) * 3) AS total_points')
      .joins('LEFT JOIN likes ON likes.post_id = posts.id')
      .joins('LEFT JOIN bookmarks ON bookmarks.post_id = posts.id')
      .joins('LEFT JOIN comments ON comments.post_id = posts.id')
      .group('posts.id')
      .order('total_points DESC')
  }

  def split_id_from_youtube_url
    # YoutubeならIDのみ抽出
    return unless embed_youtube?

    if embed_youtube.include?('youtu.be')
      embed_youtube.split('/').last
    elsif embed_youtube.include?('youtube.com')
      embed_youtube.split('=').last
    end
  end

  # タグ保存失敗時の例外処理
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
    return if tags.blank?

    hash_tags = ''
    tags.pluck(:name).each do |tag|
      hash_tag = "%0A%23#{tag}"
      hash_tags << hash_tag
    end
    hash_tags
  end
end
