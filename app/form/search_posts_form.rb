class SearchPostsForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :title_or_content, :string

  def search
    scope = Post.distinct
    if title_or_content.present?
      scope = scope.title_contain(title_or_content).or(scope.content_contain(title_or_content))
    end
    scope
  end
end
