class Spell < ActiveRecord::Base

  belongs_to :school
  belongs_to :cat

  validates :name, :description, :power_level, presence: true
  validates :power_level, numericality: {
    greater_than: 0,
    less_than_or_equal_to: 100,
    message: "It can't be over 100"
  }

  #validate :power_type_must_be_two_or_less

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

  def self.create_spell_boolean(spell)
    spell.power_type.tr('"', '').slice(1..-2).split(", ").each do |power|
      if power == "fire"
        spell.fire = true
      elsif power == "water"
        spell.water = true
      elsif power == "earth"
        spell.earth = true
      elsif power == "lightning"
        spell.lightning = true
      elsif power == "ice"
        spell.ice = true
      elsif power == "poison"
        spell.poison = true
      elsif power == "death"
        spell.death = true
      elsif power == "psychic"
        spell.psychic = true
      elsif power == "acid"
        spell.acid = true
      elsif power == "wind"
        spell.wind = true
      end
    end
    spell
  end

  def power_types
    @types = ['fire', 'water', 'earth', 'lightning', 'ice', 'poison', 'death', 'psychic', 'acid', 'wind']
  end

  def self.by_type(input)
    case input
    when 'fire'
      @spells = where("fire = ?", true)
    when 'water'
      @spells = where("water = ?", true)
    when 'earth'
      @spells = where("earth = ?", true)
    when 'lightning'
      @spells = where("lightning = ?", true)
    when 'ice'
      @spells = where("ice = ?", true)
    when 'poison'
      @spells = where("poison = ?", true)
    when 'death'
      @spells = where("death = ?", true)
    when 'psychic'
      @spells = where("psychic = ?", true)
    when 'acid'
      @spells = where("acid = ?", true)
    when 'wind'
      @spells = where("wind = ?", true)
    else
      @message = "No spells meet your search"
    end
  end

  def self.by_power_level(input)
    int_input = input.to_i
    if any? {|spell| spell.power_level >= int_input}
      @spells = where("power_level >= ?", int_input)
    else
      @message = "No spells meet your search"
    end
  end

end
