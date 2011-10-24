Feature: dealer shuffles cards

  As a card dealer
  I want to shuffle the deck

  Scenario: shuffle deck
    Given I have a deck of 52 ordered cards
    When I shuffle the deck
    Then I should have a deck of 52 randomly ordered cards