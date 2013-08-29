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
      sut = HandCategorizer.new
      expect(sut.categorize(%w(8c Ac Kc 10c Jd))).to eq("FourToAFlush")
    end
    it "should categorize a hand with an open ended straight" do
      sut = HandCategorizer.new
      expect(sut.categorize(%w(4d Kc Qc 10c Jd))).to eq("OpenEndedStraight")
    end
  end

end


class FakeCategorizer
  def categorize(stubbed_categorization)
  end
end
