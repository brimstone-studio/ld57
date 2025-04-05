extends Button

@export var part_name: String
@export var part_price: int

@onready var price_label: Label = $Price
@onready var sprite: Sprite2D = $Sprite2D
@onready var ship: Node2D = $/root/Game/World/Ship

func _ready():
	button_up.connect(_on_button_up)
	price_label.text = "%s ᖬ" % part_price

func _on_button_up() -> void:
	var part_path = "res://world/ship/parts/part_%s.tscn" % part_name
	var part: PackedScene = ResourceLoader.load(part_path)
	var part_instance: Part = part.instantiate()
	ship.add_child(part_instance)
	MoneyManager.money -= part_price
	part_instance.is_ghost_mode = true

func _process(delta: float) -> void:
	if(MoneyManager.money < part_price):
		disabled = true
		price_label.modulate.r = 1
		price_label.modulate.g = 0
		price_label.modulate.b = 0
		sprite.modulate.a = 0.5
	else:
		disabled = false
		price_label.modulate.r = 1
		price_label.modulate.g = 1
		price_label.modulate.b = 1
		sprite.modulate.a = 1
