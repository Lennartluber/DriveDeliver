extends PathFollow2D
@export var speed :int =  5

func _process(delta: float) -> void:
	progress+=delta * speed
