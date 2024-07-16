extends Node

class_name PhysicsMaterials

static var values = {
	0.7: Enums.FootstepsMaterial.Stone, 
	0.9: Enums.FootstepsMaterial.Wood 
}

static func get_material(friction: float) -> Enums.FootstepsMaterial:
	for key in values.keys():
		if abs(friction - key) < 0.01:
			return values[key]
	
	return Enums.FootstepsMaterial.Stone
