class School < ActiveRecord::Base
  has_many :cats
  has_many :spells

  def enroll_cat(cat)
    cat.enrolled = true
  end
end
