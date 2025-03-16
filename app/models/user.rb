class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :programs
  has_many :personalities
  has_many :posts

  validates :name, presence: true, uniqueness: true, length: { maximum: 20 }
  validates :password, length: { minimum: 8 }, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
end
