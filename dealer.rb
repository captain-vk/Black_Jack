require_relative 'deck'

class Player
  attr_reader :current_cards, :score
  attr_accessor :money, :name

  def initialize(name)
    @name = name
    @money = 100
    @current_cards = []
    @score = 0    
  end

  def start
    @money -= 10
  end

  def count_score
    @score = 0
    @current_cards.each do |card|
    @score += card.value
    end
    if ace and @score > 21
      @score -= 10
    end
    @score
  end

  def card_distribution(deck)
    2.times do
      take_card(deck)
    end
  end

  def take_card(deck)
    current_cards << deck.cards[0]
    deck.cards.delete_at(0)    
  end

  def ace
    @current_cards.each { |card| card.name == 'Ace' }
  end
end