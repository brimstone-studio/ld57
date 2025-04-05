extends Button

@export var part_name: String;

func _ready():
	button_up.connect(_on_button_up)

func _on_button_up() -> void:
	pass
