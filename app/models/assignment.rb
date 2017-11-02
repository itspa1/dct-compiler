class Assignment < ApplicationRecord

  validates_uniqueness_of :code

  acts_as_paranoid

  belongs_to :user
  has_many :answers
  acts_as_taggable
	acts_as_taggable_on :tags,:companies

  after_save :assign_code

  def assign_code
    @code = "DCT" + SecureRandom.hex(2)
    self.code = @code
    self.save
  end

end
