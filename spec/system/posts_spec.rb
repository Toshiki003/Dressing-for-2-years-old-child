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
         
  describe 'ログイン後' do
    before { login_as(user) }

    describe '投稿の新規作成' do
      context '投稿の入力値が正常' do
        it '投稿の新規作成が成功する' do
          visit new_post_path
          fill_in 'タイトル', with: 'title'
          fill_in '内容', with: 'content'
          fill_in 'YouTube URL(任意)', with: 'https://www.youtube.com/watch?v=BMis-npzi04'
          click_button '登録する'
          expect(page).to have_content ["t('defaults.message.created', item: Post.model_name.human)を作成しました"]
          expect(current_path).to eq posts_path
        end
      end
    end
  end
      
end