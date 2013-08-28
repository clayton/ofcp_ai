class HandSetter
  def initialize(categorizer=HandCategorizer.new)
    @categorizer = categorizer
  end

  def set(cards)
    categorization = @categorizer.categorize(cards)
    [[],[],cards] if categorization == "RoyalFlush"
  end
end
