class Card
  
  SUITS = [ :hearts, :spades, :clubs, :diamonds ]
  FACES = [ :ace, :two, :three, :four, :five,
    :six, :seven, :eight, :nine, :ten, :jack,
    :queen, :king]
  
  attr_reader :suit, :face
  
  def initialize(suit, face)
    @suit = suit if SUITS.include? suit
    @face = face if FACES.include? face
  end
  
  class << self  
    def from_ordinal(suit_index, face_index)
      Card.new SUITS[suit_index], FACES[face_index]
    end
  end
end