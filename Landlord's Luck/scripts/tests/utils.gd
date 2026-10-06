class_name UtilsTest
extends Node

func _ready() -> void:
	var player = Player.new()
	player.add_money(10_000)
	add_child(player)
	
	var property = Property.new(
		"My Property", 2_000, 500, 1.0, Property.PropertyType.LAND
	)
	
	player.purchase_property(property)
	
	print("Can rent property: " + str(property.is_habitable()))
	
	property.add_util(
		PropertyUtilities.UtilTypes.ELECTRICITY, ElectricityUtil.new(500)
	)
	
	print("Can rent property: " + str(property.is_habitable()))
	
	property.add_util(
		PropertyUtilities.UtilTypes.WATER_SEWER, WaterSewerUtil.new(500)
	)
	
	print("Can rent property: " + str(property.is_habitable()))
	
	property.add_util(
		PropertyUtilities.UtilTypes.TRASH_RECYCLING, TrashRecyclingUtil.new(500)
	)
	
	print("Can rent property: " + str(property.is_habitable()))
