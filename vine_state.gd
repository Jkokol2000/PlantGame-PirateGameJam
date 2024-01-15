extends State

@export
var both_state := State

func enter() -> void:
	super()
	print("Entered Vine State")

func process_input(event: InputEvent):
	if parent.growing == "Both":
		return both_state
