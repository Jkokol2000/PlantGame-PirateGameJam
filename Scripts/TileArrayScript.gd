extends Node

var TileArray = []

func _unhandled_input(event):
	if event.is_action_pressed("PrintArray"):
		print(TileArray)
