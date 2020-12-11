extends bat

func _chase_player():
	
	if player:

		dir = position.direction_to(target.position) * speed
			

		dir = move_and_slide(dir)

