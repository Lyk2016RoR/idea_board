class Category < ApplicationRecord
  validates :color, inclusion: {in: %w(red blue green),
    message: "kırmızı mavi yeşil olabilir"}
  validates :title, uniqueness: true

  def ideas
    Idea.where(category_id: id)
  end
end
