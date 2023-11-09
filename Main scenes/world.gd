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
	else:
		sort()
	if Input.is_action_just_pressed("ui_up") \
	or Input.is_action_just_pressed("ui_down") \
	or Input.is_action_just_pressed("ui_right") \
	or Input.is_action_just_pressed("ui_left"):
		sort()

func sort():
	var nodesDrawn = 0s
	for i in range(-15, 17):
		var tempNode = get_node("Layer" + str(i))
		if tempNode:
			move_child(tempNode, nodesDrawn)
			nodesDrawn += 1
	move_child(get_node("Cursor"), -1)
