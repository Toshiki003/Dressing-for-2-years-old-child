class BookmarksController < ApplicationController
  def index
    @bookmark_posts = current_user.bookmark_posts.includes(:user).order(created_at: :desc).page(params[:page]).per(9)
  end

  def create
    @post = Post.find(params[:post_id])
    current_user.bookmark(@post)
  end

  def destroy
    @post = current_user.bookmarks.find(params[:id]).post
    current_user.unbookmark(@post)
  end
end
