extends Node3D


# Initializing creature traits
func _ready():
	var trait_range = {'size': randi_range(1, 5),          'strength': randi_range(1, 8),
					   'intelligence': randi_range(1, 8),  'aggression': randi_range(1, 10),
					   'cuteness': randi_range(5, 12),     'speed': randi_range(10, 35)}
	
	print('Creature created: ', name)
	$Creature_traits.base_creature = 'rat'
	$Creature_traits.gender_male = randi_range(0, 1)
	$Creature_traits.trait_change(trait_range)
	$Creature_traits.print_traits()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
