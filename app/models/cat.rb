class Cat < ActiveRecord::Base
  belongs_to :user
  belongs_to :school
  has_many :spells, :through => :school
  has_many :potions, :through => :school

  validates :name, :type_of, :age, presence: true

  def self.by_user(user_id)
    where(user: user_id)
  end
end
