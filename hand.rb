# frozen_string_literal: true

require_relative 'interface'
require_relative 'gamer'
require_relative 'dealer'
require_relative 'deck'
require_relative 'hand'

class Hand

  attr_reader :dealer, :gamer, :draw

    dealer if @gamer.score > 21
    gamer if @dealer.score > 21
    gamer if @gamer.score > @dealer.score && @gamer.score <= 21
    dealer if @dealer.score > @gamer.score && @dealer.score <= 2

    draw if @dealer.score == @gamer.score

end