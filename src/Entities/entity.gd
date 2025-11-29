class_name Entity
extends Sprite2D

var _definition: EntityDefinition
var map_data: MapData

func _init(map_data: MapData, start_position: Vector2i, entity_definition: EntityDefinition) -> void:
	centered = false
	grid_position = start_position
	self.map_data = map_data
	set_entity_type(entity_definition)

var grid_position: Vector2i:
	set(value):
		grid_position = value
		position = Grid.grid_to_world(grid_position)

func set_entity_type(entity_definition: EntityDefinition) -> void:
	_definition = entity_definition
	texture = entity_definition.texture
	modulate = entity_definition.color

func move(move_offset: Vector2i) -> void:
	grid_position += move_offset

func is_blocking_movement() -> bool:
	return _definition.is_blocking_movement

func get_entity_name() -> String:
	return _definition.name
