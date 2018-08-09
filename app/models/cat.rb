class Cat < ActiveRecord::Base
  belongs_to :user
#  belongs_to :school
  has_many :spells
  has_many :potions

  validates :name, :type, :age, presence: true

  def create_potion
  end

  def learn_spell
  end
end
