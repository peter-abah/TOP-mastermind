# frozen_string_literal: true
require './code_compare'

class Game
  include CodeCompare

  def initialize(code_maker, code_breaker)
    @code_maker = code_maker
    @code_breaker = code_breaker
    @code = code_maker.make_code
    @correct_guesses = 0
    @correct_colors = 0
  end

  def start
    8.times do
      guess = @code_breaker.guess
      @correct_guesses, @correct_colors = compare_code(@code, guess)
      puts game_message(guess)
      @code_breaker.receive_info(@correct_guesses, @correct_colors)
      break if @correct_guesses == 4
    end

    puts end_message
  end

  def game_message(guess)
    "#{@code_breaker.name} guessed #{guess}\n" \
      "Correct guesses: #{@correct_guesses}\n" \
      "Correct colors guessed: #{@correct_colors}"
  end

  def end_message
    message = ''
    if @correct_guesses == 4
      message += "#{@code_breaker.name}, You won\n"
    else
      message += "#{@code_breaker.name}, You lost\n"
    end

    message + "Correct code is #{@code}"
  end
end
