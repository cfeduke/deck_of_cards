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
        before { @card = Card.from_ordinal(:spades, 12) }
      
        it { @card.should_not == nil }
        it { @card.suit.should == :spades }
        it { @card.face.should == :king }
      end
      
      describe "#create_suit" do
        before { @suit = Card.create_suit(:spades) }
        
        it { @suit.should_not == nil }
        it { @suit.count.should == 13 }
        it { @suit[0].suit.should == :spades }
        it "contains all the face values" do
          @suit.each_index do |i|
            @suit[i].face.should == Card::FACES[i]
          end
        end
      end
      
      describe "#==" do
        it "should be equal when suit and face value match" do
          card = Card.new(:spades, :nine)
          card.should == Card.new(:spades, :nine)
        end
      end
    end
    
    context "invalid values" do
      describe "#initialize" do
        it "returns nil suit when an invalid suit is specified" do
          card = Card.new 3, :eight
          card.suit.should == nil
        end
        it "returns nil face when an invalid face is specified" do
          card = Card.new :spades, 'abc'
          card.face.should == nil
        end
      end
      
      describe "#from_ordinal" do
        it "has nil suit when suit is invalid" do
          card = Card.from_ordinal(5, 4)
          card.suit.should == nil
        end
        it "has nil face when face index is out of range" do
          card = Card.from_ordinal(:diamonds, 42)
          card.face.should == nil
        end
      end
      
      describe "#create_suit" do
        it "is nil when suit is invalid" do
          suit = Card.create_suit(:blah)
          suit.should == nil
        end
      end
    end
  end
end