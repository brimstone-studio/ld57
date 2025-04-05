extends Label

func _init():
	MoneyManager.money_decreased.connect(on_money_decreased)
	MoneyManager.money_increased.connect(on_money_increased)
	
func on_money_decreased():
	_update_money_value(MoneyManager.money)

func on_money_increased():
	_update_money_value(MoneyManager.money)

func _update_money_value(new_value: int):
	print(new_value)
	text = "%s ᖬ" % new_value
