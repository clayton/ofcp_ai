require 'spec_helper'

describe "Player" do
  context "Setting the initial Hand" do
    it "should build a new Chinese Poker Hand when setting the initial hand" do
      mock_hand = double(ChinesePokerHand)
      mock_hand.should_receive(:build)
      sut = Player.new(mock_hand, FakeHandSetter.new)
      sut.set_hand(%w(Ah Kh Qh Jh 10h))
    end
    it "should get its current hand from its poker hand" do
      poker_hand = ChinesePokerHand.new
      poker_hand.stub(:current_hand).and_return([%w(Qh),%w(Kh),%w(Ah)])
      sut = Player.new(poker_hand, FakeHandSetter.new)
      expect(sut.hand).to eq([%w(Qh),%w(Kh),%w(Ah)])
    end
    it "should tell the hand setter to set the hand" do
      mock_setter = double(HandSetter)
      mock_setter.should_receive(:set).with(%w(Ah Kh Qh Jh 10h)).and_return([])
      sut = Player.new(ChinesePokerHand.new, mock_setter)
      sut.set_hand(%w(Ah Kh Qh Jh 10h))
    end
  end
end

class FakeHandSetter
  def set(cards)
    []
  end
end
