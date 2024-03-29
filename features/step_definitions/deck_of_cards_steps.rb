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
 Card::SUITS.each_index do | suit_index |
    suit = Card::SUITS[suit_index]
   Card::FACES.each_index do | face_index |
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

Then /^I should have a deck of 52 randomly ordered cards$/ do
  ordered_deck = Deck.new
  @deck.cards.should_not == ordered_deck.cards
end

Given /^I have a deck of 52 randomly ordered cards$/ do
  @deck = Deck.new
  @deck.shuffle!
end

When /^there are 52 cards remaining$/ do
  @deck.cards.count.should >= 1
end

When /^I deal a card$/ do
  @dealt_card = @deck.deal_one_card
end

Then /^I should be dealt a card$/ do
  @dealt_card.should_not == nil
end

Then /^I should have one less card remaining in the deck$/ do
  @deck.cards.count.should == 51
end

Given /^I have a deck with no cards remaining$/ do
  Given("I create a new deck of cards")
  52.times { @deck.deal_one_card }
end

Then /^I should not be dealt a card$/ do
  @dealt_card = @deck.deal_one_card
  @dealt_card.should == nil
end

When /^I deal a card 52 times$/ do
  @dealt_cards = []
  52.times { @dealt_cards << @deck.deal_one_card }
end

Then /^I should not have any been dealt any duplicate cards$/ do
  @dealt_cards.uniq.count.should == 52
end
