class Spell < ActiveRecord::Base

  belongs_to :school
  belongs_to :cat

  validates :name, :description, :power_level, presence: true
  validates :power_level, numericality: {
    greater_than: 0,
    less_than_or_equal_to: 9000, 
    message: "It can't be over 9000"
  }
  validates :power_type, length: {
    maximum: 2,
    message: "Power can only be one or two types"
  }

  def self.by_cat(cat_id)
    where(cat: cat_id)
  end

end
