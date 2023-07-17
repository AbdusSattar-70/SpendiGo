class CreateJoinTableDealsCategories < ActiveRecord::Migration[7.0]
  def change
    create_join_table :deals, :categories do |t|
      t.index %i[deal_id category_id]
      t.index %i[category_id deal_id]
    end
  end
end
