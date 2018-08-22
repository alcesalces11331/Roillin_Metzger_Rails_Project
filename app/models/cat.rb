class Cat < ActiveRecord::Base
  belongs_to :user
  belongs_to :school
  has_many :courses, :through => :schools
  has_many :spells
  has_many :potions

  validates :name, :type_of, :age, presence: true

end
