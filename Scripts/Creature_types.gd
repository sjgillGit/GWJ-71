extends Node

# All possible mutations are stored here sorted by base creature type. 
# When a creature is modified we check if it's new traits match any of the mutations.
# If they do - we pick a random matching mutation, despawn old creature, spawn a new mutant with inherited traits

var buff_rat = {  
	"name": 'creature_rat_buff',
	"base_creature": 'rat',
	"req": {
		'size':         range(0, 100), 
		"strength":     range(50, 100),
		'intelligence': range(0, 100), 
		'aggression':   range(0, 100), 
		'cuteness':     range(0, 100), 
		'speed':        range(0, 100)
		}
}

var splinter = {  
	"name": 'creature_rat_splinter',
	"base_creature": 'rat',
	"req": {
		'size':         range(0, 100), 
		"strength":     range(50, 100),
		'intelligence': range(70, 100), 
		'aggression':   range(0, 100), 
		'cuteness':     range(0, 100), 
		'speed':        range(60, 100)
			}
}

var aggressive_rat = {  
	"name": 'creature_rat_aggressive',
	"base_creature": 'rat',
	"req": {
		'size':         range(0, 100), 
		"strength":     range(0, 100),
		'intelligence': range(0, 100), 
		'aggression':   range(70, 100), 
		'cuteness':     range(0, 100), 
		'speed':        range(0, 100)
			}
}

var rat = [buff_rat, splinter, aggressive_rat]
var dog = []
var monkey = []
var rabbit = []
