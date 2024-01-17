class_name State
extends Node


#Base State Class

@export
#Name of sprite for the state
var sprite_name: String

#Assigns the Parent of the Scene for later reference. If you need to get a property from the TileBody, use parent.{property}
var parent: AnimatableBody2D
var sprite: AnimatedSprite2D

#This function will trigger as soon as the state is entered from another state
func enter() -> void:
	sprite.play(sprite_name)
	parent.current_state = name
	parent.new_state.emit()

#This function will trigger as soon as the state leaves its current state
func exit() -> void:
	pass
#This function triggers every frame, and exprects a return of a state to transfer to	
func process_input(event: InputEvent) -> State:
	return null
