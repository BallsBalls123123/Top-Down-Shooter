extends Area2D

class_name Lazer

var direction: Vector2

@export var lazer_speed = 50

func _process(delta):
	position += direction * lazer_speed
	
	
	
	


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
