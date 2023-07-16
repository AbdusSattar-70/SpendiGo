class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.references :category, null: false, foreign_key: true
      t.references :deal, null: false, foreign_key: true
      t.string :photo

      t.timestamps
    end
  end
end
