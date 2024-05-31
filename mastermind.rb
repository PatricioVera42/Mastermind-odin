
class MasterMindGame

  attr_accessor :attemps, :rigth_places, :right_digits

  def initialize(code)
    @code = code.to_s.split("")
    @attemps = 0
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
    guess.each_index.reduce(0) { |count, i| @code[i] == guess[i] ? count + 1 : count }
  end

  def check_right_digits(guess)
    filtered_guess = guess.select.with_index { |number, i| @code.include?(number) && @code[i] != number }
    filtered_code = @code.select.with_index { |number, i| guess.include?(number) && guess[i] != number }

    res = 0

    filtered_code.each do |val|
      if filtered_guess.include?(val)
        res += 1
        filtered_guess.delete_at filtered_guess.find_index(val)
      end
    end

    res
  end


  def play
    10.times do
      puts
      @attemps += 1
      guess = get_guess()
      if (check_guess(guess))
        puts "You have broken the code, you did it in #{@attemps} attemps"
        return
      else
        @check_right_digits = check_right_digits(guess)
        @check_right_places = check_right_places(guess)
        puts "Incorrect Guess, you still have #{10 - attemps} attemps"
        puts "There are #{@check_right_places} digits in the right place" if (@check_right_places != 0)
        puts "There are #{@check_right_digits} digits that are included in the code but are in the wrong place" if (@check_right_digits != 0)
      end
    end
    puts
    puts "You've lost the game, the right code was #{@code.join}"
  end

end



