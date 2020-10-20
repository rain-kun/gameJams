extends Interactable

onready var _log = get_node("/root/Main/UI/LogContainer/Log")
onready var _log_animation = get_node("/root/Main/UI/LogContainer/LogAnimation")

onready var parent = $"../../.."

func get_interaction_text():
	return "Open"
	
func interact():
	var result = keys.check_key(parent.Key_name,parent.Door_name)
	if result and not parent.door_open:
			parent.animation_player.play("dooropen")
			parent.animation_sound.play("lockopen")
			parent.door_open = true
	else:
		parent.animation_sound.play("locked")
		_log.set_visible(true)
		_log.set_text("Door is Lock.")
		_log_animation.play("fadelog")


func _on_AnimationSound_animation_finished(anim_name):
	if anim_name == "lockopen":
		parent.animation_sound.play("dooropen")
