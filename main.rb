# frozen_string_literal: true

require './human_player'
require './computer_player'
require './game'

def main
  choice = get_choice
  code_breaker = choice == 'b' ? HumanPlayer.new : ComputerPlayer.new
  code_maker = choice == 'm' ? HumanPlayer.new : ComputerPlayer.new
  Game.new(code_maker, code_breaker).start
end

def test
  game = Game.new(ComputerPlayer.new, ComputerPlayer.new)
  p game.compare('1234', '1214')
end

def get_choice
  choice = ''
  loop do
    puts 'Code Breaker[b] or Code Maker [m]'
    choice = gets.downcase.chomp
    p choice
    break if %w[b a].include?(choice)
  end
  choice
end

main
