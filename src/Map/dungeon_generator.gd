class_name DungeonGenerator
extends Node

@export_category("Map Dimensions")
@export var map_width: int = 80
@export var map_height: int = 45

var _rng:= RandomNumberGenerator.new()

func _ready() -> void:
	_rng.randomize()

func _carve_tile(dungeon: MapData, x: int, y: int) -> void:
	var tile_position = Vector2i(x,y)
	var tile: Tile = dungeon.get_tile(tile_position)
	tile.set_tile_type(dungeon.tile_types.floor)

func _carve_room(dungeon: MapData, room: Rect2i) -> void:
	var inner: Rect2i = room.grow(-1)
	for y in range(inner.position.y, inner.end.y + 1):
		for x in range(inner.position.x, inner.end.x + 1):
			_carve_tile(dungeon, x, y)

func generate_dungeon() -> MapData:
	var dungeon := MapData.new(map_width, map_height)
	
	var room_1 := Rect2i(20,15,10,15)
	var room_2 := Rect2i(35,15,10,15)
	
	_carve_room(dungeon, room_1)
	_carve_room(dungeon, room_2)
	
	return dungeon
