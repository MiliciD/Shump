extends Node2D

## Exported array field for waves
@export var waves: Array[WaveData] = []

## Enemy container reference (on ready = when scene fully built)
@onready var spawn_parent: Node2D = $EnemyContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for wave in waves:
		await get_tree().create_timer(wave.delay_between_waves).timeout
		var viewport_width = get_viewport_rect().size.x 
		var min_x = wave.spawn_range.x * viewport_width 
		var max_x = wave.spawn_range.y * viewport_width 
		var spacing = (max_x - min_x) / (wave.count - 1) if wave.count > 1 else 0.0
		for i in wave.count: 
			var enemy = wave.enemy_scene.instantiate() 
			var spawn_x = min_x + spacing * i 
			enemy.position = Vector2(spawn_x, -40) 
			spawn_parent.add_child(enemy)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
