extends Label

func _process(_delta):
	self.text = str("X Wins: ", Stats.xWins)
