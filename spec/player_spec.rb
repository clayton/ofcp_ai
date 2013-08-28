require 'spec_helper'

describe "Player" do
  context "Setting the initial Hand" do
    it "should be able to set the initial hand" do
      sut = Player.new
      sut.set_hand(%w(Ah Kh Qh Jh 10h))
      expect(sut.hand).to eq([[],[], %w(Ah Kh Qh Jh 10h)])
    end
    it "should build a new Chinese Poker Hand when setting the initial hand" do
      mock_hand = double(ChinesePokerHand)
      mock_hand.should_receive(:build).with([[],[],%w(Ah Kh Qh Jh 10h)])
      sut = Player.new(mock_hand)
      sut.set_hand(%w(Ah Kh Qh Jh 10h))
    end
    it "should get its current hand from its poker hand" do
      poker_hand = ChinesePokerHand.new
      poker_hand.stub(:current_hand).and_return([%w(Qh),%w(Kh),%w(Ah)])
      sut = Player.new(poker_hand)
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
