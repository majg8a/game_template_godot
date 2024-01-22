class_name walk

func random(node: CharacterBody2D = null , speed: Vector2 = Vector2(1,1) ):
	var directions = direction.new()
	var direction = directions.getRandomDirection()
	if node != null:
		node.move_and_collide(speed * direction)

func breath_first(node: CharacterBody2D, targetNode: Node2D,speed: Vector2):
	var distances = direction.directions.map(func (dir: Vector2):
			return pow(2,targetNode.position.length() - (dir * speed).length())
			)
	var minDistance = distances.min()
	var minDistanceIndex = distances.find(minDistance)
	var minDistanceVector = direction.directions[minDistanceIndex] * speed
	var collision = node.move_and_collide(minDistanceVector)
