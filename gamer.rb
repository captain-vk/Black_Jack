# frozen_string_literal: true

class Gamer
  attr_accessor :name, :money, :hand

  def initialize(name = 'Gamer')
    @name = name
    @money = 100
    @hand = Hand.new
  end

  def bet!
    @money -= 10
  end
end
