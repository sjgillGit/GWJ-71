extends Node

class_name FootstepsHandler

const WALK_TIMER = 0.5
const RUN_TIMER = 0.25

@export
var audio_player: AudioStreamPlayer3D

@export
var player: Player

@export
var default_material: Enums.FootstepsMaterial

var material: Enums.FootstepsMaterial
var sounds: Array
var timer: float


func _ready() -> void:
	material = default_material
	sounds = get_children()
	
	await get_tree().process_frame
	
	player.Jump.connect(_on_player_jump)
	player.Land.connect(_on_player_land)


func _process(delta: float) -> void:
	if player.velocity.length() <= 0 or !player.is_on_floor(): 
		timer = 0
		return
	
	if timer > 0:
		timer -= delta
		return
	
	sound_step()
	timer = RUN_TIMER if player.is_running else WALK_TIMER


func sound_step() -> void:
	var footstep_sound = get_footstep_sound()
	var sound_variants = footstep_sound.run_variants \
		if player.is_running \
		else footstep_sound.walk_variants
	
	var rand_sound = sound_variants[randi() % sound_variants.size()]
	play_sound(rand_sound)


func _on_player_jump() -> void:
	play_sound(get_footstep_sound().jump_sound, true)


func _on_player_land() -> void:
	play_sound(get_footstep_sound().land_sound, true)


func play_sound(sound: AudioStream, force: bool = false) -> void:
	if audio_player.playing and !force: return
	audio_player.stream = sound
	audio_player.play()


func get_footstep_sound() -> FootstepSound:
	for sound in sounds:
		if sound.material_enum == material:
			return sound
	return null
