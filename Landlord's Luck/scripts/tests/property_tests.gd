class_name PropertyTests
extends Node

func _ready() -> void:
	var player = Player.new()
	player.add_money(10_000)
	add_child(player)
	
	# Create Properties
	var prop1 = Property.new("My Property 1", 5_000, 500, 2.5, Property.PropertyType.LAND)
	
	print("Created: " + prop1.get_property_name())
	print("Details: ")
	print("Property Cost: " + str(prop1.get_property_cost()))
	print("Rent: " + str(prop1.get_rent_price()))
	
	var prop1_purchased = player.purchase_property(prop1)
	
	print("Property Purchased: " + str(prop1_purchased))
	
	print()
	
	var prop2 = Property.new("My Property 2", 5_000, 500, 2.5, Property.PropertyType.LAND)
	
	print("Created: " + prop2.get_property_name())
	print("Details: ")
	print("Property Cost: " + str(prop2.get_property_cost()))
	print("Rent: " + str(prop2.get_rent_price()))
	
	var prop2_purchased = player.purchase_property(prop2)
	
	print("Property Purchased: " + str(prop2_purchased))
	
	print()
	
	var prop3 = Property.new("My Property 3", 5_000, 500, 2.5, Property.PropertyType.LAND)
	
	print("Created: " + prop3.get_property_name())
	print("Details: ")
	print("Property Cost: " + str(prop3.get_property_cost()))
	print("Rent: " + str(prop3.get_rent_price()))
	
	var prop3_purchased = player.purchase_property(prop3)
	
	print("Property Purchased: " + str(prop3_purchased))
	
	print()	

	print("Player Money Remaining: " + str(player.get_money()))
	print("Player Properties:")
	for prop in player.get_properties():
		print("Property Name: " + prop.get_property_name())
