extends Node

var is_editing: bool;

func _ready():
	is_editing = false;

func start_editing() -> void:
	is_editing = true

func stop_editing() -> void:
	is_editing = false
