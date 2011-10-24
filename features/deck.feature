Feature: system creates deck of cards

  As the system
  I want to create a deck of 52 playing cards
  
  @wip
  Scenario: create a deck of 52 playing cards
  Given I do not yet have a deck of cards
  When I create a new deck of cards
  Then I should have a deck with 52 cards
  And they should have Ace, 2-10, Jack, Queen, King in four suits