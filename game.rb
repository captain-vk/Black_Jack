# frozen_string_literal: true

require_relative 'interface'
require_relative 'gamer'
require_relative 'dealer'
require_relative 'deck'

class Game
  attr_reader :gamer, :dealer, :deck, :interface

  ACTIONS_MENU = { '1': 'dealers_turn', '2': 'extra_card', '3': 'reavel_cards' }.freeze

  def initialize
    @interface = Interface.new
    @gamer = Gamer.new(interface.enter_name)
    @dealer = Dealer.new
    start_game
  end

  def start_game
    @deck = Deck.new
    round
    @interface.show_cards_score(@gamer)
    @interface.show_cards_hidden
    gamers_turn
  end

  def round
    @deck.cards.shuffle!
    @gamer.bet!
    @dealer.bet!
    @gamer.card_distribution(@deck)
    @dealer.card_distribution(@deck)
  end

  def gamers_turn
    @interface.gamers_turn
    input = gets.chomp.to_sym
    send ACTIONS_MENU[input]
    reavel_cards
  end

  def can_extra?
    @gamer.current_cards.length < 3
  end

  def dealer_can_extra?
    @dealer.current_cards.length < 3
  end

  def extra_card
    @gamer.take_card(@deck) if can_extra?
    dealers_turn
  end

  def dealer_extra
    @dealer.take_card(@deck)
    reavel_cards
  end

  def dealers_turn
    return reavel_cards if @dealer.count_score >= 17

    dealer_extra if dealer_can_extra? && @gamer.count_score < 22
  end

  def reavel_cards
    @interface.show_player(@gamer)
    @interface.show_cards_score(@gamer)
    @interface.show_player(@dealer)
    @interface.show_cards_score(@dealer)
    calc_results
    play_again?
  end

  def calc_results
    case winner
    when @gamer
      @gamer.money += 20
      @interface.gamer_won
    when @dealer
      @dealer.money += 20
      @interface.dealer_won
    when 'draw'
      @gamer.money += 10
      @dealer.money += 10
      @interface.draw
    end
    @interface.current_money(@gamer.money)
  end

  def winner
    return @dealer if @gamer.score > 21
    return @gamer if @dealer.score > 21
    return @gamer if @gamer.score > @dealer.score && @gamer.score <= 21
    return @dealer if @dealer.score > @gamer.score && @dealer.score <= 21

    'draw' if @dealer.score == @gamer.score
  end

  def play_again?
    @interface.play_again?
    input = gets.chomp.to_i
    start_game if input == 1
    exit if input == 2
    play_again?
  end
end

game = Game.new
game