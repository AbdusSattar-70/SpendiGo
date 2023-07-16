class CreateJoinTableDealsCategories < ActiveRecord::Migration[7.0]
  def change
    create_join_table :deals, :categories do |t|
      t.index [:deal_id, :category_id]
      t.index [:category_id, :deal_id]
    end
  end
end
