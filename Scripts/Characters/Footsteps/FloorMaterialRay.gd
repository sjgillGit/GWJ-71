extends RayCast3D

@export
var footsteps_handler: FootstepsHandler


func _process(_delta):
	if is_colliding():
		var object = get_collider()
		if object is StaticBody3D:
			var material = object.physics_material_override
			if material == null: return
			
			var physics_material = PhysicsMaterials.get_material(material.friction)
			footsteps_handler.material = physics_material
