class_name AdvertisingUpgrade
extends Upgrade

@export var popularity_gain: float

func _init(g_cost: float, g_popularity_gain: float = 0.5) -> void:
	upgrade_name = "Advertisment Upgrade"
	upgrade_cost = g_cost
	popularity_gain = min(max(g_popularity_gain, 0.5), 1.0)

func get_popularity_gain() -> float:
	return popularity_gain
