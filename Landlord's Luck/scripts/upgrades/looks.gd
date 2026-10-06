class_name LooksUpgrade
extends Upgrade

@export var popularity_gain: float
@export var rent_gain: float

func _init(g_cost: float, g_popularity_gain: float = 0.2, g_rent_gain: float = 1.2) -> void:
	upgrade_name = "Looks Upgrade"
	upgrade_cost = g_cost
	
	popularity_gain = max(min(g_popularity_gain, 0.7), 0.2)
	rent_gain = max(min(g_rent_gain, 1.3), 1.2)

func get_popularity_gain() -> float:
	return popularity_gain

func get_rent_gain() -> float:
	return rent_gain
