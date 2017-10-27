class Assignment < ApplicationRecord
  acts_as_taggable
	acts_as_taggable_on :tags,:companies
end
