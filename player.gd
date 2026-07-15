extends CharacterBody2D

const SPEED = 300.0
var target_position: Vector2
const BulletScene = preload("res://bullet.tscn")

func _ready() -> void:
	var screen_size = get_viewport_rect().size
	global_position = Vector2(screen_size.x/2, screen_size.y - 100)
	target_position = global_position

func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch or event is InputEventScreenDrag:
		target_position = event.position
		print(target_position)

func _physics_process(delta: float) -> void:
	global_position = global_position.move_toward(target_position, SPEED*delta)
	var screen_size = get_viewport_rect().size
	global_position.x = clamp(global_position.x, 0, screen_size.x)
	global_position.y = clamp(global_position.y, 0, screen_size.y)


func _on_timer_timeout() -> void:
	var bullet = BulletScene.instantiate()
	get_parent().add_child(bullet)
	bullet.global_position = global_position
