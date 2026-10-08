extends Control

@onready var gridContainer: GridContainer = $MainContainer/HSplitContainer/MainPanel/MarginContainer/GridContainer
const panelContentScene = preload("res://scenes/ui/panel_content.tscn")

func swap_panel(old_panel: Control, new_panel: Control) -> void:
	old_panel.replace_by(new_panel)
	old_panel.queue_free()

func update_shop(
	upgrades: Array[Upgrade]
) -> void:
	var index = 0
	for upgrade in upgrades:
		if index >= len(gridContainer.get_children()):
			break
		var upgrade_name = upgrade.get_upgrade_name()
		var upgrade_description = upgrade.get_description()
		var upgrade_cost = upgrade.get_cost()
		
		var old_panel = gridContainer.get_child(index)
		var new_panel = panelContentScene.instantiate()
		
		swap_panel(old_panel, new_panel)
		
		new_panel.setup(upgrade_name, upgrade_description, upgrade_cost)
		
		index += 1			
