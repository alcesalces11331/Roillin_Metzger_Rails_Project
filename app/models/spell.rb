class Spell < ActiveRecord::Base

  belongs_to :school
  belongs_to :cat

  validates :name, :description, :power_level, presence: true
  validates :power_level, numericality: {
    greater_than: 0,
    less_than_or_equal_to: 10,
    message: "It can't be over 10"
  }

  validate :power_type_must_be_two_or_less

  def power_type_must_be_two_or_less
    regex = self.power_type.gsub!(/[\"\\\[\]\s]/, "")
    errors.add(:power_type, "Must be less than 2") if match_power_types(regex).length > 2
  end

  def self.by_cat(cat_id)
    where(cat: cat_id)
  end

  def match_power_types(params)
    params = params.split(",")
    @matched_types = []
    power_types.each do |pt|
      params.each do |p|
        @matched_types << pt if p == pt
      end
    end
    @matched_types
  end

  def power_types
    @types = ['fire', 'water', 'earth', 'lightning', 'ice', 'poison', 'death', 'psychic', 'acid', 'wind']
  end

  def self.by_type(power_type)
    @spells = []
    Spell.where("power_type = ?", params[:power_type]).find_each do |spell|
      @spells << spell
    end
    @spells
  end

  def self.by_power_level(power_level)
    @spells = []
    Spell.where("power_level = ?", params[:power_level]).find_each do |spell|
      @spells << spell
    end
    @spells
  end

end
