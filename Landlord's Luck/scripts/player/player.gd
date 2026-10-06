class_name Player
extends Node2D

@export var player_data: PlayerData

# Init
func _init() -> void:
	player_data = PlayerData.new()

# Properties
func get_properties() -> Array[Property]:
	return player_data.properties

# Money
func add_money(amount: int) -> void:
	player_data.money += amount

func get_money() -> float:
	return player_data.money

func spend_money(amount: float) -> void:
	player_data.money -= amount

# Purchases (Properties)
func purchase_property(property: Property) -> bool:
	if property.get_property_cost() <= player_data.money:
		player_data.properties.append(property)
		player_data.money -= property.get_property_cost()
		return true
	
	return false

# Purchases (Upgrades)
func purchase_upgrade(property: Property, upgrade: Upgrade) -> bool:
	if property not in player_data.properties:
		return false
	
	var result: PurchaseResult
	
	if upgrade is MoneyUpgrade:
		result = property.purchase_money_upgrade(upgrade, player_data.money)
	
	if upgrade is AdvertisingUpgrade:
		result = property.purchase_advertising_upgrade(upgrade, player_data.money)
		
	if upgrade is LooksUpgrade:
		result = property.purchase_looks_upgrade(upgrade, player_data.money)
	
	if result is PurchaseResult:
		player_data.money -= result.cost
		
		return result.success
	
	return false
