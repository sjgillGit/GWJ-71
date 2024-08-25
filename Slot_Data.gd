extends Resource
class_name Slot_Data

const MAX_STACK_SIZE: int = 99
@export var slot_data: Item_Data
@export_range(1, MAX_STACK_SIZE) var quantity: int = 1
