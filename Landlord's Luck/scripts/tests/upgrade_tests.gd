class_name UpgradeTests
extends Node

func _ready() -> void:
	var player = Player.new()
	player.add_money(10_000)
	add_child(player)
	
	# Create Test Property
	var prop = Property.new(
		"My Property", 2_000, 500, 2.0, Property.PropertyType.LAND
	)

	var result = player.purchase_property(prop)
	
	if result:
		print("Player Purchased Property")
	else:
		print("Error purchasing property!")	
		
	print()
	
	# Add 3 Upgrades
	var advertisment_upgrade = AdvertisingUpgrade.new(
		150.0, 0.4
	)
	
	print("Created Upgrade. Cost: " + str(advertisment_upgrade.get_cost()))

	var looks_upgrade = LooksUpgrade.new(
		200.0, 0.4, 1.3
	)

	print("Created Looks Upgrade. Cost: " + str(looks_upgrade.get_cost()))

	var money_upgrade = MoneyUpgrade.new(
		250.0, 1.1
	)

	print("Created Money Upgrade. Cost: " + str(money_upgrade.get_cost()))
	
	print()
	
	print("Purchasing Upgrades...")
	
	result = prop.purchase_advertising_upgrade(advertisment_upgrade, player.get_money())
	
	if result.success:
		player.spend_money(result.cost)
	else:
		print("Not enough money...")
	
	result = prop.purchase_looks_upgrade(looks_upgrade, player.get_money())
	
	if result.success:
		player.spend_money(result.cost)
	else:
		print("Not enough money...")
	
	result = prop.purchase_money_upgrade(money_upgrade, player.get_money())
	
	if result.success:
		player.spend_money(result.cost)
	else:
		print("Not enough money...")
	
	print()
	
	var prop_from_player = player.get_properties()
	var property = prop_from_player[0]
	
	print(property.get_property_name())
	print("Sell Value: " + str(property.get_sell_value()) + " | " + "Cost: " + str(property.get_property_cost()))
	print("Rent Price: " + str(property.get_rent_price()))
	print("Popularity: " + str(property.get_popularity()))
	
	print()
	
	print(str(player.get_money()))
