extends Button

# Resets the scores and starts a new game
func _on_resetButton_pressed():
	Stats.reset()
	var _changeScene = get_tree().change_scene("res://Board.tscn")
