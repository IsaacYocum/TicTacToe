extends Area2D

onready var game = self.get_parent()
onready var o = get_node("O")
onready var x = get_node("X")

var selected = false
var choice = "."

func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.is_pressed():
		if selected == false:
			showTurn()
			game.processTurn(self)

func showTurn():
	if game.getTurn() == "x":
		x.visible = true
		o.visible = false
		choice = "x"
	else:
		x.visible = false
		o.visible = true
		choice = "o"
		
	selected = true
