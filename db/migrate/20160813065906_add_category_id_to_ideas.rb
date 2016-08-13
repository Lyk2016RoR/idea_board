class AddCategoryIdToIdeas < ActiveRecord::Migration[5.0]
  def change

      
    add_column :ideas, :category_id, :integer
    add_foreign_key :ideas, :categories
  end
end
