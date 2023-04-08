class ArticlesController < ApplicationController

  def index
    @articles = Article.all.order(date: :desc)
  end
end
