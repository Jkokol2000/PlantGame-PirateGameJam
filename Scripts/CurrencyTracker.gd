extends Node2D
var StateDict = {"Base": 0, "Plant": 0, "Vine": 0, "Root": 0, "Other": 0}
var TileArray = TileArrayScript.TileArray
@export
var tilemap := TileMap
@export
var upgrade_list = []

func _ready():
	tilemap.tiles_loaded.connect(_on_tile_load)

func _unhandled_input(event):
	if event.is_action_pressed("ShowDictionary"):
		print(StateDict)
	
func new_state():
	for tile in TileArray:
			match tile.current_state:
				"base_state":
					StateDict["Base"] += 1
				"plant_state":
					StateDict["Plant"] += 1
				"vine_state":
					StateDict["Vine"] += 1
				"root_state":
					StateDict["Root"] += 1
				"both_state":
					StateDict["Vine"] += 1
					StateDict["Root"] += 1
				_:
					StateDict["Other"] += 1
func _on_tile_load():
	new_state()
	for tile in TileArray:
		tile.new_state.connect(_on_new_state)

func _on_new_state():
	for state in StateDict:
		StateDict[state] = 0
	new_state()
		


func _on_popup_menu_upgrade_chosen(upgrade):
	if upgrade.sun_cost > CurrencySaver.sun or upgrade.water_cost > CurrencySaver.water or upgrade.nut_cost > CurrencySaver.nutrients:
		print("Not enough materials")
	else:
		CurrencySaver.sun -= upgrade.sun_cost
		CurrencySaver.water -= upgrade.water_cost
		CurrencySaver.nutrients -= upgrade.nut_cost
		for tile in TileArray:
			tile.use_upgrade(upgrade)
