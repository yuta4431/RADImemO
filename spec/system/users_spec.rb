require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    driven_by(:rack_test)
  end

  describe 'ユーザー作成' do
    context 'フォームの入力値が正常' do
      it 'ユーザーの新規作成が成功する' do
        visit new_user_path

        fill_in "ユーザー名", with: "name"
        fill_in "パスワード", with: "password"
        fill_in "パスワード確認", with: "password"
        click_button "登録"

        expect(page).to have_content "ユーザー登録が完了しました"
        expect(current_path).to eq root_path
      end
    end

    context 'ユーザー名が未入力' do
      it 'ユーザーの新規作成が失敗する' do
        visit new_user_path

        fill_in "ユーザー名", with: ""
        fill_in "パスワード", with: "password"
        fill_in "パスワード確認", with: "password"
        click_button "登録"

        expect(page).to have_content "ユーザー登録に失敗しました"
      end
    end

    context 'パスワードとパスワード確認が一致していない' do
      it 'ユーザーの新規作成が失敗する' do
        visit new_user_path

        fill_in "ユーザー名", with: "name"
        fill_in "パスワード", with: "password"
        fill_in "パスワード確認", with: "passward"
        click_button "登録"

        expect(page).to have_content "ユーザー登録に失敗しました"
      end
    end
  end
end
