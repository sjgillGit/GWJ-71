extends Node

#--------------------
# Moving player on scene by keyboard
#--------------------

@export
var player: CharacterBody3D

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var is_landing: bool


func _physics_process(delta: float) -> void:
	handle_gravity(delta)
	handle_running()
	handle_jump()
	update_player_velocity()
	player.move_and_slide()


func handle_gravity(delta: float) -> void:
	if not player.is_on_floor():
		player.velocity.y -= gravity * delta


func handle_jump() -> void:
	if !player.may_move: return
	if !player.is_on_floor():
		is_landing = true
		return
	
	if Input.is_action_just_pressed("ui_accept"):
		player.velocity.y = player.JUMP_VELOCITY
		player.Jump.emit()
	
	if is_landing:
		player.Land.emit()
		is_landing = false


func handle_running() -> void:
	player.is_running = Input.is_action_pressed("ui_run") \
		if player.may_move and player.is_on_floor() \
		else false


func update_player_velocity() -> void:
	var direction = get_direction() if player.may_move else Vector3.ZERO
	var speed = get_player_speed()
	if direction:
		player.velocity.x = direction.x * speed
		player.velocity.z = direction.z * speed
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, speed)
		player.velocity.z = move_toward(player.velocity.z, 0, speed)


func get_direction() -> Vector3:
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	return (player.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()


func get_player_speed() -> float:
	return player.RUNNING_SPEED if player.is_running else player.SPEED
