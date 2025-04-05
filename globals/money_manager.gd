extends Node

signal money_increased
signal money_decreased

const INITIAL_MONEY: int = 2000

var _money: int
var money: int:
	get:
		return _money
	set(value):
		var to_emit: Signal
		if value >= money:
			to_emit = money_increased
		else:
			to_emit = money_decreased
		_money = value
		if _money < 0:
			_money = 0
		to_emit.emit()

func _ready():
	money = INITIAL_MONEY
