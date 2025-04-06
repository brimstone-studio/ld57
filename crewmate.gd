extends CharacterBody2D

var selected = false
var speed = 200
var target_position = Vector2()

const CREWMATE_COLORS = [
	Color("#ff0000"), # Red
	Color("#00ff00"), # Green
	Color("#0000ff"), # Blue
	Color("#ffff00"), # Yellow
	Color("#ff00ff"), # Pink
	Color("#00ffff"), # Cyan
	Color("#ffffff"), # White
	Color("#ff8000"), # Orange
]

func _ready():
	$Torso.modulate = CREWMATE_COLORS[randi() % CREWMATE_COLORS.size()]



func _physics_process(delta):


	if Input.is_action_just_pressed("right_click") and selected == true:
		target_position = get_global_mouse_position()
	
	# Only move if we're not already at the target position
	if position.distance_to(target_position) > 5:  # Using a small threshold
		var direction = (target_position - position).normalized()
		velocity = direction * speed
		move_and_slide()
	else:
		velocity = Vector2.ZERO  # Stop when reaching the target


func _on_crewmate_pressed() -> void:
	pass # Replace with function body.
