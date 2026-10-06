# TODO: Update property values based on upgrade purchases
class_name Property
extends Node2D

enum PropertyType {
	LAND,
	APARTMENT,
	HOUSE
}

@export var property_data: PropertyData

# Init
func _init(
	g_prop_name: String, 
	g_prop_cost: float,
	g_prop_rent: float,
	g_prop_popularity: float,
	g_building_type: Property.PropertyType = Property.PropertyType.LAND,
	g_utilities: Dictionary[PropertyUtilities.UtilTypes, Variant] = {
		PropertyUtilities.UtilTypes.ELECTRICITY: null,
		PropertyUtilities.UtilTypes.WATER_SEWER: null,
		PropertyUtilities.UtilTypes.TRASH_RECYCLING: null
	}) -> void:
	property_data = PropertyData.new()
	property_data.property_name = g_prop_name
	property_data.property_cost = g_prop_cost
	property_data.property_rent = g_prop_rent
	property_data.rent_rate = TimeFrame.Times.BIWEEKLY
	property_data.popularity = g_prop_popularity
	property_data.building = g_building_type
	property_data.utilities = g_utilities

# Property Name
func set_property_name(new_name: String) -> void:
	property_data.property_name = new_name

func get_property_name() -> String:
	return property_data.property_name

# Property Rent
func get_rent_price() -> float:
	return property_data.property_rent

func upgrade_rent_cost(amount: float) -> void:
	if amount <= 0:
		return
	property_data.property_rent *= amount

# Change Rent Rate
func change_rent_rate(new_rate: TimeFrame.Times) -> void:
	property_data.rent_rate = new_rate

func get_rent_rate() -> TimeFrame.Times:
	return property_data.rent_rate

# Property Cost
func get_property_cost() -> float:
	return property_data.property_cost

# Property Sell Value
func get_sell_value(flip: bool = false, coin_flip: bool = false) -> float:
	var base_value = 0.0
	var upgrade_cost = 0.0
	
	if flip:
		if not coin_flip:
			return 0.0
		
		base_value = property_data.property_cost * 1.20
		
		upgrade_cost = 0.0
	
		for upgrade in (
			property_data.advertising_upgrades 
			+ property_data.looks_upgrades 
			+ property_data.money_upgrades
		):
			upgrade_cost += upgrade.upgrade_cost * 1.20
		
		return base_value + upgrade_cost
	
	base_value = property_data.property_cost * 0.90

	upgrade_cost = 0.0

	for upgrade in (
		property_data.advertising_upgrades 
		+ property_data.looks_upgrades 
		+ property_data.money_upgrades):
		upgrade_cost += upgrade.upgrade_cost * 0.95

	return base_value + upgrade_cost

# Popularity
func upgrade_popularity(popularity_amount: float) -> void:
	property_data.popularity += popularity_amount
	property_data.popularity = min(property_data.popularity, 10.0)
	
func can_upgrade_popularity() -> bool:
	if property_data.popularity == 10.0:
		return false
	
	return true

func get_popularity() -> float:
	return property_data.popularity

# Buildings
func get_building() -> PropertyType:
	return property_data.building
	
func change_building(new_building: PropertyType) -> void:
	property_data.building = new_building

# Utils
func get_utils() -> Dictionary[PropertyUtilities.UtilTypes, Variant]:
	return property_data.utilities
	
func get_util(util_type: PropertyUtilities.UtilTypes) -> Variant:
	return property_data.utilities[util_type]
	
func add_util(util_type: PropertyUtilities.UtilTypes, new_upgrade: PropertyUtilities) -> void:
	property_data.utilities[util_type] = new_upgrade

func sell_util(util_type: PropertyUtilities.UtilTypes) -> float:
	var utility = property_data.utilities[util_type]
	property_data.utilities[util_type] = null
	if utility == null:
		return 0.0
	return utility.cost * 0.90

## Check if habitable (all utils are purchased)
func is_habitable() -> bool:
	for util in PropertyUtilities.UtilTypes.values():
		if property_data.utilities[util] == null:
			return false
	
	return true

# Upgrades
func purchase_advertising_upgrade(upgrade: Upgrade, player_money: float) -> PurchaseResult:
	if upgrade is not AdvertisingUpgrade:
		return PurchaseResult.new(false, 0)
	
	if upgrade.get_cost() <= player_money:
		property_data.advertising_upgrades.append(upgrade)
		upgrade_popularity(upgrade.get_popularity_gain())
		return PurchaseResult.new(true, upgrade.get_cost())
	
	return PurchaseResult.new(false, 0)

func purchase_money_upgrade(upgrade: Upgrade, player_money: float) -> PurchaseResult:
	if upgrade is not MoneyUpgrade:
		return PurchaseResult.new(false, 0)
	
	if upgrade.get_cost() <= player_money:
		property_data.money_upgrades.append(upgrade)
		upgrade_rent_cost(upgrade.get_rent_gain())
		return PurchaseResult.new(true, upgrade.get_cost())
	
	return PurchaseResult.new(false, 0)
	
func purchase_looks_upgrade(upgrade: Upgrade, player_money: float) -> PurchaseResult:
	if upgrade is not LooksUpgrade:
		return PurchaseResult.new(false, 0)
	
	if upgrade.get_cost() <= player_money:
		property_data.looks_upgrades.append(upgrade)
		upgrade_popularity(upgrade.get_popularity_gain())
		upgrade_rent_cost(upgrade.get_rent_gain())
		return PurchaseResult.new(true, upgrade.get_cost())
	
	return PurchaseResult.new(false, 0)
