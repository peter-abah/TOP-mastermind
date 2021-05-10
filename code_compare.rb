# frozen_string_literal: true

module CodeCompare
  def compare_code(code, guess)
    code = code.dup
    correct_guesses = 0
    correct_colors = 0

    0.upto(3) do |i|
      if code[i] == guess[i]
        correct_guesses += 1
        code[i] = '_'
      elsif (n = code.index(guess[i]))
        correct_colors += 1
        code[n] = '_'
      end
    end
    [correct_guesses, correct_colors]
  end
end
