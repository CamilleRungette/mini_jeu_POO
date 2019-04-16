require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("José")
player2 = Player.new("Carrie")

puts "VOICI L'ETAT DE CHAQUE JOUEUR:"
	puts player1.show_state
	puts player2.show_state
puts

puts "PASSONS A LA PHASE D'ATTAQUE:"
	while player1.life_points > 0 && player2.life_points >0
		print player1.attacks(player2)
		puts player2.show_state
			break if player2.life_points.to_i <= 0 
		puts
		puts
		print player2.attacks(player1)
		puts player1.show_state
		puts 
	end
