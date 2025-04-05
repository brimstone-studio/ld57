extends Node

var _is_editing: bool = false
var is_editing: bool:
	get:
		return _is_editing
	set(value):
		if _is_editing != value:
			if is_editing == true:
				stopped_editing.emit()
			else:
				started_editing.emit()
			_is_editing = value
		

signal started_editing
signal stopped_editing

func _ready():
	is_editing = false;
