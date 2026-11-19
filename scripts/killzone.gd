extends Area2D

var is_dead := false

func _on_body_entered(body):
	if is_dead:
		return
	is_dead = true

	Engine.time_scale = 0.5
	
	body.set_process(false)
	body.set_physics_process(false)

	var sprite: AnimatedSprite2D = body.get_node("AnimatedSprite2D")
	sprite.play("death")
	sprite.animation_finished.connect(_on_death_finished, CONNECT_ONE_SHOT)

func _on_death_finished():
	Engine.time_scale = 1
	get_tree().reload_current_scene()
