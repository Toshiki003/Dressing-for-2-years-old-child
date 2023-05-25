class ArticlesController < ApplicationController

  def index
    @articles = Article.last(10)
  end
end
