class LikesController < ApplicationController
  def index
    @like_posts = Post.where(id: current_user.likes.pluck(:post_id)).page(params[:page]).per(9)
  end

  def create
    @post = Post.find(params[:post_id])
    Like.create!(user_id: current_user.id, post_id: @post.id)
  end

  def destroy
    @post = current_user.likes.find(params[:id]).post
    current_user.likes.destroy(params[:id])
  end
end
