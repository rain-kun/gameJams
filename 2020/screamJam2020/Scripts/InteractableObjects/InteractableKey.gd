extends Interactable


onready var _log = get_node("/root/Main/UI/LogContainer/Log")
onready var _log_animation = get_node("/root/Main/UI/LogContainer/LogAnimation")

onready var parent = $".."

func get_interaction_text():
	return "Pick"
	
func interact():
	keys.pick_key(parent.Key_name,parent.Door_name)
	_log.set_visible(true)
	_log.set_text("Picked the key.")
	_log_animation.play("fadelog")
	parent.queue_free()
