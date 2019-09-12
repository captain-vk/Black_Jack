# frozen_string_literal: true

class Interface
  def enter_name
    puts 'Игра Black Jack.'
    puts 'Введи своё имя:'
    gets.chomp
  end

  def gamers_turn
    line
    puts 'Выбери действие:'
    puts '1. Пропустить. Передать ход диллеру.'
    puts '2. Взять одну карту.'
    puts '3. Открыть карты.'
    line
  end

  def show_player(user)
    puts "Результаты #{user.name}:"
  end

  def show_cards_score(user)
    line
    puts "Текущие очки: #{user.count_score}"
    user.current_cards.each { |card| puts "#{card.lear} #{card.name} " }
    line
  end

  def show_cards_hidden
    puts 'Текущие очки дилера: * *'
  end

  def current_money(money)
    puts "Ваши текущие деньги: #{money}"
  end

  def gamer_won
    puts 'Вы победили!'
  end

  def dealer_won
    puts 'Победил Дилер.'
  end

  def draw
    puts 'Ничья!'
  end

  def play_again?
    puts 'Раунд окончен. Продолжить игру?'
    puts '1. Да'
    puts '2. Нет'
  end

  def line
    puts '--------------------------------------'
  end
end
