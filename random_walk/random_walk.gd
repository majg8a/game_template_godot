class_name random_walk extends map

var iterations: int = 1000
var startingPosition: Vector2 = Vector2.ZERO
var roomNumber: int = 1
var hallwayLength: int = 0

func generate():
	var floor: Array = []
	var currentPosition = startingPosition
	var direction: Direction = Direction.new()
	for i in range(iterations):
		floor.push_back(currentPosition)
		var isHallwayIteration = i != 0 && (iterations -1 )!= i && i % (iterations / roomNumber) == 0
		if isHallwayIteration:
			for j in range(hallwayLength):
				floor.push_back(currentPosition)
		currentPosition = currentPosition + direction.getRandomDirection()
