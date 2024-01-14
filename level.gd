class_name Level extends Node2D

@export var Square: PackedScene

@onready var map: TileMap = $TileMap
enum MapLayer {Ground}

func spawn_tiles(cell: Vector2i) -> void:
	var tile_data := map.get_cell_tile_data(MapLayer.Ground, cell)
	if tile_data == null:
		return
	var cell_type = tile_data.get_custom_data('type')
	var pos := map.map_to_local(cell)
	match cell_type:
		
