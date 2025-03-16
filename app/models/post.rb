class Post < ApplicationRecord
  belongs_to :user
  belongs_to :program

  validates :program, presence: true
  validates :broadcast_date, presence: true
  validates :content, presence: true, length: { maximum: 65_535 }
end
