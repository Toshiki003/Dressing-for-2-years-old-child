class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  before_action :require_login
  before_action :set_search_posts_form

  private

  def set_search_posts_form
    @search_form = SearchPostsForm.new(search_post_params)
  end

  def search_post_params
    params.fetch(:q, {}).permit(:title_or_content)
  end

  def not_authenticated
    flash[:warning] = t('defaults.message.require_login')
    redirect_to main_app.login_path #rails_admin
  end
end
