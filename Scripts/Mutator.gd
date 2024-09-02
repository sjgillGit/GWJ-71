extends Node
@onready var creature_ind_ON = $Meshes/IndicatorCreatureON
@onready var creature_ind_OFF = $Meshes/IndicatorCreatureOFF
@onready var left_slot = $LeftSlot
# This code will become a part of the "mutator machine", which takes an animal cage(starting_traits) 
# and a vial with chemicals(trait_change), changes the creature and checks if it matches any possible mutations

func _ready():
	state_update()

func mutate(): # Accepts a creature node and a "chemicals vial" this is a placeholder for now
	# var starting_traits = creature_node.creature_traits
	# var type = creature_node.Creature_traits.base_creature
	var type = 'rat'
	var starting_traits = {'size': randi_range(1, 5),           'strength': randi_range(1, 8),
						   'intelligence': randi_range(1, 8),   'aggression': randi_range(1, 10),
						   'cuteness': randi_range(5, 12),      'speed': randi_range(10, 35)}
	
	# accepts the 'chemicals vial' node with a "traits" parameter
	# var trait_change = vial.traits
	var trait_change = {'size': randi_range(-50, 50),             'strength': randi_range(-50, 50),
						'intelligence': randi_range(-50, 50),     'aggression': randi_range(-50, 50),
						'cuteness': randi_range(-50, 50),         'speed': randi_range(-50, 50)}
	
	var new_traits = starting_traits + trait_change
	var mutations = CreatureTypes.get(type)
	var possible_mutations = []
	for mutation in mutations:
		if new_traits['size'] not in mutation.req['size']: continue
		if new_traits['strength'] not in mutation.req['strength']: continue
		if new_traits['intelligence'] not in mutation.req['intelligence']: continue
		if new_traits['aggression'] not in mutation.req['aggression']: continue
		if new_traits['cuteness'] not in mutation.req['cuteness']: continue
		if new_traits['speed'] not in mutation.req['speed']: continue
		possible_mutations.append(mutation['name'])
	
	if not possible_mutations.is_empty():
		var mutation_picked = possible_mutations.pick_random()
		print(mutation_picked)


func state_update():
	if left_slot.creature_inside:
		creature_ind_ON.visible = true
	else:
		creature_ind_ON.visible = false
	

