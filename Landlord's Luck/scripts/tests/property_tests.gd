class_name EconomyTest
extends Node

func _ready() -> void:
	# Test player money
	var player = Player.new()
	add_child(player)
	
	player.player_data = PlayerData.new()
	player.add_money(10_000)
	
	print("Player Money: " + str(player.player_data.money) + "\n")
	
	# Test Property Creation
	var property = Property.new()
	property.property_data = PropertyData.new()
	property.change_land_name("My Property 1")
	property.set_purchase_price(5_000)
	property.set_rent_price(100)
	
	var property2 = Property.new()
	property2.property_data = PropertyData.new()
	property2.change_land_name("My Property 2")
	property2.set_purchase_price(5_000)
	property2.set_rent_price(100)
	
	var property3 = Property.new()
	property3.property_data = PropertyData.new()
	property3.change_land_name("My Property 3")
	property3.set_purchase_price(5_000)
	property3.set_rent_price(100)
	
	print("Created three properties:")
	print(property.get_property_name() + " | " 
		+ property2.get_property_name() + " | " 
		+ property3.get_property_name() + "\n"
	)
	
	# Test Property Purchasing
	print("Player purchased property 1: " + str(player.purchase_property(property)))
	print("Player purchased property 2: " + str(player.purchase_property(property2)))
	print("Player purchased property 3: " + str(player.purchase_property(property3)))
	print()

	print("Player Properties:")
	for prop in player.get_properties():
		print("Property: " + prop.get_property_name())
		print("Rent: " + str(prop.get_rent_price()))
		print("Cost: " + str(prop.get_purchase_price()))
