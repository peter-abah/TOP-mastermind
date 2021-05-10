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

def get_choice
  choice = ''
  loop do
    puts 'Code Breaker[b] or Code Maker [m]'
    choice = gets.downcase.chomp
    break if %w[b m].include?(choice)
  end
  choice
end

main
