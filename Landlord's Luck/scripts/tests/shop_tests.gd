extends Node

const shopScene = preload("res://scenes/ui/property_shop/shop_panel.tscn")

func _ready() -> void:
	var shop_scene = shopScene.instantiate()
	
	add_child(shop_scene)
	
	var upgrades: Array[Upgrade] = [
		AdvertisingUpgrade.new(500),
		AdvertisingUpgrade.new(400),
		MoneyUpgrade.new(600),
		LooksUpgrade.new(800)
	]
	
	shop_scene.update_shop(upgrades)
