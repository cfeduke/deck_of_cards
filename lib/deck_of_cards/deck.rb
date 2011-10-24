class Deck
  attr_reader :cards
  
  def initialize
    @cards = []
    Card::SUITS.each { |suit| @cards.concat Card.create_suit(suit) }
  end
  
  def shuffle!
    # I bet you were hoping to find something far, far more interesting...
    @cards.sort_by! { rand }
  end
  
  def deal_one_card
    @cards.pop
  end
end