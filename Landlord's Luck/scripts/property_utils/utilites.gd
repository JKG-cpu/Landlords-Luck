class_name PropertyUtilities
extends Resource

enum UtilTypes {
	ELECTRICITY,
	WATER_SEWER,
	TRASH_RECYCLING
}

@export var name: String
@export var cost: float

func _init(g_name: String, g_cost: float) -> void:
	name = g_name
	cost = g_cost
