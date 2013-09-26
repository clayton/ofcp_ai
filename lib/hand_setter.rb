class HandSetter
  MONSTERS = ["RoyalFlush","StraightFlush","Flush","Straight","FullHouse","FourOfAKind"]

  def initialize(categorizer=HandCategorizer.new, organizer=OfcpScoring::HandOrganizer.new)
    @categorizer = categorizer
    @organizer   = organizer
  end

  def set(cards)
    categorization = @categorizer.categorize(cards)
    organized_hand = @organizer.organize(cards)
    return [[],[],cards] if MONSTERS.include?(categorization)
    return extract_flush_cards(cards) if categorization == "FourToFlush"
    extract_straight_cards(organized_hand) if categorization == "OpenEndedStraight"
  end

private
  def extract_flush_cards(cards)
    grouped_cards = cards.group_by{|card| card.match(/[c,h,d,s]/)[0]}
    flush_cards = grouped_cards.select{|k,v| k if v.size == 4}.values.flatten
    other_cards = cards - flush_cards
    [[],other_cards,flush_cards]
  end

  def extract_straight_cards(organized_hand)
    [] + organized_hand.sequences.reverse
  end
end
