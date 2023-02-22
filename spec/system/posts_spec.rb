require 'rails_helper'

RSpec.describe "Posts", type: :system do
  let(:user) { create(:user) }
  let(:post) { create(:post) }

  describe 'ログイン前' do
    context '投稿の新規登録ページにアクセス' do
      it '新規登録ページへのアクセスが失敗する' do
        visit new_post_path
        expect(page).to have_content 'ログインしてください'
        expect(current_path).to eq login_path
      end
    end

    context '投稿の編集ページにアクセス' do
      it '編集ページへのアクセスが失敗する' do
        visit edit_post_path(post)
        expect(page).to have_content 'ログインしてください'
        expect(current_path).to eq login_path
      end
    end

    context '詳細ページ' do
      it '投稿の詳細情報が失敗する' do 
        visit post_path(post)
        expect(page).to have_content 'ログインしてください'
        expect(current_path).to eq login_path
      end
    end

    context '投稿一覧ページ' do
      it '投稿一覧ページへのアクセスが失敗する' do   
        visit posts_path(post)
        expect(page).to have_content 'ログインしてください'
        expect(current_path).to eq login_path
      end
    end
  end
         
  
      
end