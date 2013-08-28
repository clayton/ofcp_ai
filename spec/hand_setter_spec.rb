require 'spec_helper'

describe "Hand Setting" do
  it "should ask the hand categorizer what type of hand it's setting" do
    mock_categorizer = double(HandCategorizer)
    mock_categorizer.should_receive(:categorize).with(%w(Ah Kh Qh Jh 10h))
    sut = HandSetter.new(mock_categorizer)
    sut.set(%w(Ah Kh Qh Jh 10h))
  end
  context "When Dealt a Monster" do
    it "should set a royal flush on the bottom" do
      sut = HandSetter.new(StubbedCategorizer.new("RoyalFlush"))
      expect(sut.set(%w(Ah Kh Qh Jh 10h))).to eq([[],[],%w(Ah Kh Qh Jh 10h)])
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
