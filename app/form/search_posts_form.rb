class SearchPostsForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :title_or_content, :string
  
  def search
    scope = Post.distinct
    scope = scope.title_contain(title_or_content).or(scope.content_contain(title_or_content)) if title_or_content.present?
    scope
  end
end