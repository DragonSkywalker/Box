extends Node2D


var layer = preload("res://Objects/layer.tscn")
@onready var cursor = get_node("Cursor")

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		var currentLayer = get_node("Layer" + str(cursor.gridPos.y))
		if currentLayer:
			print(currentLayer.name)
		else:
			var layerTemp = layer.instantiate()
			layerTemp.new(cursor.gridPos.y)
			layerTemp.position.x += cursor.gridPos.y * Game.boxDepth.y
			add_child(layerTemp)
