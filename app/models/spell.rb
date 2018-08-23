class Spell < ActiveRecord::Base
  belongs_to :school
  belongs_to :cat

  validates :name, :description, :power_type, :power_level, presence: true

  def self.by_cat(cat_id)
    where(cat: cat_id)
  end
end
