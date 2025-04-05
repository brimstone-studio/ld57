extends Panel

func _init():
	ShipEditingManager.started_editing.connect(_show)
	ShipEditingManager.stopped_editing.connect(_hide)
	_hide()

func _show() -> void:
	visible = true

func _hide() -> void:
	visible = false
