Feature: dealer deals cards

  As a card dealer
  I want to deal a card

  Scenario: deal one card
    Given I have a deck of 52 randomly ordered cards
    When there are 52 cards remaining
    And I deal a card
    Then I should be dealt a card
    And I should have one less card remaining in the deck

  Scenario: deal no cards
    Given I have a deck with no cards remaining
    When I deal a card
    Then I should not be dealt a card
  
  @wip  
  Scenario: deal all cards
    Given I have a deck of 52 randomly ordered cards
    When I deal a card 52 times
    Then I should be dealt a card I have not seen before