class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :ideas
  has_many :comments, dependent: :destroy
  has_many :votes

  before_destroy :assign_to_first_user

  private

    def assign_to_first_user
        ideas.update_all(user_id: User.first.id)
    end

end
