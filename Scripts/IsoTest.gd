extends TileMap

signal tiles_loaded
var stupid_number = 1

func _process(delta):
	if stupid_number == 1:
		tiles_loaded.emit()
		stupid_number = 0
