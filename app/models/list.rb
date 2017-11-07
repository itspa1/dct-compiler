class List < ApplicationRecord

  acts_as_taggable
  acts_as_taggable_on :tags

  belongs_to :user

  has_many :list_assignments
  has_many :assignments ,through: :list_assignments

end
