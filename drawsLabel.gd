extends Label

func _process(_delta):
	self.text = str("Draws: ", Stats.draws)
