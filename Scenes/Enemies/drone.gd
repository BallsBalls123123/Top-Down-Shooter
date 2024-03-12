extends CharacterBody2D

var speed: float = 50

func _process(delta):
	var direction = Vector2(1, 0)
	velocity = direction * speed
	move_and_slide()

