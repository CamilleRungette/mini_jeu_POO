require 'pry'

class Player
	attr_accessor :name, :life_points

	def initialize(name)
		@name = name
		@life_points = 10 		
	end

# _______________________

	def show_state
		puts "#{name} a #{@life_points} points de vie"
	end

#_________________________

	def gets_damage(damage)
		@life_points = @life_points - damage
		@life_points <= 0 ? "#{name} a été tué ! Points de vie: #{@life_points}" : "Il reste #{life_points} point à #{name}."
		return 
	end

#_________________________

	def attacks(ennemi)
		dice = compute_damage
		puts "Le joueur #{name} attaque le joueur #{ennemi.name}."
		"Il lui inflige #{dice} points de dommages."
	end

	def compute_damage
	   return rand(1..6)
	end


end
