class ChinesePokerHand
  attr_accessor :front, :middle, :back

  def initialize
    self.front  = []
    self.middle = []
    self.back   = []
  end

  def current_hand
    [front, middle, back]
  end

  def build(cards)
    self.front  = cards[0]
    self.middle = cards[1]
    self.back   = cards[2]
  end
end
