require 'rails_helper'

RSpec.describe "UserSessions", type: :system do
  let(:user) { create(:user) }

  describe '通常のログインログアウト' do
    context '正常系' do
      it 'ログインができる' do
        visit login_path
        fill_in 'メールアドレス', with: user.email
        fill_in 'パスワード',	with: 'password'
        click_button 'ログイン'
        expect(page).to  have_content 'ログインしました'
        # posts機能実装後コメントアウトを外す↓
        # expect(current_path).to eq posts_path
      end

      it 'ログアウトができる' do
        login_as(user)
        click_link 'ログアウト'
        expect(page).to  have_content 'ログアウトしました'
      end
    end

    context '異常系' do
      it 'メールアドレスが未入力の場合、ログインできない' do
        visit login_path
        fill_in 'メールアドレス', with: ''
        fill_in 'パスワード',	with: 'password'
        click_button 'ログイン'
        expect(current_path).to eq login_path
        expect(page).to  have_content 'ログインに失敗しました'
      end

      it 'パスワードが未入力の場合、ログインできない' do
        visit login_path
        fill_in 'メールアドレス', with: user.email
        fill_in 'パスワード',	with: ''
        click_button 'ログイン'
        expect(current_path).to eq login_path
        expect(page).to  have_content 'ログインに失敗しました'
      end
    end
  end

  describe 'ゲストログイン' do
    # 後で書きます
  end
end
