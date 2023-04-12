class PostsController < ApplicationController
  before_action :set_post, only: %i[edit update destroy]
  before_action :set_popular_tags, only: %i[index most_liked most_bookmarked conprehensive create]

  def index
    posts = if(tag_name = params[:tag_name])
              Post.with_tag(tag_name)
            elsif (category_name = params[:category_name])
              Post.with_category(category_name)
            else
               Post.all
            end
    @posts = posts.includes(:user).order(created_at: :desc).page(params[:page]).per(9)
    @post = Post.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.tags = Tag.str2tags(params.dig(:post, :tag_names)) # タグの文字列をタグの配列に変換
    if @post.save
      flash.now[:success] = t('defaults.message.created', item: Post.model_name.human)
      if request.referer&.include?(new_post_path)
        redirect_to posts_path, success: t('defaults.message.created', item: Post.model_name.human)
      end
    else
      # request.refererを使用して、リクエストがどのURLから来たかを判断する
      # binding.irb
      if request.referer&.include?(new_post_path)
        flash.now[:danger] = t('defaults.message.not_created', item: Post.model_name.human)
        render :new, status: :unprocessable_entity
      else
        flash.now[:danger] = t('defaults.message.not_created', item: Post.model_name.human)
        render :index, status: :unprocessable_entity
      end
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user).order(created_at: :desc)
  end

  def edit
    @tags = @post.tags.pluck(:name).join(',')
  end

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

  def most_liked
    @posts = Post.most_liked.page(params[:page]).per(9)
    @post = Post.new
  end

  def most_bookmarked
    @posts = Post.most_bookmarked.includes(:user).page(params[:page]).per(9)
    @post = Post.new
  end

  def conprehensive
    @posts = Post.conprehensive.includes(:user).page(params[:page]).per(9)
    @post = Post.new
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :embed_youtube, :image, :category_id, tag_names: [])
  end

  def set_post
    begin
      @post = current_user.posts.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to posts_path
    end
  end

  def set_popular_tags
    @popular_tags = Tag.popular_tags
  end
end
