require 'rails_helper'

RSpec.describe Program, type: :model do
  describe 'バリデーションチェック' do
    it '番組名が必須であること' do
      program = FactoryBot.build(:program, title: nil)
      expect(program).not_to be_valid
      expect(program.errors[:title]).to include("を入力してください")
    end

    it '番組名が一意であること' do
      user = FactoryBot.create(:user)
      FactoryBot.create(:program, title: "title", user: user)
      program = FactoryBot.build(:program, title: "title", user: user)
      expect(program).not_to be_valid
      expect(program.errors[:title]).to include("はすでに存在します")
    end

    it '番組名の長さが255文字以内であること' do
      program = FactoryBot.build(:program, title: "a" * 256)
      expect(program).not_to be_valid
      expect(program.errors[:title]).to include("は255文字以内で入力してください")
    end

    it 'パーソナリティ名が必須であること' do
      program = FactoryBot.build(:program, personality_name: nil)
      expect(program).not_to be_valid
      expect(program.errors[:personality_name]).to include("を入力してください")
    end

    it '放送局が必須であること' do
      program = FactoryBot.build(:program, channel: nil)
      expect(program).not_to be_valid
      expect(program.errors[:channel]).to include("を入力してください")
    end

    it '放送曜日が必須であること' do
      program = FactoryBot.build(:program, day: nil)
      expect(program).not_to be_valid
      expect(program.errors[:day]).to include("を入力してください")
    end
  end
end
