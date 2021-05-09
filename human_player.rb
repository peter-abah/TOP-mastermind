# frozen_string_literal: true

class HumanPlayer
  attr_reader :name
  
  def initialize
    puts 'Enter your name'
    @name = gets
  end

  def make_code
    code = 0
    loop do
      puts 'Enter valid code'
      code = gets
      break if valid_code?(code)
    end
    code
  end

  def guess
    guess = 0
    loop do
      puts 'Guess a valid code'
      guess = gets
      break if valid_code?(guess)
    end
  end

  private

  def valid_code?(code)
    /^[1-6]{4}$/ =~ code
  end
end
