extends CollisionShape2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		print("clicked!")

