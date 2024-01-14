extends AnimatableBody2D


@export var menu := PopupMenu



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_mouse_entered():
	position.y -= 5



func _on_area_2d_mouse_exited():
	position.y += 5


func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == 1:
			if event.pressed:
				if menu.visible == false:
					menu.visible = true
				else:
					menu.visible = false		
