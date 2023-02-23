class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category

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
end