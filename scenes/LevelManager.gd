extends Node2D

# Timer variables
var time_elapsed = 0.0
var timer_running = true

# Reference to the UI label to display the timer
@onready var timer_label = %TimerLabel  # Add a Label node in your scene and name it TimerLabel
@onready var finish_area = $FinishArea   # Reference to your Area2D node for the finish line

func _ready():
	# Connect the Area2D's body_entered signal
	finish_area.body_entered.connect(_on_finish_area_body_entered)

func _process(delta):
	if timer_running:
		time_elapsed += delta
		update_timer_display()
	
	# Check for "R" key press to restart the level
	if Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene()

func update_timer_display():
	# Format time as minutes:seconds.milliseconds
	var minutes = int(time_elapsed / 60)
	var seconds = int(time_elapsed) % 60
	var milliseconds = int((time_elapsed - int(time_elapsed)) * 100)
	timer_label.text = "%02d:%02d.%02d" % [minutes, seconds, milliseconds]

func _on_finish_area_body_entered(body):
	# Check if the body entering is the car (adjust "Car" to your car's node name or group)
	if body.is_in_group("Player"):  # Replace "Car" with your car's node name
		timer_running = false
		print("Level completed! Time: ", timer_label.text)
		# Optional: Add code to show a completion screen, save the time, etc.
