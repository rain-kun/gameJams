extends StateMachine


func _ready():
	add_state("idel")
	add_state("follow")
	add_state("interact")
	call_deferred("set_state", states.idel)
	
	
	
func _state_logic(delta):
#	if states.follow:
#		parent._follow(delta)
		pass

func _get_transition(_delta):
	match state:
		states.idel:
			if parent.can_follow:
				return states.follow
		states.follow:
			if not parent.can_follow:
				return states.idel
				
	return  null
	
func _enter_state(new_state, _old_state):
	match new_state:
		states.idel:
			parent.animation_player.play("idel")
		states.follow:
			parent.animation_player.play("walking")
#			if parent.dist_travelled >= 1.0:
#				parent.walkS.play()
#				parent.dist_travelled = 0.0
	print(new_state)
func _exit_state(_old_state, _new_state):
	pass
