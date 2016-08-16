class CreateIdeasTags < ActiveRecord::Migration[5.0]
  def change
    create_join_table :tags, :ideas
  end
end
