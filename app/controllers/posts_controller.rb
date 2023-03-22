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
    @post.build_category
    @default_tag = "#育児あるある"
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.category_id = params.dig(:post, :category, :category_id) # accepts_nested_attributes_forメソッドで保存できるまでの応急処置
    if @post.save_with_tags(tag_names: params.dig(:post, :tag_names).split(',').uniq)
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

  def edit
    @default_tag = "#育児あるある"
  end

  def update
    @post.assign_attributes(post_params)
    @post.category_id = params.dig(:post, :category, :category_id) # accepts_nested_attributes_forメソッドで保存できるまでの応急処置
    if @post.save_with_tags(tag_names: params.dig(:post, :tag_names).split(',').uniq)
      redirect_to @post, success: t('defaults.message.updated', item: Post.model_name.human)
    else
      flash.now[:danger] = t('defaults.message.not_updated', item: Post.model_name.human)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy!
    redirect_to posts_path, success: t('defaults.message.deleted', item: Post.model_name.human), status: :see_other 
  end

  def search
    @posts = @search_form.search.includes(:user).order(created_at: :desc)
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :embed_youtube, :image, categories_attributes: [:id])
  end

  def set_post
    begin
      @post = current_user.posts.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to posts_path
    end
  end
end
