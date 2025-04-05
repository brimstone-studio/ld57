extends Button

@export var close_editing_text: String;
@export var open_editing_text: String;

func _ready():
	text = open_editing_text

func _on_toggled(toggled_on: bool) -> void:
	if toggled_on:
		text = close_editing_text
		ShipEditingManager.is_editing = true
	else:
		text = open_editing_text
		ShipEditingManager.is_editing = false
