# frozen_string_literal: true

class Game
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
      @correct_guesses, @correct_colors = compare(@code, guess)
      puts game_message(guess)
      @code_breaker.receive_info(@correct_guesses, @correct_colors)
      break if @correct_guesses == 4
    end

    puts end_message
  end

  private
  
  def compare(code, guess)
    code = code.dup
    correct_guesses = 0
    correct_colors = 0

    0.upto(3) do |i|
      if code[i] == guess[i]
        correct_colors += 1
        code[i] = '_'
      elsif n = code.index(guess[i]) # the assignment is not a mistake
        correct_guesses += 1
        code[n] = '_'
      end
    end
    [correct_colors, correct_guesses]
  end

  def game_message(guess)
    "#{@code_breaker.name} guessed #{guess}\n" +
      "Correct guesses: #{@correct_guesses}\n" +
      "Correct colors guessed: #{@correct_colors}"
      end

  def end_message
    message = ''
    if @correct_guesses == 4
      message += "#{@code_breaker.name}, You won\n"
    else
      message += "#{@code_breaker.name}, You lost\n"
    end

    message += "Correct code is #{@code}"
  end
end
