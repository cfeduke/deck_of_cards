require 'spec_helper'

module DeckOfCards
  describe Deck do
    describe "#initialize" do
      before { @deck = Deck.new }
      it "creates a deck with 52 cards" do
        @deck.cards.count.should == 52
      end
    end
  end
end