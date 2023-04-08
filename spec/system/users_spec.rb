require 'rails_helper'

RSpec.describe 'Users', type: :system do
  describe 'ユーザーの新規作成' do
    # 異常系：メールアドレスが重複する場合のためにletで定義しておく
    let(:existed_user) { create(:user) }

    context '正常系' do
      it 'ユーザーの新規作成ができる' do
        visit new_user_path
        fill_in 'ユーザー名', with: 'test_name'
        fill_in 'メールアドレス', with: 'test@example.com'
        fill_in 'パスワード', with: 'password'
        fill_in 'パスワード確認', with: 'password'
        click_button '登録'
        expect(current_path).to eq new_user_path
        expect(page).to have_content('ユーザー登録が完了しました')
      end
    end

    context '異常系' do
      it 'メールアドレスが未入力の場合、新規作成できない' do
        visit new_user_path
        fill_in 'ユーザー名', with: 'test_name'
        fill_in 'メールアドレス', with: ''
        fill_in 'パスワード', with: 'password'
        fill_in 'パスワード確認', with: 'password'
        expect { click_button '登録' }.to change { User.count }.by(0)
        expect(current_path).to eq new_user_path
        expect(page).to have_content('ユーザー登録に失敗しました')
        expect(page).to have_content('メールアドレスを入力してください')
      end

      it 'メールアドレスが登録してあり重複する場合、新規作成できない' do
        visit new_user_path
        fill_in 'ユーザー名', with: 'test_name'
        fill_in 'メールアドレス', with: existed_user.email
        fill_in 'パスワード', with: 'password'
        fill_in 'パスワード確認', with: 'password'
        expect { click_button '登録' }.to change { User.count }.by(0)
        expect(current_path).to eq new_user_path
        expect(page).to have_content('ユーザー登録に失敗しました')
        expect(page).to have_content('メールアドレスはすでに存在します')
      end
    end
  end
end
