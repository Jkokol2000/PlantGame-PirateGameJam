extends State

@export
var both_state := State

func enter() -> void:
	super()
	print("Entered Root State")
	parent.adjecent_plant_detection.monitoring = true

func process_input(event: InputEvent):
	if parent.growing == "Both":
		return both_state


func _on_adjecent_plant_detection_body_entered(body):
	print(body)
	if "growing" in body:
		if body.growing == null:
			body.clickable = true
