extends Area2D

func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.is_pressed():
		print("Win screen clicked!")
		
		self.visible = false
		var _changeScene = get_tree().change_scene("res://Board.tscn")
