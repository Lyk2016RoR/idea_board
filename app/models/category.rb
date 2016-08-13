class Category < ApplicationRecord
  validates :color, inclusion: {in: %w(red blue green),
    message: "kırmızı mavi yeşil olabilir"}
  validates :title, uniqueness: true

  has_many :ideas
end
