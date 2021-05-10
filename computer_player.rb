# frozen_string_literal: true
require './player'

class ComputerPlayer < Player
  attr_reader :name

  def initialize
    super
    @name = 'Computer'
    @correct_guesses = 0
    @correct_colors = 0
  end

  def guess
    make_code
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
end