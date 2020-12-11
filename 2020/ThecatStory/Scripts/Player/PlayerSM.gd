extends StateMachine



func _ready():
	add_state("idel")
	add_state("walk")
	add_state("jump")
	add_state("double_jump")
#	add_state("attack")
	call_deferred("set_state",states.idel)
	
func _state_logic(delta):
	parent.gravity()
	
	
	#parent.ammo()
	parent.input()


func _get_transition(delta):
	match state:
		states.idel:
			if parent._can_walk:
				return states.walk
			elif parent._can_jump:
				return states.jump
#			elif parent._have_ammo:
#				return states.attack
		states.walk:
			if parent._go_idel:
				return states.idel
			elif parent._can_jump:
				return states.jump
#			elif parent._have_ammo:
#				return states.attack
#		states.attack:
##			if not parent._have_ammo:
##				return states.idel
#			if parent._can_walk:
#				return states.walk
#			elif parent._can_jump:
#				return states.jump
#			elif parent._go_idel:
#				return states.idel
		states.jump:
			if parent._can_walk:
				return states.walk
			elif parent._can_double_jump:
				return states.double_jump
			elif parent._go_idel:
				return states.idel
		states.double_jump:
			if parent._can_walk:
				return states.walk
			elif parent._go_idel:
				return states.idel
#			elif parent._have_ammo:
#				return states.attack
				
	return null


func _enter_state(new_state, old_state):
	match new_state:
		states.idel:
			parent.state_machine.travel("idel")
		states.walk:
			parent.state_machine.travel("walk")
#		states.attack:
#			parent.state_machine.travel("attack")
#			if parent.ammo():
#				parent._attack()
		states.jump:
			if parent.running:
				parent.state_machine.travel("jump2")
			else:
				parent.state_machine.travel("jump")
		states.double_jump:
			if parent.running:
				parent.state_machine.travel("double_jump2")
			else:
				parent.state_machine.travel("double_jump")
##

func _exit_state(old_state, new_state):
	pass
	
