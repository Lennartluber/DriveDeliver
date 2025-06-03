extends Camera2D


@export var target : CharacterBody2D  # Drag your car node here in the Inspector
@export var follow_speed: float = 5.0

func _physics_process(delta):
	if target:
		position = position.lerp(target.position, follow_speed * delta)
