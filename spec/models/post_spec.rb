require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'バリデーションチェック' do
    it '番組名が必須であること' do
      post = FactoryBot.build(:post, program: nil)
      expect(post).not_to be_valid
      expect(post.errors[:program]).to include("を入力してください")
    end

    it '放送日時が必須であること' do
      post = FactoryBot.build(:post, broadcast_date: nil)
      expect(post).not_to be_valid
      expect(post.errors[:broadcast_date]).to include("を入力してください")
    end

    it '内容・感想が必須であること' do
      post = FactoryBot.build(:post ,content: nil)
      expect(post).not_to be_valid
      expect(post.errors[:content]).to include("を入力してください")
    end

    it '内容・感想が65535文字以内であること' do
      post = FactoryBot.build(:post, content: "a" * 65_536)
      expect(post).not_to be_valid
      expect(post.errors[:content]).to include("は65535文字以内で入力してください")
    end
  end
end
