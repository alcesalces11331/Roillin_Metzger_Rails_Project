class Cat < ActiveRecord::Base
  belongs_to :user
#  belongs_to :school
  has_many :spells

  validates :name, :type, :age, presence: true

  def cast_spell
  end

  def prepare_spell
  end

  def learn_spell
  end
end
