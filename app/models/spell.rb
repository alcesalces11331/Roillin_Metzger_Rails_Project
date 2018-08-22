class Spell < ActiveRecord::Base
  belongs_to :school
  belongs_to :cat

  validates :name, :description, :power_type, :power_level, presence: true
end
