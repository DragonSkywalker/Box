extends Node2D

var level = 0

func _ready():
	position.y += Game.boxLength / 2
	
	
func _process(_delta):
	pass
	
func new(newLevel: int):
	name = "BoxLayer" + str(newLevel)
	level = newLevel
	position.y -= newLevel * Game.boxDepth.y
	position.x += level * Game.boxDepth.y
	get_node("Floor").set_collision_layer_value(newLevel + 16, true)
	get_node("Floor").set_collision_mask_value(newLevel + 16, true)
	get_node("Box").set_collision_layer_value(newLevel + 16, true)
	get_node("Box").set_collision_mask_value(newLevel + 16, true)
	get_node("Floor").set_collision_layer_value(16, false)
	get_node("Floor").set_collision_mask_value(16, false)
	get_node("Box").set_collision_layer_value(16, false)
	get_node("Box").set_collision_mask_value(16, false)

#func sortBox():
#	var i = 0
#	for N in get_children():
#
