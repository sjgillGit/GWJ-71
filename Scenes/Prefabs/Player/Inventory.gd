extends Node

# Define the maximum number of items the inventory can hold
var max_items: int = 5
@export var default_inventory_logo: Texture2D
# This is the list that will store our inventory items
var storage: Array = []
var active_slot: int = 0

# Signal that will notify when the inventory changes
signal inventory_updated

func _process(_delta):
	process_input()

func _ready():
	storage.resize(max_items)
	emit_signal('inventory_updated')


func pick_up(item):
	if active_slot != -1 and storage[active_slot] == null:
		storage[active_slot] = item
		# Item is frozen in space somewhere far
		item.position.x = 500
		item.position.y = 500
		item.position.z = 500
		item.freeze = true
		print('Picked up: ', storage[active_slot].name)
		emit_signal('inventory_updated')
		return true
	
	for i in range(0, 5):
		if storage[i] == null:
			storage[i] = item
			# Item is frozen in space somewhere far
			item.position.x = 500
			item.position.y = 500
			item.position.z = 500
			item.freeze = true
			print('Picked up: ', storage[i].name)
			emit_signal('inventory_updated')
			return true
	
	print('Inventory full')
	return false


func drop():
	if active_slot == -1:
		print('Inactive slot')
		return
	if storage[active_slot] != null:
		var item = storage[active_slot]
		storage[active_slot] = null
		item.global_transform = $"../CameraController/DropMarker".global_transform
		item.freeze = false
		
		# Push item
		var impulse = $"../CameraController/Camera".global_position.direction_to($"../CameraController/DropMarker".global_position).normalized()*30
		item.apply_central_force(impulse)
		
		print('Dropped: ', item.name)
		emit_signal('inventory_updated')

func process_input():
	if Input.is_action_just_pressed("num_1"):
		if active_slot == 0:
			active_slot = -1
			emit_signal('inventory_updated')
		else:
			active_slot = 0
			emit_signal('inventory_updated')
	
	if Input.is_action_just_pressed("num_2"):
		if active_slot == 1:
			active_slot = -1
			emit_signal('inventory_updated')
		else:
			active_slot = 1
			emit_signal('inventory_updated')
	
	if Input.is_action_just_pressed("num_3"):
		if active_slot == 2:
			active_slot = -1
			emit_signal('inventory_updated')
		else:
			active_slot = 2
			emit_signal('inventory_updated')
	
	if Input.is_action_just_pressed("num_4"):
		if active_slot == 3:
			active_slot = -1
			emit_signal('inventory_updated')
		else:
			active_slot = 3
			emit_signal('inventory_updated')
	
	if Input.is_action_just_pressed("num_5"):
		if active_slot == 4:
			active_slot = -1
			emit_signal('inventory_updated')
		else:
			active_slot = 4
			emit_signal('inventory_updated')
	
	if Input.is_action_just_pressed("drop"):
		drop()


func _on_inventory_updated():
	$ActiveSlot.text = 'Active slot: ' + str(active_slot)
	var inv_slots = $InventoryUI.get_children()
	for slot in range(0, 5):
		inv_slots[slot].color = Color(1, 0, 0, 1)
		if storage[slot] != null:
			# inv_slots[slot].color = Color(0, 0, 1, 1)
			if storage[slot].find_child('Pickupable').Ui_texture != null:
				var sprite = inv_slots[slot].get_child(0)
				sprite.set_texture(storage[slot].find_child('Pickupable').Ui_texture)
			else:
				var sprite = inv_slots[slot].get_child(0)
				sprite.set_texture(default_inventory_logo)
		else:
			var sprite = inv_slots[slot].get_child(0)
			sprite.set_texture(null)
	if active_slot != -1:
		inv_slots[active_slot].color = Color(0, 1, 0, 1)
