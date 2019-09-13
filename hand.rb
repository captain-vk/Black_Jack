# frozen_string_literal: true

class Hand
  attr_accessor :current_cards

  def initialize
    @current_cards = []
  end

  def count_score
    @score = 0
    @current_cards.each do |card|
      @score += card.cost_card
    end
    aces.times { @score -= 10 if @score > 21 }
    @score
  end

  private

  def aces
    @current_cards.count { |card| card.name == 'Ace' }
  end
end
