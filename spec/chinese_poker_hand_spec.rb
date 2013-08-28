require 'spec_helper'

describe "Chinese Poker Hand" do
  it "should initialize an empty hand" do
    sut = ChinesePokerHand.new
    expect(sut.front).to eq([])
    expect(sut.middle).to eq([])
    expect(sut.back).to eq([])
  end
  it "should build a starting hand from the initial set of cards" do
    sut = ChinesePokerHand.new
    sut.build([["Qh"],["Kh"],["Ah"]])
    expect(sut.current_hand).to eq([["Qh"],["Kh"],["Ah"]])
  end
end
