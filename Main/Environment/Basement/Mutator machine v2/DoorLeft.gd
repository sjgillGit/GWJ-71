extends StaticBody3D
var open = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func interact():
	if not open and not $"../AnimationPlayer".is_playing():
		$"../AnimationPlayer".play("DoorLeftOpen")
		open = true
	if open and not $"../AnimationPlayer".is_playing():
		$"../AnimationPlayer".play("DoorLeftClose")
		open = false
