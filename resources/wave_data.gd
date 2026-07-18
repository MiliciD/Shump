extends Resource
class_name WaveData

## The enemy scene to spawn this wave
@export var enemy_scene: PackedScene

## How many enemies to spawn in each wave
@export var count: int = 5

## Seconds to wait after the previous wave fully spawns before the next one starts 
@export var delay_between_waves: float = 1.0

## Horizontal spawn range as a fraction of screen width (0.0 - 1.0)
## ex Vector2(0.1, 0.9) spawns anywhere from 10% to 90% across the screen
@export var spawn_range: Vector2 = Vector2(0.1, 0.9)
