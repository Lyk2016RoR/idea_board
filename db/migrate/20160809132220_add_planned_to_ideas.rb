class AddPlannedToIdeas < ActiveRecord::Migration[5.0]
  def change
    add_column :ideas, :planned_to, :date
  end
end
