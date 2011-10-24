class Deck
  attr_reader :cards
  
  def initialize
    @cards = []
    Card::SUITS.each { |suit| @cards.concat Card.create_suit(suit) }
  end
end