class Spell < ActiveRecord::Base

  belongs_to :school
  belongs_to :cat

  validates :name, :description, :power_level, presence: true
  validates :power_level, numericality: { greater_than: 0, less_than_or_equal_to: 100 }
  #validate :power_type_one_only, :on => :create

  def self.by_cat(cat_id)
    where(cat: cat_id)
  end

  private

  #def power_type_one_only
    #if self.power_type.
  #  errors.add(:power_type, "Power can only be one or two types") if self.power_type.include? > 2
#  end

end
