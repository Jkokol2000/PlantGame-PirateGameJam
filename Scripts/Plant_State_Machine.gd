extends Node


@export
var starting_state: State

var current_state: State:
	get:
		return current_state

func init(parent: AnimatableBody2D, Sprites: AnimatedSprite2D) -> void:
	for child in get_children():
		child.parent = parent
		child.sprite = Sprites
	
	change_state(starting_state)
	
	
func change_state(new_state: State) -> void:
	if current_state:
		current_state.exit()
	
	current_state = new_state
	current_state.enter()
func process_input(event: InputEvent):
	var new_state = current_state.process_input(event)
	if new_state:
		change_state(new_state)
