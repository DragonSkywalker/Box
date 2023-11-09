extends Node2D


var layer = preload("res://Objects/layer.tscn")
var box = preload("res://Objects/box.tscn")
@onready var cursor = get_node("Cursor")

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		var currentLayer = get_node("Layer" + str(cursor.gridPos.y))
		if currentLayer:
			var boxTemp = box.instantiate()
			boxTemp.position.y = -1000
			boxTemp.position.x = Game.boxLength * cursor.gridPos.x
			boxTemp.layerControl(cursor.gridPos.y)
			currentLayer.add_child(boxTemp)
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
	var nodesDrawn = 0
	for i in range(-15, 17):
		var tempNode = get_node_or_null("Layer" + str(i))
		if tempNode:
			move_child(tempNode, nodesDrawn)
			nodesDrawn += 1
	move_child(get_node("Cursor"), -1)
