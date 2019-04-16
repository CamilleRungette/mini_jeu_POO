require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "	  ----------------------------------------------------------------
	 |       Bienvenue sur 'ILS VEULENT TOUS MA POO'                 |
	 |       Le jeu comme fornite mais pas vraiment                  |
	 |		    !! EA sports, tseuneugèïm !!            	 |
	 -----------------------------------------------------------------"

puts "C'est quoi ton petit nom ?"
print ">"
human_name = gets.chomp

#définition des joueurs
	player1 = HumanPlayer.new("#{human_name}")
	player2 = Player.new("Captain America")
	player3 = Player.new("Dark Vador")

#création de l'array d'ennemis
	enemies = []
	enemies << player2
	enemies << player3

#Début de la partie :
puts "VOICI L'ETAT DE CHAQUE JOUEUR:"
puts "______________________________________"
	puts player1.show_state
	puts player2.show_state
	puts player3.show_state
puts 

puts "PASSONS A LA PHASE D'ATTAQUE:"
puts"______________________________________"
	while player1.life_points > 0 && (player2.life_points > 0 || player3.life_points > 0)
# Tant que moi et un des deux autres joueurs avons des points de vie, le jeu continue
# Le code qui suit laisse le choix au joueur de son action:
		print player1.show_state
		puts "Quelle action veux-tu effectuer?"
				puts
		puts"a - chercher une meilleur arme"
		puts"s - chercher des points de vies"
				puts
		puts"attaquer un joueur:"
		puts"y - #{player2.show_state}"
		puts"z - #{player3.show_state}"

			input = gets.chomp
#Les actions qui seront effectuées selon le choix du joueur:
		if input == "a"
			player1.search_weapon 
			puts "______________________________________"
		elsif input == "s"
			player1.search_health_pack
			puts "______________________________________"
		elsif input == "y"
			player1.attacks(player2)
			player2.show_state
			puts "______________________________________"
		else
			player1.attacks(player3)
			player3.show_state
			puts "______________________________________"
		end

puts "C'EST MAINTENANT LA PHASE DE RISPOSTE: "
puts"______________________________________"
	enemies.each do |enemy|
		if enemy.life_points > 0 #si l'ennemi a des points de vie il peut riposter
			enemy.attacks(player1)
		else
			puts "il est déjà mort" #sinon j'annonce qu'il est déjà mort et il ne joue pas'
			end
		end

	end
puts "		====================================================== 
 				--> LE JEU EST TERMINADOO <--
 		======================================================"
	if player1.life_points > player2.life_points && player1.life_points > player3.life_points
		# si à la sortie de la boucle le joueur humain a plus de points que les robots il a gagné
		puts "_________ !!!! MAIS QUEL CHAMPION, T'AS TOUT GAGNÉ!!!! _________"
	else
		puts "T'as le L de LOSER écrit sur ton front."
	end
