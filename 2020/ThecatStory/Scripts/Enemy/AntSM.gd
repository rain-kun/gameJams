extends StateMachine


func _ready():
	add_state("chase")
	call_deferred("set_state",states.chase)
	
	
func _state_logic(delta):
	

	parent._chase_player()

	
#	parent._apply_velocity()
#
#func _get_transition(delta):
#	match state:
#		states.idel:
#			if parent._should_chase():
#				return states.chase
#		states.chase:
#			if parent._go_idel():
#				return states.idel


#
#	return null
#
func _enter_state(new_state, old_state):
	match new_state:
#		states.idel:
#			parent.animation_player.play("idel")
		states.chase:
			parent.animation_player.play("chase")

#
#func _exit_state(old_state, new_state):
#	pass
