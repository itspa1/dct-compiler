class Assignment < ApplicationRecord
  has_many :answers
  acts_as_taggable
	acts_as_taggable_on :tags,:companies
end
