require_relative 'card'

class Deck
  SUITES = %w[♠ ♥ ♦ ♣].freeze
  CARD_NAMES = %w[2 3 4 5 6 7 8 9 10 Jack Queen King Ace].freeze
  VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11].freeze

  attr_accessor :cards

  def initialize
    @cards = []
    create_deck
  end

  def shuffle!
    @cards.shuffle!
  end

  private

  def create_deck
    SUITES.each do |suit|
      CARD_NAMES.each_with_index do |name, index|
        @cards << Card.new(name, suit, VALUES[index])
      end
    end
  end
end