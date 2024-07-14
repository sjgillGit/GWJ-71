extends Node

# All possible mutations are stored here sorted by base creature type. 
# When a creature is modified we check if it's new traits match any of the mutations.
# If they do - we pick a random matching mutation, despawn old creature, spawn a new mutant with inherited traits
 
var rat_mutations = [buff_rat, splinter]
var dog_mutations = []
var monkey_mutations = []
var rabbit_mutations = []

var buff_rat = {  
	"name": 'creature_rat_buff',
	"req": {
		"base_creature": 'rat',
		"strength_min": 50
			}
}

var splinter = {  
	"name": 'creature_rat_splinter',
	"req": {
		"base_creature": 'rat',
		"strength_min": 50,
		"speed_min": 60,
		"intelligence_min": 70
			}
}

var aggressive_rat = {  
	"name": 'creature_rat_aggressive',
	"req": {
		"base_creature": 'rat',
		"aggression_min": 60
			}
}
