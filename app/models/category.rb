class Category < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_and_belongs_to_many :deals, dependent: :destroy

  validates :name, :icon, presence: true
  has_one_attached :icon, dependent: :destroy
end
