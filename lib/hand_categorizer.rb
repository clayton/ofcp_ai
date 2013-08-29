require 'ofcp_scoring'

class HandCategorizer < OfcpScoring::HandCategorizer
  def categorize(cards)
    categorized_hand = super
    rank_name = categorized_hand.rank_name

    if rank_name == "HighCard"
      rank_name = "OpenEndedStraight"
      rank_name = "FourToAFlush" if flush_draw?(categorized_hand)
    end

    rank_name
  end

private
  def flush_draw?(hand)
    hand.suits.values.max == 4
  end
end
