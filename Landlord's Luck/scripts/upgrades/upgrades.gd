class_name Upgrade
extends Resource

@export var upgrade_name: String
@export var upgrade_cost: float

func _init(g_name: String, g_cost: float) -> void:
	upgrade_name = g_name
	upgrade_cost = g_cost

func get_upgrade_name() -> String:
	return upgrade_name

func get_cost() -> float:
	return upgrade_cost

func get_description() -> String:
	return "No Description Given."
