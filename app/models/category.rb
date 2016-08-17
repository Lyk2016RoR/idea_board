class Category < ApplicationRecord
  validates :color, inclusion: {in: %w(red blue green),
    message: "kırmızı mavi yeşil olabilir"}
  validates :title, uniqueness: true

  has_many :ideas

  def top_ideas
    ideas
      .joins(:votes)
      .select("ideas.*, avg(votes.rating) as point")
      .group("ideas.id")
      .order("point DESC")
      .limit(10)
  end
end
