module SpellsHelper

  def power_types
    @types = ['fire', 'water', 'earth', 'lightning', 'ice', 'poison', 'death', 'psychic', 'acid', 'wind']
  end

  def match_power_types(params)
    params = params.join(",")
    @matched_types = []
    power_types.each do |p|
      @matched_types << p if params.match(p)
    end
    @matched_types
  end

end
