class StaticPagesController < ApplicationController
  skip_before_action :require_login, only: %i[top]
  def top
    @new_arrivals = Post.new_arrivals
  end
end
