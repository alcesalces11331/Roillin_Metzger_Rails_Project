class School < ActiveRecord::Base
  has_many :cats
  has_one :spells_class, :potions_class
end
