# frozen_string_literal: true

require_relative 'dealer'

class Gamer < Dealer
  attr_accessor :name

  def initialize(name = 'Gamer')
    @name = name
    super
  end
end
