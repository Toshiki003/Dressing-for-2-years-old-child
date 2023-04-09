class StaticPagesController < ApplicationController
  skip_before_action :require_login, only: %i[top privacy_policy terms about]
  def top
    @new_arrivals = Post.new_arrivals
  end

  def about; end

  def privacy_policy; end

  def terms; end
end
