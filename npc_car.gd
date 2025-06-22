extends CharacterBody2D

@export var speed: float = 520
  # Speed of the NPC car
@export var start_point: Node2D  # Reference to the start point
@export var end_point: Node2D    # Reference to the end point

var target_position: Vector2
var initial_position: Vector2

func _ready():
	# Ensure start and end points are assigned
	if start_point and end_point:
		initial_position = start_point.global_position
		target_position = end_point.global_position
		global_position = initial_position  # Start at the initial position
	else:
		push_error("Start or End point not assigned!")

func _physics_process(delta):
	# Calculate direction to the target
	var direction = (target_position - global_position).normalized()
	
	# Move the car
	velocity = direction * speed
	move_and_slide()
	
	# Check if the car is close to the target
	if global_position.distance_to(target_position) < 10.0:
		respawn()

func respawn():
	# Reset position to start point
	global_position = initial_position
	velocity = Vector2.ZERO
