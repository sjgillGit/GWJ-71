# This node defines default traits for all creatures and provides methods for handling them

extends Node
class_name Creature_traits

# Default traits
@export var base_creature: String
@export var gender_male: bool = 1
@export var traits = {'size': 0, 'strength': 0, 'intelligence': 0, 'aggression': 0, 'cuteness': 0, 'speed': 0}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Prints all traits for debugging
func print_traits():
	print('Base creature: ', base_creature)
	print('Male: ', gender_male)
	for element in traits:
		print(element, ': ', traits[element])

# Changes all traits by given value. Accepts dictionary
func trait_change(change: Dictionary):
	for element in change:
		traits[element] += change[element]
		traits[element] = clamp(traits[element], 0, 100)
