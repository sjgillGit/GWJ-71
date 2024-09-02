extends StaticBody3D
var player_cam

# Called when the node enters the scene tree for the first time.
func _ready():
	player_cam = get_tree().get_first_node_in_group('player_cam')

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	handle_input()

func interact():
	if !$"../gui3d/SubViewport/laptop screen".visible:
		$"../gui3d/SubViewport/laptop screen".visible = true
		$"../StartupSound".play()
	
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	$"../Camera3D".current = true


func handle_input():
	if Input.is_action_just_pressed("ui_cancel") or Input.is_action_just_pressed("RMB"):
		player_cam.current = true
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		$"../gui3d".mouse_entered = false

