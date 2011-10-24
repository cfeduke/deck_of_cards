class Deck
  attr_reader :cards
  
  def initialize
    @cards = []
    Card::SUITS.each { |suit| @cards.concat Card.create_suit(suit) }
  end
  
  def shuffle!
    @cards.sort_by! { rand }
  end
end