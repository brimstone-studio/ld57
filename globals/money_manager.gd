extends Node

signal money_increased
signal money_decreased

const INITIAL_MONEY: int = 500

var _money: int = 0
var money: int:
	get:
		return _money
	set(value):
		if value >= money:
			money_increased.emit()
		else:
			money_decreased.emit()
		
		_money = value
		if _money < 0:
			_money = 0

func _ready():
	money = INITIAL_MONEY
