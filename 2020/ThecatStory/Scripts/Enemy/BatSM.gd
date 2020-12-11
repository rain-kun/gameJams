extends StateMachine


func _ready():
	add_state("idel")
	add_state("chase")
	call_deferred("set_state",states.idel)
	
	
func _state_logic(delta):
	
	if parent._in_attack_zone():
		parent._attack()
	
	if state == states.chase:
		parent._chase_player()
	else:
		parent._idel()
	
#	parent._apply_velocity()
	
func _get_transition(delta):
	match state:
		states.idel:
			if parent._should_chase():
				return states.chase
		states.chase:
			if parent._go_idel():
				return states.idel
			elif parent.should_attack():
				return states.attack
		states.attack:
			if not parent._in_attack_zone():
				return states.idel
			elif parent._should_chase():
				return states.chase
				
	return null
	
func _enter_state(new_state, old_state):
	match new_state:
		states.idel:
			parent.animation_player.play("idel")
		states.chase:
			parent.animation_player.play("idel")
		state.attack:
			parent.animation_player.play("attack")
			parent._attack()

func _exit_state(old_state, new_state):
	pass
