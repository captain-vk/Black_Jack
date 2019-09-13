# frozen_string_literal: true

require_relative 'card'

class Deck
  attr_accessor :cards

  def initialize
    @cards = []
    create_deck
  end

  def shuffle!
    @cards.shuffle!
  end

  # private

  def create_deck
    Card::LEARS.each do |lear|
      Card::NAMES.each_with_index do |name, index|
        @cards << Card.new(name, lear, Card::VALUES[index])
      end
    end
  end
end
