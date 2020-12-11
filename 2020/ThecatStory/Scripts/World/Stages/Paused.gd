extends Control

func _input(event):
	if Input.is_action_pressed("ui_cancel"):
		var new_pause_state = not get_tree().paused
		get_tree().paused = new_pause_state
		

