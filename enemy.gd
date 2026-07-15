extends Area2D

const SPEED = 150
var health = 3

func _physics_process(delta: float) -> void:
	position.y += SPEED * delta
	if position.y > get_viewport_rect().size.y:
		queue_free()


func _on_area_entered(area: Area2D) -> void:
	health -= 1
	area.queue_free()
	if health <= 0: queue_free()
	


func _on_body_entered(body: Node2D) -> void:
	print("Player hit!")
	queue_free()
