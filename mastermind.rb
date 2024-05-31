
class MasterMindGame

  attr_accessor :attemps, :rigth_places, :right_digits

  def initialize(code)
    @code = code.to_s.split("")
    @attemps = 1
    @rigth_places = 0
    @right_digits = 0
  end

  def get_guess()
    puts 'Select your guess (4 digit long): '
    guess = gets.to_s.chomp.split("")
    while guess.length != 4
      puts 'Invalid guess (Must be a 4 digit number)'
      guess = gets.to_s.chomp.split("")
    end
    return guess
  end

  def check_guess(guess)
    @code == guess
  end

  def check_right_places(guess)
    guess.length.times do |i|
      if (guess[i] == @code[i])
        @rigth_places += 1
      end
    end
    return @rigth_places
  end


  ## ARREGLAR ESTO
  def check_right_digits(guess)
    guess.length.times do |i|
      if (@code.include?(guess[i]) && @code[i] != guess[i])
        @right_digits += 1
      end
    end
    return @right_digits
  end

  def play
    print @code
    puts 
  end

end



