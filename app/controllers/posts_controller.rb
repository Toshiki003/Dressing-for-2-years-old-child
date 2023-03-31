class PostsController < ApplicationController
  before_action :set_post, only: %i[edit update destroy]

  def index
    posts = if(tag_name = params[:tag_name])
              Post.with_tag(tag_name)
            elsif (category_name = params[:category_name])
              Post.with_category(category_name)
            else
               Post.all
            end
    @posts = posts.includes(:user).order(created_at: :desc).page(params[:page]).per(9)
    @popular_tags = Tag.popular_tags
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.tags = Tag.str2tags(params.dig(:post, :tag_names)) # タグの文字列をタグの配列に変換
    if @post.save
      redirect_to @post, success: t('defaults.message.created', item: Post.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.not_created', item: Post.model_name.human)
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user).order(created_at: :desc)
  end

  def edit; end

  def update
    @post.assign_attributes(post_params)
    @post.tags = Tag.str2tags(params.dig(:post, :tag_names)) # タグの文字列をタグの配列に変換
    if @post.update(post_params)
      redirect_to @post, success: t('defaults.message.updated', item: Post.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.not_updated', item: Post.model_name.human)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy!
    flash.now[:success] = t('defaults.message.deleted', item: Post.model_name.human)
  end

  def search
    @posts = @search_form.search.includes(:user).order(created_at: :desc)
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :embed_youtube, :image, :category_id)
  end

  def set_post
    begin
      @post = current_user.posts.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to posts_path
    end
  end
end
