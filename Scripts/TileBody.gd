class_name Tile
extends AnimatableBody2D

signal state_entered

@onready
var state_machine = $Plant_State_Machine
@onready
var sprites = $TileSprite
@onready
var mouse_detection = $MouseDetection
@onready
var adjecent_plant_detection = $AdjecentPlantDetection
@export
var upgrade_manager := UpgradeManager

var original_position

var growing

var current_state

var clickable = false

signal new_state

@export var menu := PopupMenu

 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready() -> void:
	state_machine.init(self, sprites)
	original_position = position
	TileArrayScript.TileArray.append(self)
	
	
func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)
func _on_area_2d_mouse_entered():
	position.y -= 5

func _on_area_2d_mouse_exited():
	position = original_position
	
func use_upgrade(upgrade : Upgrade):
	if upgrade.upgrade_type == "Sprite":
		$Plant_State_Machine/vine_state.sprite_name = upgrade.new_sprite
		

func _on_area_2d_input_event(viewport, event, shape_idx):
	
	if event is InputEventMouseButton && clickable == true:
		if event.button_index == 1:
			if event.pressed:
				if menu.visible == false:
					menu.visible = true
				else:
					menu.visible = false		


func _on_popup_menu_index_pressed(index):
	match index:
		0:
			if growing == "Roots":
				growing = "Both"
			else:
				growing = "Vines"
		1:
			if growing == "Vines":
				growing = "Both"
			else:
				growing = "Roots"
				
