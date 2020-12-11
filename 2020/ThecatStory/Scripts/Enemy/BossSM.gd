extends StateMachine


func _ready():
	add_state("idel")
	add_state("defend")
	add_state("powerup")
	call_deferred("set_state",states.defend)
	
	
func _state_logic(delta):
	
	if parent._in_idel_position():
		parent._be_idel()
	elif parent._can_shot():
		parent._power_up()
		
	if state == states.defend:
		parent._defend_boss()
	

#	parent._apply_velocity()
	
func _get_transition(delta):
	match state:
		states.idel:
			if parent._can_spawn():
				return states.defend
			
		states.defend:
			if parent._in_idel_position():
				return states.idel

	return null
	
func _enter_state(new_state, old_state):
	match new_state:
		states.idel:
			parent.animation_player.play("idel")
		states.defend:
			parent.animation_player.play("defend")
#		state.attack:
#			parent.animation_player.play("attack")
#			parent._attack()

func _exit_state(old_state, new_state):
	pass
