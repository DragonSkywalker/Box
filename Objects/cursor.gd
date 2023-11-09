extends Node2D

var gridPos = Vector2.ZERO

func _process(delta):
	if Input.is_action_just_pressed("ui_up") and gridPos.y > -15:
		gridPos.y -= 1
		position += Game.boxDepth
	elif Input.is_action_just_pressed("ui_down") and gridPos.y < 16:
		gridPos.y += 1
		position -= Game.boxDepth
	elif Input.is_action_just_pressed("ui_left"):
		gridPos.x -= 1
		position.x -= Game.boxLength
	elif Input.is_action_just_pressed("ui_right"):
		gridPos.x += 1
		position.x += Game.boxLength

