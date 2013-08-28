class Player

  def initialize(hand=ChinesePokerHand.new, setter=HandSetter.new)
    @hand   = hand
    @setter = setter
  end

  def set_hand(cards)
    @hand.build(@setter.set(cards))
  end

  def hand
    @hand.current_hand
  end
end
