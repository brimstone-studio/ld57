class_name Part
extends Node2D

@export var grid_size_x: int = 128
@export var grid_size_y: int = 128

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
			floor(mouse_pos.x / grid_size_x) * grid_size_x,
			floor(mouse_pos.y / grid_size_y) * grid_size_y
		)
		global_position = snapped_pos + Vector2(grid_size_x / 2, grid_size_y / 2)
		
		# Rotate on right-click
		if Input.is_action_just_pressed("right_click"):
			rotation += deg_to_rad(90)
			
		if Input.is_action_just_pressed("left_click"):
			if _is_placable == true && is_ghost_mode == true:
				is_ghost_mode = false
