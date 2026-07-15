extends Area2D

const SPEED = 500

func _physics_process(delta: float) -> void:
	position.y -= SPEED * delta
	if position.y < 0:
		queue_free()
