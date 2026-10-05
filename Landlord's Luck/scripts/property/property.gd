class_name Property
extends Node2D

@export var property_data: PropertyData

# Land Name
func get_property_name() -> String:
	return property_data.land_name
	
func change_land_name(new_name: String) -> void:
	property_data.land_name = new_name

# Purchase / Sell Price	
func set_purchase_price(amount: int) -> void:
	property_data.purchase_price = amount

func get_purchase_price() -> float:
	return property_data.purchase_price

func get_sell_price() -> float:
	var base_price = property_data.purchase_price * .90
	var upgrade_cost = 0
	
	for upgrade in (property_data.advertising_upgrades 
					+ property_data.looks_upgrades 
					+ property_data.money_upgrades):
		upgrade_cost += upgrade.upgrade_cost * .95
	
	return base_price + upgrade_cost

# Rent Prices
func set_rent_price(amount: int) -> void:
	property_data.rent_price = amount

func get_rent_price() -> float:
	return property_data.rent_price

# Upgrades
func purchase_money_upgrade(upgrade: MoneyUpgrade, player_money: float) -> PurchaseResult:
	if upgrade is not MoneyUpgrade:
		return PurchaseResult.new(false, 0)
	
	if upgrade.upgrade_cost <= player_money:
		var new_rent_price = get_rent_price() * upgrade.rent_multiplier
		
		if new_rent_price <= 0:
			return PurchaseResult.new(false, 0)
		
		property_data.rent_price = new_rent_price
		property_data.money_upgrades.append(upgrade)
		return PurchaseResult.new(true, upgrade.upgrade_cost)
	
	return PurchaseResult.new(false, 0)

func purchase_advertising_upgrade(upgrade: AdvertisingUpgrade, player_money: float) -> PurchaseResult:
	if upgrade is not AdvertisingUpgrade:
		return PurchaseResult.new(false, 0)
	
	if upgrade.upgrade_cost <= player_money:
		property_data.advertising_upgrades.append(upgrade)
		return PurchaseResult.new(true, upgrade.upgrade_cost)
	
	return PurchaseResult.new(false, 0)
	
func purchase_looks_upgrade(upgrade: LooksUpgrade, player_money: float) -> PurchaseResult:
	if upgrade is not LooksUpgrade:
		return PurchaseResult.new(false, 0)
	
	if upgrade.upgrade_cost <= player_money:
		property_data.looks_upgrades.append(upgrade)
		return PurchaseResult.new(true, upgrade.upgrade_cost)
	
	return PurchaseResult.new(false, 0)
