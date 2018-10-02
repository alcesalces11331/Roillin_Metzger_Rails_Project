class School < ActiveRecord::Base
  
  has_many :cats
  has_many :spells
  has_many :users, through: :cats
 
end
