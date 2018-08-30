class Spell < ActiveRecord::Base
  belongs_to :school
  belongs_to :cat

  validates :name, :description, :power_type, :power_level, presence: true
  validates :power_level, numericality: { greater_than: 0, less_than_or_equal_to: 100 }
  validate :power_type_one_of

  def self.by_cat(cat_id)
    where(cat: cat_id)
  end

  private

  def power_type_one_of
  end

  def power_types
    @types = ['fire', 'water', 'earth', 'lightning', 'ice', 'poison', 'death', 'psychic', 'acid', 'wind']
  end

end
