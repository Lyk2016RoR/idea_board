class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :idea

  validates :rating, inclusion: (1..5)
  validates :user_id, uniqueness: {scope: :idea_id}
end
