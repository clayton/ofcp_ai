require 'spec_helper'

CategorizedHand = Struct.new(:rank_name)

describe "Hand Categorization" do
  describe "Integration Test" do
    it "should use an categorizer for categorization" do
      sut = HandCategorizer.new
      expect(sut.categorize(%w(Ah Ac Kc 10c Jd))).to eq("Pair")
    end
  end
  describe "Categorizing Draws" do
    it "should categorize a hand with four to a flush" do
      categorizer = FakeCategorizer.new
      categorizer.stub(:categorize).and_return(CategorizedHand.new("HighCard"))
      sut = HandCategorizer.new(categorizer)
      expect(sut.categorize(%w(Ah Ac Kc 10c Jd))).to eq("FourToAFlush")
    end
    it "should categorize a hand with an open ended straight" do
      # categorizer = FakeCategorizer.new
      # categorizer.stub(:categorize).and_return(CategorizedHand.new("HighCard"))
      # sut = HandCategorizer.new(categorizer)
      # expect(sut.categorize(%w(Kc Qc 10c Jd))).to eq("OpenEndedStraight")
    end
  end

end


class FakeCategorizer
  def categorize(stubbed_categorization)
  end
end
