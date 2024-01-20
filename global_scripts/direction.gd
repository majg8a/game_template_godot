extends Node
const directions: Array = [Vector2.UP,Vector2.RIGHT, Vector2.DOWN, Vector2.LEFT]
var currentDirections = Array(directions)

func getRandomDirection():
	if(!len(currentDirections)):
		currentDirections = Array(directions)
	currentDirections.shuffle()
	return currentDirections.pop_back()
