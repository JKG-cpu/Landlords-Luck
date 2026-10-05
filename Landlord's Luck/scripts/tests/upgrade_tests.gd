class_name UpgradeTests
extends Node

func _ready() -> void:
	var player = Player.new()
	add_child(player)
	
	player.player_data = PlayerData.new()
	player.add_money(10_000)
	
	var property = Property.new()
	property.property_data = PropertyData.new()
	property.set_purchase_price(2_000)
	property.set_rent_price(500)
	property.change_land_name("My Property")
	
	player.purchase_property(property)
	
	print("Starting Property Data:")
	print("Sell Price: " + str(property.get_sell_price()))
	print("Rent Price: " + str(property.get_rent_price()))
	print()
	
	# Advertising Upgrade
	var ad_upgrade = AdvertisingUpgrade.new()
	ad_upgrade.upgrade_name = "Upgrade Ads"
	ad_upgrade.upgrade_cost = 2_000
	
	# Looks Upgrade
	var looks_upgrade = LooksUpgrade.new()
	looks_upgrade.upgrade_name = "Upgrade Looks"
	looks_upgrade.upgrade_cost = 2_000
	
	# Money Upgrade
	var money_upgrade = MoneyUpgrade.new()
	money_upgrade.upgrade_name = "Increase Rent"
	money_upgrade.upgrade_cost = 2_000
	
	print("Created all upgrades:")
	print("Ad Upgrade: " + ad_upgrade.upgrade_name)
	print("Looks Upgrade: " + looks_upgrade.upgrade_name)
	print("Money Upgrade: " + money_upgrade.upgrade_name)
	print()

	player.purchase_upgrade(property, ad_upgrade)
	player.purchase_upgrade(property, looks_upgrade)
	player.purchase_upgrade(property, money_upgrade)
	
	print("Purchased Upgrades")
	print()
	
	print("Ending Property Data:")
	print("Sell Price: " + str(property.get_sell_price()))
	print("Rent Price: " + str(property.get_rent_price()))
