class Spell < ActiveRecord::Base
  belongs_to :school
  belongs_to :cat

  validates :name, :description, :power_type, :power_level, presence: true
  validates :power_level, numericality: { greater_than: 0, less_than_or_equal_to: 100 }

  def self.by_cat(cat_id)
    where(cat: cat_id)
  end

end
