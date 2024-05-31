# puts rand(1000 .. 9999)

require './mastermind'

puts "The CodeMaker has chosen a 4 digit code for you to break \nYou have 15 attemps to break it"
game =  MasterMindGame.new(rand(1000 .. 9999))
game.play
guess = game.get_guess
print game.check_right_places(guess)
puts
print game.check_right_digits(guess)
puts
