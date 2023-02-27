class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  has_many :likes

  validates :title, presence: true, length: { maximum: 255 }
  validates :content, presence: true, length: { maximum: 65_535 }
  validates :embed_youtube, length: { maximum: 200 }

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

  def save_with_tags(tag_names:)
    ActiveRecord::Base.transaction do
      self.tags = tag_names.map { |name| Tag.find_or_initialize_by(name: name.strip) }
      save!
    end
    true
  rescue StandardError 
    false
  end
  
  def tag_names
    # NOTE: pluckだと新規作成失敗時に値が残らない(返り値がnilになる)
    tags.map(&:name).join(',')
  end
  
end