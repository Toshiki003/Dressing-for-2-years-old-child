class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create guest_login]

  def new; end

  def create
    @user = login(params[:email], params[:password])

    if @user

      redirect_back_or_to posts_path, success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :new, status: :unprocessable_entity
    end
  end
  
  def guest_login
    @guest_user = User.create(
      name: 'ゲスト' + Time.zone.now.to_i.to_s + 'さん',
      email: SecureRandom.alphanumeric(10) + "@email.com",
      password: 'password',
      password_confirmation: 'password',
      avatar: User.avatars.keys.sample,
      role: 2
    )
    auto_login(@guest_user)
    redirect_to posts_path, success: t('.success')
  end


  def destroy
    logout
    redirect_to root_path, success: t('.success'), status: :see_other
  end
end
