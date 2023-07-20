# frozen_string_literal: true

class Deal < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_and_belongs_to_many :categories, dependent: :destroy

  validates :name, :amount, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
end
