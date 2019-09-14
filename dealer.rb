# frozen_string_literal: true

class Dealer
  attr_accessor :money, :name, :hand

  def initialize(name = 'dealer')
    @money = 100
    @name = name
    @hand = Hand.new
  end

  def bet!
    @money -= 10
  end
end
