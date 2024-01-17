extends Node

func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_F:
			print(Engine.get_frames_per_second())
