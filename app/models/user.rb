class User < ApplicationRecord
  has_many :categories, foreign_key: 'author_id', dependent: :destroy
  has_many :deals, foreign_key: 'author_id', dependent: :destroy
  has_one_attached :photo, dependent: :destroy
  validates :name, presence: true, length: { maximum: 25 }
end
