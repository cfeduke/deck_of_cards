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
    def from_ordinal(suit, face_index)
      Card.new suit, FACES[face_index]
    end
    
    def create_suit(suit)
      return nil unless SUITS.include? suit
      cards = []
      (0..12).each { |i| cards << Card.from_ordinal(suit, i) }
      cards
    end
  end
end