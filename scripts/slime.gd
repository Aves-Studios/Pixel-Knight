extends Node2D

const SPEED = 60

var direction = 1

@onready var right: RayCast2D = $right
@onready var left: RayCast2D = $left
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x += direction * SPEED * delta
	if left.is_colliding():
		direction = 1
		animated_sprite_2d.flip_h = false
	elif right.is_colliding():
		direction = -1
		animated_sprite_2d.flip_h = true
