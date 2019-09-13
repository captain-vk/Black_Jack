# frozen_string_literal: true

class Card
  attr_reader :name, :lear, :value

  LEARS = %w[♠ ♥ ♦ ♣].freeze
  NAMES = %w[2 3 4 5 6 7 8 9 10 Jack Queen King Ace].freeze
  VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10, 11].freeze

  def initialize(name, lear, value)
    @name = name
    @lear = lear
    @value = value
  end

  def cost_card
    value
  end
end
