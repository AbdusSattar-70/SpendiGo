# frozen_string_literal: true

class CreateDeals < ActiveRecord::Migration[7.0]
  def change
    create_table :deals do |t|
      t.string :name
      t.decimal :amount

      t.timestamps
    end
  end
end
