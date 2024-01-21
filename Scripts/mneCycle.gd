extends Node


var current_cycle = ""
var cycles = ["Morning", "Noon", "Evening"]

# Called when the node enters the scene tree for the first time.
func _ready():
	current_cycle = cycles[0]

func next_cycle():
	var index = cycles.find(current_cycle, 0)
	index = (index + 1) % cycles.size()
	current_cycle = cycles[index]


