extends State


func enter() -> void:
	super()
	print("Entered Plant State")
	parent.adjecent_plant_detection.monitoring = true

func process_input(event: InputEvent):
	return null


func _on_adjecent_plant_detection_body_entered(body):
	print(body)
	if "growing" in body:
		if body.growing == null:
			body.clickable = true
		
		
