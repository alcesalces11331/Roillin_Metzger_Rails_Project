class Cat < ActiveRecord::Base
  belongs_to :user
#  belongs_to :school
  has_many :spells

  validates :name, :type, :age, presence: true
end
