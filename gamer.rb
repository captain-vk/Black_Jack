# frozen_string_literal: true

class Gamer
  attr_accessor :name, :money

  def initialize(name = 'Gamer')
    @name = name
    @money = 100
  end

  def bet!
    @money -= 10
  end
end
