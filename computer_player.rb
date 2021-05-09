# frozen_string_literal: true

class ComputerPlayer
  attr_reader :name
  
  def initialize
    @name = 'Computer'
    @correct_guesses = 0
    @correct_color = 0
  end

  def guess
    make_code
  end

  def receive_info(correct_guesses, correct_color)
    @correct_guesses = correct_guesses
    @correct_color = correct_color
  end

  def make_code
    code = ''
    4.times { code += rand(1..6).to_s }
    code
  end
end