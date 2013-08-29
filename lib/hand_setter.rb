class HandSetter
  MONSTERS = ["RoyalFlush","StraightFlush","Flush","Straight","FullHouse","FourOfAKind"]

  def initialize(categorizer=HandCategorizer.new)
    @categorizer = categorizer
  end

  def set(cards)
    categorization = @categorizer.categorize(cards)
    return [[],[],cards] if MONSTERS.include?(categorization)
    [[],[cards[0]],cards[1..4]] if categorization == "FourToFlush" || "OpenEndedStraight" || "TwoPair"
  end
end
