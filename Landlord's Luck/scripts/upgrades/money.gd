class_name MoneyUpgrade
extends Upgrade

@export var rent_gain: float

func _init(g_cost: float, g_rent_gain: float = 1.2) -> void:
	upgrade_name = "Money Upgrade"
	upgrade_cost = g_cost
	
	rent_gain = max(min(g_rent_gain, 2.0), 1.2)

func get_rent_gain() -> float:
	return rent_gain
