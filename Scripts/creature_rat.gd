extends Node3D
class_name Rat

# Initializing creature traits
func _ready():
	var traits = $Creature_traits
	var trait_range = {'size': randi_range(1, 5),          'strength': randi_range(1, 8),
					   'intelligence': randi_range(1, 8),  'aggression': randi_range(1, 10),
					   'cuteness': randi_range(5, 12),     'speed': randi_range(10, 35)}
	
	print('Creature created: ', name)
	traits.base_creature = 'rat'
	traits.gender_male = randi_range(0, 1)
	traits.trait_change(trait_range)
	traits.print_traits()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
