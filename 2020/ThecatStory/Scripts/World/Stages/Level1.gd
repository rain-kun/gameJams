extends world


func _ready():
#	$NextLevel.hide()
#	$NextLevel/CollisionShape2D.disabled = true
	$items/MovingPlatform3.hide()
	$Timer.start()
	
	
	


func _on_BatBoss_dead(position):
	$items/AudioStreamPlayer2.play()
#	$NextLevel/CollisionShape2D.disabled = false
	$NextLevel.show()
	$items/MovingPlatform3.show()
	$Player/Camera2D.current = false
	$Camera2D.current = true
	$AnimationPlayer.play("end")
	yield(get_tree().create_timer(10),"timeout")
	$Camera2D.current = false
	$Player/Camera2D.current = true






func _on_BatBoss_get_hit():
	$items/Hurt.play()


func _on_Timer_timeout():
	$Timer2.start()

	var h = health.instance()
	h.position = $Position2D.position
	add_child(h)


func _on_Timer2_timeout():
	$Timer.start()
	
	var h = health.instance()
	h.position = $Position2D2.position
	add_child(h)
