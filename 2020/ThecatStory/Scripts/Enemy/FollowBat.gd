extends bat

export (PackedScene) var _health


func _chase_player():
	
	if player:
	#	if target.position - position >= Vector2(1,1):
		dir = position.direction_to(target.position) * speed
			
	# dir = dir.normalized()
	
#	var p_pos = get_parent().player_p
#	var _max = max(p_pos.x, p_pos.y)
#	var _x = p_pos.x/_max
#	var _y = p_pos.y/_max
#
#	position.x -= _x
#	position.y -= _y
#	print(dir)
		dir = move_and_slide(dir)





func _on_HitZone_bossbatbody_entered(body):
	$AudioStreamPlayer2D.play()



