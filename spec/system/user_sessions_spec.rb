require 'rails_helper'

RSpec.describe "UserSessions", type: :system do
  let!(:user) { create(:user, name: "name", password: "password") }

  before do
    driven_by(:rack_test)
  end

  describe 'ログイン前' do
    it 'ログインができること' do
      visit login_path

      fill_in "ユーザー名", with: "name"
      fill_in "パスワード", with: "password"
      click_button "ログイン"
      
      expect(page).to have_content "ログインしました"
      expect(current_path).to eq root_path
    end

    it 'フォーム未入力でログインができない' do
      visit login_path

      fill_in "ユーザー名", with: ""
      fill_in "パスワード", with: ""
      click_button "ログイン"
      
      expect(page).to have_content "ログインに失敗しました"
      expect(current_path).to eq login_path
    end
  end

  describe 'ログイン後' do
    it 'ログアウトができること' do
      visit login_path

      fill_in "ユーザー名", with: "name"
      fill_in "パスワード", with: "password"
      click_button "ログイン"

      click_link "ログアウト"

      expect(page).to have_content "ログアウトしました"
      expect(current_path).to eq login_path
    end
  end
end
