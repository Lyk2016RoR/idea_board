class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.references :user, foreign_key: true
      t.references :idea, foreign_key: true
      t.integer :rating
    end
  end
end
