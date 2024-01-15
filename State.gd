class_name State
extends Node

@export
var sprite_name: String

var parent: AnimatableBody2D
var sprite: AnimatedSprite2D

func enter() -> void:
	sprite.play(sprite_name)
	
func exit() -> void:
	pass
func process_input(event: InputEvent) -> State:
	return null
