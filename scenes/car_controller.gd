extends CharacterBody2D


# Car properties
var max_speed = 300        # Maximum speed in pixels per second
var acceleration = 600.0     # Acceleration rate
var brake_force = 800.0      # Braking force
var turn_speed = 3.0         # Rotation speed in radians per second
var friction = 200.0         # Slowdown when no input
var controlling = true
# Current control values
var move_input = 0.0
var turn_input = 0.0


	

func _physics_process(delta):
	if controlling : 
		
	# Input handling
	# Forward (W) and reverse (S)
		move_input = 0.0
		if Input.is_action_pressed("up"):  # W key
			move_input = 1.0
		if Input.is_action_pressed("down"):  # S key
			move_input = -1.0
		
		# Steering (A and D)
		turn_input = 0.0
		if Input.is_action_pressed("left"):  # A key
			turn_input = -1.0
		if Input.is_action_pressed("right"):  # D key
			turn_input = 1.0
		rotation += turn_input * turn_speed * delta
	# Braking (Space)
	var is_braking = Input.is_action_pressed("ui_select")  # Space key
	
	# Rotate the car
	
	
	# Calculate velocity
	var direction = Vector2(cos(rotation), sin(rotation))
	if is_braking:
		# Apply braking to reduce speed
		velocity = velocity.move_toward(Vector2.ZERO, brake_force * delta)
	else:
		# Apply acceleration or friction
		if move_input != 0.0:
			velocity += direction * move_input * acceleration * delta
			# Cap the speed
			velocity = velocity.limit_length(max_speed)
		else:
			# Apply friction to slow down
			velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
	
	# Move the car
	move_and_slide()




func _on_puddle_slip_body_entered(body: Node2D) -> void:
	friction = 0
	controlling = false


func _on_puddle_slip_body_exited(body: Node2D) -> void:
	friction = 200
	controlling = true


func _on_spikes_body_entered(body: Node2D) -> void:
	get_tree().reload_current_scene()


func _on_spikes_2_body_entered(body: Node2D) -> void:
	get_tree().reload_current_scene()


func _on_spikes_3_body_entered(body: Node2D) -> void:
	get_tree().reload_current_scene()


func _on_area_2d_body_entered(body: Node2D) -> void:
	get_tree().reload_current_scene()


func _on_area_2d_2_body_entered(body: Node2D) -> void:
	get_tree().reload_current_scene()


func _on_bomb_2_body_entered(body: Node2D) -> void:
	get_tree().reload_current_scene()


func _on_spikes_4_body_entered(body: Node2D) -> void:
	get_tree().reload_current_scene()


func _on_bomb_3_body_entered(body: Node2D) -> void:
	get_tree().reload_current_scene()


func _on_spikes_5_body_entered(body: Node2D) -> void:
	get_tree().reload_current_scene()


func _on_blast_hole_body_entered(body: Node2D) -> void:
	get_tree().reload_current_scene()


func _on_blast_hole_2_body_entered(body: Node2D) -> void:
	get_tree().reload_current_scene()


func _on_blast_hole_3_body_entered(body: Node2D) -> void:
	get_tree().reload_current_scene()


func _on_spikes_6_body_entered(body: Node2D) -> void:
	get_tree().reload_current_scene()


func _on_spikes_7_body_entered(body: Node2D) -> void:
	get_tree().reload_current_scene()


func _on_blast_hole_4_body_entered(body: Node2D) -> void:
	get_tree().reload_current_scene()


func _on_blast_hole_5_body_entered(body: Node2D) -> void:
	get_tree().reload_current_scene()
