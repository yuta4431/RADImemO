class Personality < ApplicationRecord
  has_many :program_personalities, dependent: :destroy
  has_many :programs, through: :program_personalities

  validates :name, presence: true, length: { maximum: 255 }
end
