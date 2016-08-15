class AddUserToIdeas < ActiveRecord::Migration[5.0]
  def change
    add_reference :ideas, :user, foreign_key: true
  end
end
