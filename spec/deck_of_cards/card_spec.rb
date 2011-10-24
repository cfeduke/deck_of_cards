require 'spec_helper'

module DeckOfCards
  describe Card do
    context "valid values" do
      describe "#initialize" do
        before { @card = Card.new(:hearts, :king) }

        it { @card.should_not == nil }
        it { @card.suit.should == :hearts }
        it { @card.face.should == :king }

      end

      describe "#from_ordinal" do
        before { @card = Card.from_ordinal(1, 12) }
      
        it { @card.should_not == nil }
        it { @card.suit.should == :spades }
        it { @card.face.should == :king }
      end
    end
    
    context "invalid values" do
      describe "#initialize" do
        it "returns nil suit when an invalid suit is specified" do
          card = Card.new 12, :eight
          card.suit.should == nil
        end
        it "returns nil face when an invalid face is specified" do
          card = Card.new :spades, 'abc'
          card.face.should == nil
        end
      end
      
      describe "#from_ordinal" do
        it "has nil suit when suit index is out of range" do
          card = Card.from_ordinal(5, 4)
          card.suit.should == nil
        end
        it "has nil face when face index is out of range" do
          card = Card.from_ordinal(1, 42)
          card.face.should == nil
        end
      end
    end
  end
end