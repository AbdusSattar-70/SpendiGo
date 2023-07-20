# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :categories, foreign_key: 'author_id', dependent: :destroy
  has_many :deals, foreign_key: 'author_id', dependent: :destroy
  has_one_attached :photo, dependent: :destroy
  validates :photo, presence: true
  validates :name, presence: true, length: { maximum: 25 }
end
