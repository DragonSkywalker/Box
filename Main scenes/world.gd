extends Node2D


var boxLayer = preload("res://Objects/box_layer.tscn")
var box = preload("res://Objects/box.tscn")
@onready var cursor = get_node("Cursor")

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		var currentLayer = get_node("BoxLayer" + str(cursor.gridPos.y))
		if currentLayer:
			var boxTemp = box.instantiate()
			boxTemp.position.y = -1000
			boxTemp.position.x = Game.boxLength * cursor.gridPos.x
			boxTemp.layerControl(cursor.gridPos.y)
			currentLayer.add_child(boxTemp)
#			currentLayer.sortBox()
		else:
			var layerTemp = boxLayer.instantiate()
			layerTemp.new(cursor.gridPos.y)
			layerTemp.get_node("Box").position.x += cursor.gridPos.x * Game.boxLength
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
		var tempNode = get_node_or_null("BoxLayer" + str(i))
		if tempNode:
			move_child(tempNode, nodesDrawn)
			nodesDrawn += 1
	move_child(get_node("Cursor"), -1)
