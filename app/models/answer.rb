class Answer < ApplicationRecord

  belongs_to :assignment
  belongs_to :user

  has_many :forks
  has_many :users,through: :forks
end
