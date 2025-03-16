class Program < ApplicationRecord
  belongs_to :user
  has_many :program_personalities, dependent: :destroy
  has_many :personalities, through: :program_personalities
  has_many :posts

  validates :title, presence: true, uniqueness: { scope: nil }, length: { maximum: 255 }
  validates :personality_name, presence: true
  validates :channel, presence: true
  validates :day, presence: true, length: { maximum: 255 }
  validates :start_time, presence: true
  validates :end_time, presence: true
end
