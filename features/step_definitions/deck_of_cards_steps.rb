Given /^I do not yet have a deck of cards$/ do
  @deck = nil
end

When /^I create a new deck of cards$/ do
  @deck = Deck.new
end

Then /^I should have a deck with 52 cards$/ do
  @deck.cards.count.should == 52
end

Then /^they should have Ace, 2-10, Jack, Queen, King in four suits$/ do 
  Card::SUITS.each_index do |suit_index|
    suit = Card::SUITS[suit_index]
    Card::FACES.each_index do |face_index|
      card = @deck.cards[(suit_index * 13) + face_index]
      card.suit.should == suit
      card.face.should == Card::FACES[face_index]
    end
  end
end

Given /^I have a deck of 52 ordered cards$/ do
  When("I create a new deck of cards")
end

When /^I shuffle the deck$/ do
  @deck.shuffle!
end

Then /^I should have a deck of (\d+) randomly ordered cards$/ do |arg1|
  ordered_deck = Deck.new
  deck = Deck.new
  deck.cards.should_not == ordered_deck.cards
end