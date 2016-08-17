# == Schema Information
#
# Table name: ideas
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Idea < ApplicationRecord
  validates :title, presence: true, length: { minimum: 10}
  validates :description, presence: true, length: { maximum: 500}
  validate :check_planned_to

  belongs_to :category
  has_many :comments, dependent: :destroy
  belongs_to :user
  has_many :votes
  has_many :voters, through: :votes, source: :user
  has_and_belongs_to_many :tags

  def average_rating
    votes.average(:rating).to_s
  end

  def self.random_ideas
    self.order("RANDOM()").all
  end

  private

    def check_planned_to
      if planned_to.present? && planned_to < Date.today
        errors.add(:planned_to, "gecmise planlanamaz")
      end
    end

end
