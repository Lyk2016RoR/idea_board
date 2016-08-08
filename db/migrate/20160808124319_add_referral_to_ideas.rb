class AddReferralToIdeas < ActiveRecord::Migration[5.0]
  def change
    add_column :ideas, :referral, :string
  end
end
