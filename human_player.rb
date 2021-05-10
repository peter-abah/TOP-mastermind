# frozen_string_literal: true

require './player'

class HumanPlayer < Player
  attr_reader :name

  def initialize
    super
    puts 'Enter your name'
    @name = gets.chomp
  end

  def make_code
    code = 0
    loop do
      puts 'Enter valid code'
      code = gets.chomp
      break if valid_code?(code)
    end
    code
  end

  def guess
    guess = 0
    loop do
      puts 'Guess a valid code'
      guess = gets.chomp
      break if valid_code?(guess)
    end
    guess
  end

  private

  def valid_code?(code)
    /^[1-6]{4}$/ =~ code
  end
end
