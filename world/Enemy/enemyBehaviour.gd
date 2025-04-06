extends Area2D

var speed = 200
@export var target: Sprite2D    #refer to the ship
@export var hp: int = 1         #how many hitpoints will it take to kill it

func _physics_process(delta):
    if target:
        var direction = (target.position - position).normalized()
        position += direction * speed * delta

        rotation = direction.angle()