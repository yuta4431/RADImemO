require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーションチェック' do
    it '名前が必須であること' do
      user = FactoryBot.build(:user, name: nil)
      expect(user).not_to be_valid
      expect(user.errors[:name]).to include("を入力してください")
    end

    it '名前が一意であること' do
      FactoryBot.create(:user, name: "name")
      user = FactoryBot.build(:user, name: "name")
      expect(user).not_to be_valid
      expect(user.errors[:name]).to include("はすでに存在します")
    end

    it '名前の長さが20文字以内であること' do
      user = FactoryBot.build(:user, name: 'a' * 21)
      expect(user).not_to be_valid
      expect(user.errors[:name]).to include("は20文字以内で入力してください")
    end

    it 'パスワードが8文字以上であること' do
      user = FactoryBot.build(:user, password: 'pass', password_confirmation: 'pass')
      expect(user).not_to be_valid
      expect(user.errors[:password]).to include("は8文字以上で入力してください")
    end

    it 'パスワード確認が必須であること' do
      user = FactoryBot.build(:user, password_confirmation: nil)
      expect(user).not_to be_valid
      expect(user.errors[:password_confirmation]).to include("を入力してください")
    end
  end
end
