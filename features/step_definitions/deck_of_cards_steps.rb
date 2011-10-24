Given /^I do not yet have a deck of cards$/ do
  @deck = nil
end

When /^I create a new deck of cards$/ do
  @deck = Deck.new
end

Then /^I should have a deck with 52 cards$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^they should have Ace, 2-10, Jack, Queen, King in four suits$/ do 
  pending # express the regexp above with the code you wish you had
end
