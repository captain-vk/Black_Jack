# frozen_string_literal: true

require_relative 'card'

class Dealer
  attr_reader :score
  attr_accessor :money, :name, :current_cards

  def initialize(name = 'dealer')
    @money = 100
    @current_cards = []
    @score = 0
    @name = name
  end

  def bet!
    @money -= 10
  end

  def count_score
    @score = 0
    @current_cards.each do |card|
      @score += card.cost_card
    end
    aces.times { @score -= 10 if score > 21 }
    @score
  end

  private

  def aces
    @current_cards.count { |card| card.name == 'Ace' }
  end
end
