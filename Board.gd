extends Node2D

onready var spots = [
	[
		get_node("Area2D"),
		get_node("Area2D2"),
		get_node("Area2D3")
	],
	[
		get_node("Area2D4"),
		get_node("Area2D5"),
		get_node("Area2D6")
	],
	[
		get_node("Area2D7"),
		get_node("Area2D8"),
		get_node("Area2D9")
	]
]

onready var turnLabel = $turnLabel
onready var xWinsLabel = $xWinsLabel
onready var oWinsLabel = $oWinsLabel

var currentTurn = "x"

# Called from Area2D._input_event()
func processTurn(node: Area2D):
	print("\nyour choice is: ", node.choice)
	for row in spots:
		print(row[0].choice, " ", row[1].choice, " ", row[2].choice)
			
	if currentTurn == "x":
		currentTurn = "o"
		turnLabel.text = str("Turn: O")
	else:
		currentTurn = "x"
		turnLabel.text = str("Turn: X")
		
	determineIfGameover()
			
# Determines if the spots being compared have been selected before and 
# are equal to each other.
func spotsAreChosenAndEqual(v1: String, v2: String, v3: String):
	if v1 != "." && v2 != "." && v3 != ".":
		if v1 == v2 && v1 == v3:
			return true
	#If execution reaches this then it must return false
	return false
	
# Compares each move to determine if the game has been won
func determineIfGameover():
	var winner
	var gameOver = false
	
	#Top row all the same
	if spotsAreChosenAndEqual(spots[0][0].choice, spots[0][1].choice, spots[0][2].choice):
		winner = spots[0][1].choice
		gameOver = true
	
	#Middle row all the same
	if spotsAreChosenAndEqual(spots[1][0].choice, spots[1][1].choice, spots[1][2].choice):
		winner = spots[1][1].choice
		gameOver = true
		
	#Bottom row all the same
	if spotsAreChosenAndEqual(spots[2][0].choice, spots[2][1].choice, spots[2][2].choice):
		winner = spots[2][1].choice
		gameOver = true
		
	#left column all the same
	if spotsAreChosenAndEqual(spots[0][0].choice, spots[1][0].choice, spots[2][0].choice):
		winner = spots[1][0].choice
		gameOver = true
		
	#middle column all the same
	if spotsAreChosenAndEqual(spots[0][1].choice, spots[1][1].choice, spots[2][1].choice):
		winner = spots[1][1].choice
		gameOver = true
		
	#right column all the same
	if spotsAreChosenAndEqual(spots[0][2].choice, spots[1][2].choice, spots[2][2].choice):
		winner = spots[1][2].choice
		gameOver = true
		
	#Diagonal top left to bottom right all the same
	if spotsAreChosenAndEqual(spots[0][0].choice, spots[1][1].choice, spots[2][2].choice):
		winner = spots[1][1].choice
		gameOver = true
		
	#Diagonal bottom left to top right all the same
	if spotsAreChosenAndEqual(spots[2][0].choice, spots[1][1].choice, spots[0][2].choice):
		winner = spots[1][1].choice
		gameOver = true
		
	# Checks for a draw
	if gameIsDraw():
		if !gameOver:
			winner = "."
			gameOver = true
			
	# Actions performed if the game has ended
	if gameOver:
		print("Winner: ", winner)
		if winner == "x":
			Stats.xWins += 1
		elif winner == "o":
			Stats.oWins += 1
		elif winner == ".":
			Stats.draws += 1
		
		# Prevents spots that haven't already been selected from being selectable
		# Without this the win tracker will sometimes increment the wrong stat
		for row in spots:
			for spot in row:
				if !spot.selected:
					spot.visible = false
				
		get_node("WinScreen").visible = true
		if winner != ".":
			get_node("WinScreen/winner").text = str(winner.to_upper(), " is the winner!")
		else:
			get_node("WinScreen/winner").text = str("Draw!")
		
func gameIsDraw():
	var numSelected = 0
	for row in spots:
		for spot in row:
			if spot.selected:
				numSelected += 1
	print("numSelected: ", numSelected)
	
	# Ternary! These are cool :D
	return true if numSelected >= 9 else false

# Returns whos turn it currently is
func getTurn():	return currentTurn;
