extends Marker2D

var can_shoot: bool = true

var grenade_scene: PackedScene = preload("res://grenade.tscn")
var grenade_speed = 500

@onready var cooldown_timer = $"Grenade Timer"

func _process(delta):
	if Input.is_action_just_pressed("grenade") and can_shoot:
		var grenade = grenade_scene.instantiate() as RigidBody2D
		get_tree().root.add_child(grenade)
		
		var shot_direction = (get_global_mouse_position() - $"..".position).normalized()
		
		grenade.position = global_position
		grenade.linear_velocity = shot_direction * grenade_speed
		
		can_shoot = false
		cooldown_timer.start() 
		

func _on_grenade_timer_timeout():
	can_shoot = true
