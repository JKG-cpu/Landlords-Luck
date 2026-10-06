class_name PurchaseResult
extends Resource

var success: bool = false
var cost: float = 0

func _init(p_success: bool, p_cost: float) -> void:
	success = p_success
	cost = p_cost
	
