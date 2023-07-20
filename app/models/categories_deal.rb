# frozen_string_literal: true

class CategoriesDeal < ApplicationRecord
  belongs_to :category
  belongs_to :deal
end
