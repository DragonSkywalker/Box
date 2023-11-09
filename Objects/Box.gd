extends RigidBody2D

func layerControl(cursorYPos):
	set_collision_layer_value(1, false)
	set_collision_mask_value(1, false)
	set_collision_layer_value(1, false)
	set_collision_mask_value(1, false)
	set_collision_layer_value(cursorYPos + 16, true)
	set_collision_mask_value(cursorYPos + 16, true)
	set_collision_layer_value(cursorYPos + 16, true)
	set_collision_mask_value(cursorYPos + 16, true)
