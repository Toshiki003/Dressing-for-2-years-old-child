module LoginMacros
  def login_as(user)
    visit login_path
    fill_in 'メールアドレス', with: user.email
    fill_in 'パスワード', with: 'password'
    click_on 'ログインする'
    sleep 0.5 #ページが完全に読み込まれることを待つ
    expect(current_path).to eq(posts_path) # ログインが成功したことを確認
  end
end
