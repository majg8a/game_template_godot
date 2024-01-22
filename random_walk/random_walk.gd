class_name random_walk extends map

var iterations: int = 1000
var startingPosition: Vector2 = Vector2.ZERO
var roomNumber: int = 50
var hallwayLength: int = 5

func generate():
	var floor: Dictionary = {}
	var direction: Direction = Direction.new()
	
	var fardestDir: Dictionary = {
		Vector2.UP: startingPosition,
		Vector2.RIGHT: startingPosition,
		Vector2.LEFT: startingPosition,
		Vector2.DOWN: startingPosition
	}
	
	var currentPosition = startingPosition
	var currentDirection: Vector2 = direction.getRandomDirection()
	for i in range(iterations):
		var isHallwayIteration: bool = i != 0 && (iterations -1 )!= i && i % (iterations / roomNumber) == 0
		if isHallwayIteration:
			for j in range(hallwayLength):
				currentPosition = fardestDir[currentDirection]
				currentPosition = addToFloor(floor,fardestDir,currentPosition,currentDirection)
				tileMap.set_cell(0,currentPosition,0,Vector2i(0,0))
			continue
		currentPosition = addToFloor(floor,fardestDir, currentPosition ,currentDirection)
		currentDirection = direction.getRandomDirection()
		tileMap.set_cell(0,currentPosition,0,Vector2i(0,0))
	
func addToFloor(floor: Dictionary,fardestDir: Dictionary, currentPosition: Vector2 ,currentDirection: Vector2):
	currentPosition += currentDirection
	currentPosition = fardestDir[currentDirection] + currentDirection if floor.has(currentPosition) else currentPosition
	fardestDir[currentDirection] = currentPosition if fardestDir[currentDirection] < currentPosition  else fardestDir[currentDirection]
	floor[currentPosition] = true;
	return currentPosition
