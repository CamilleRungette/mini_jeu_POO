require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("José")
player2 = Player.new("Carrie")

puts "Voici l'état de chaque joueur:"
puts player1.show_state
puts player2.show_state 
puts
puts "Passons à la phase d'attaque:"


# binding.pry