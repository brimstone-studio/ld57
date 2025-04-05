class_name Part
extends Node2D

const GRID_SIZE = 128

@onready var sprite: Sprite2D = $Sprite
@onready var area_2d: Area2D = $Area2D

var _is_ghost_mode: bool = false
var is_ghost_mode: bool:
	get:
		return _is_ghost_mode
	set(value):
		if(value == true):
			_ghost_mode_turned_on()
		else:
			_ghost_mode_turned_off()
		_is_ghost_mode = value
var _is_placable: bool

func _ghost_mode_turned_on() -> void:
	sprite.modulate.a = 0.5

func _ghost_mode_turned_off() -> void:
	sprite.modulate.a = 1
	sprite.modulate.r = 1
	sprite.modulate.g = 1
	sprite.modulate.b = 1

func _physics_process(delta: float) -> void:
	if is_ghost_mode:
		# can be placed?
		if area_2d.has_overlapping_areas():
			sprite.modulate.r = 0
			sprite.modulate.b = 0
			sprite.modulate.g = 1
			_is_placable = true
		else:
			sprite.modulate.r = 1
			sprite.modulate.b = 0
			sprite.modulate.g = 0
			_is_placable = false

func _process(delta: float) -> void:
	if is_ghost_mode:
		# follow mouse
		var mouse_pos = get_viewport().get_mouse_position()
		var snapped_pos = Vector2(
			floor(mouse_pos.x / GRID_SIZE) * GRID_SIZE,
			floor(mouse_pos.y / GRID_SIZE) * GRID_SIZE
		)
		global_position = snapped_pos + Vector2(GRID_SIZE / 2, GRID_SIZE / 2)
		
		# Rotate on right-click
		if Input.is_action_just_pressed("rotate_room"):
			rotation += deg_to_rad(90)
			
		if Input.is_action_just_pressed("place_room"):
			if _is_placable == true && is_ghost_mode == true:
				is_ghost_mode = false
