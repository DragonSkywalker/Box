extends Node2D

var level = 0

func _ready():
	position.y += Game.boxLength / 2
	
	
func _process(_delta):
	pass
	
func new(newLevel: int):
	name = "Layer" + str(newLevel)
	level = newLevel
	position.y -= newLevel * Game.boxDepth.y
	get_node("Floor").set_collision_layer_value(newLevel + 16, true)
	get_node("Floor").set_collision_mask_value(newLevel + 16, true)
	get_node("Box").set_collision_layer_value(newLevel + 16, true)
	get_node("Box").set_collision_mask_value(newLevel + 16, true)
	get_node("Floor").set_collision_layer_value(16, false)
	get_node("Floor").set_collision_mask_value(16, false)
	get_node("Box").set_collision_layer_value(16, false)
	get_node("Box").set_collision_mask_value(16, false)

