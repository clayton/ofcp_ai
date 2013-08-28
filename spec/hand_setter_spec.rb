require 'spec_helper'

describe "Hand Setting" do
  it "should ask the hand categorizer what type of hand it's setting" do
    mock_categorizer = double(HandCategorizer)
    mock_categorizer.should_receive(:categorize).with(%w(Ah Kh Qh Jh 10h))
    sut = HandSetter.new(mock_categorizer)
    sut.set(%w(Ah Kh Qh Jh 10h))
  end
  context "When Dealt a Monster" do
    it "should set a royal flush on the back" do
      sut = HandSetter.new(StubbedCategorizer.new("RoyalFlush"))
      expect(sut.set(%w(Ah Kh Qh Jh 10h))).to eq([[],[],%w(Ah Kh Qh Jh 10h)])
    end
    it "should set a straightflush on the back" do
      sut = HandSetter.new(StubbedCategorizer.new("StraightFlush"))
      expect(sut.set(%w(Kh Qh Jh 10h 9h))).to eq([[],[],%w(Kh Qh Jh 10h 9h)])
    end
    it "should set a flush on the back" do
      sut = HandSetter.new(StubbedCategorizer.new("Flush"))
      expect(sut.set(%w(Kh 6h Jh 10h 9h))).to eq([[],[],%w(Kh 6h Jh 10h 9h)])
    end
    it "should set a straight on the back" do
      sut = HandSetter.new(StubbedCategorizer.new("Straight"))
      expect(sut.set(%w(Kc Qh Js 10h 9h))).to eq([[],[],%w(Kc Qh Js 10h 9h)])
    end
    it "should set a full house on the back" do
      sut = HandSetter.new(StubbedCategorizer.new("FullHouse"))
      expect(sut.set(%w(Kc Ks Kh Jh Jc))).to eq([[],[],%w(Kc Ks Kh Jh Jc)])
    end
    it "should set a four of a kind on the back" do
      sut = HandSetter.new(StubbedCategorizer.new("FourOfAKind"))
      expect(sut.set(%w(Kc Ks Kh Kd Jc))).to eq([[],[],%w(Kc Ks Kh Kd Jc)])
    end
  end
  context "When Dealt a Strong Draw" do
    it "should put four to a flush in the bottom" do
      sut = HandSetter.new(StubbedCategorizer.new("FourToFlush"))
      expect(sut.set(%w(8c Kh Qh Jh 10h))).to eq([[],%w(8c),%w(Kh Qh Jh 10h)])
    end
  end
end

class StubbedCategorizer
  def initialize(stubbed_hand)
    @stubbed_hand = stubbed_hand
  end

  def categorize(hand)
    @stubbed_hand
  end
end
