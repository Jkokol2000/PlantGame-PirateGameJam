extends State

@export
var plant_state := State

@export
var root_state := State

@export
var vine_state := State

func enter() -> void:
	super()
		
func process_input(event: InputEvent):
	if parent.name == '@AnimatableBody2D@1032':
		parent.growing = "Plant"
		return plant_state
	if parent.growing == "Roots":
		return root_state
	if parent.growing == "Vines":
		return vine_state
	
