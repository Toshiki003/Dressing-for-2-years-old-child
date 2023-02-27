class PostForm
	include ActiveModel::Model
  include ActiveModel::Attributes

  # セレクトボックスの場合、そしてMySQLの場合、integer型？↓
  attribute :category_id, :integer
  attribute :title, :string
  attribute :content, :string
  attribute :embed_youtube, :string
  attribute :tag_names, :string

  
  validates :title, length: { maximum: 255 }
  validates :content, length: { maximum: 65_535 }
  validates :embed_youtube, length: { maximum: 200 }

  
  with_options presence: true do
    validates :category_id, :title, :content
  end



  def save_post
    return false if invalid?

    ActiveRecord::Base.transaction do
      Category.save!(category_id: category)
      Post.create!(title: title, content: content, embed_youtube: embed_youtube)
    end
  rescue StandardError
    false
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