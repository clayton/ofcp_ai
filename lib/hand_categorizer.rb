require 'ofcp_scoring'

class HandCategorizer
  def initialize(categorizer = OfcpScoring::HandCategorizer.new)
    @categorizer = categorizer
  end

  def categorize(cards)
    categorized_hand = @categorizer.categorize(cards).rank_name
    return "FourToAFlush" if categorized_hand == "HighCard"
    # return "OpenEndedStraight" if categorized_hand == "HighCard"
    categorized_hand
  end
end
