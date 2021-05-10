# frozen_string_literal: true

require './player'
require './code_compare'

class ComputerPlayer < Player
  include CodeCompare

  attr_reader :name

  def initialize
    super
    @name = 'Computer'
    @possible_codes = gen_possible_codes
    @correct_guesses = 0
    @correct_colors = 0
    @prev_guess = nil
  end

  def guess
    @prev_guess ? @prev_guess = guess_code : @prev_guess = '1122'
  end

  def receive_info(correct_guesses, correct_colors)
    @correct_guesses = correct_guesses
    @correct_colors = correct_colors
  end

  def make_code
    code = ''
    4.times { code += rand(1..6).to_s }
    code
  end

  private

  def gen_possible_codes
    codes = []
    0.upto(6666) do |n|
      next if n == 1122

      codes.push(n.to_s.rjust(4, '0'))
    end
    codes
  end

  def guess_code
    @possible_codes = @possible_codes.select do |code|
      correct_guesses, correct_colors = compare_code(code, @prev_guess)
      @correct_colors == correct_colors && @correct_guesses == correct_guesses
    end
    @possible_codes.shift()
  end
end
