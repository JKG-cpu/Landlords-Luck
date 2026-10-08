class_name ShopPanelContent
extends Panel

@onready var nameLabel = $MarginContainer/VBoxContainer/NameLbl
@onready var descriptionLabel = $MarginContainer/VBoxContainer/DescriptionLbl
@onready var purchaseButton = $MarginContainer/VBoxContainer/PurchaseBtn

func setup(
	upgrade_name: String,
	upgrade_description: String,
	upgrade_cost: float
) -> void:
	nameLabel.text = upgrade_name
	descriptionLabel.text = upgrade_description
	purchaseButton.text = str(upgrade_cost)
