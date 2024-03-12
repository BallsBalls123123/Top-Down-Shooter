extends Node2D

var can_shoot: bool = true

@export var lazer_scene: PackedScene
@onready var cooldown_timer = $"Lazer Cooldown"

func _process(delta):
	if Input.is_action_just_pressed("lazer") and can_shoot:
		var lazer = lazer_scene.instantiate() as Lazer
		get_tree().root.add_child(lazer)
		
		var shot_direction = (get_global_mouse_position() - $"..".position).normalized()
		lazer.rotation_degrees = rad_to_deg(shot_direction.angle()) + 90
		
		lazer.position = global_position
		lazer.direction = shot_direction
		
		can_shoot = false
		cooldown_timer.start()
		
func _on_lazer_cooldown_timeout():
	can_shoot = true
