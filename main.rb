# puts rand(1000 .. 9999)

require './mastermind'

puts "The CodeMaker has chosen a 4 digit code for you to break \nYou have 10 attemps to break it"
game =  MasterMindGame.new(rand(1000 .. 9999))

game.play
