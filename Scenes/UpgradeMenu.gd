extends PopupMenu

@export
var upgrade_dict : Dictionary

signal upgrade_chosen(upgrade)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_id_pressed(id):
	match id:
		0:
			upgrade_chosen.emit(upgrade_dict[0])
		1:
			CurrencySaver.water += 10
		2:
			CurrencySaver.sun += 10
		3:
			CurrencySaver.nutrients += 10


func _on_button_button_down():
	if visible == true:
		visible = false
	else:
		visible = true
