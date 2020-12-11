extends Node2D

class_name world

export (PackedScene) var Fish
export (String) var Scene_name
export (PackedScene) var health

signal game_start
signal game_end

func _ready():
	randomize()
	connect("game_end", self, "_on_game_end")
#	$UI/AnimatedSprite.hide()
	$items/FishTimer.start()
	emit_signal("game_start")
	$items/AudioStreamPlayer.play(2)
	
	
func _on_Area2D_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene("res://Scenes/World/Stages/"+str(Scene_name) +".tscn")
#		$UI/AnimatedSprite.show()
#		$UI/AnimatedSprite.play("wakeup")
#		emit_signal("game_end")

#
#func _on_FishTimer_timeout():
#		# Choose a random location on Path2D.
#	$Path2D/PathFollow2D.set_offset(randi())
#	# Create a fish instance and add it to the scene.
#	var fish = Fish.instance()
#	add_child(fish)
#	# Set the fish's direction perpendicular to the path direction.
#	var direction = $Path2D/PathFollow2D.rotation - PI / 2
#	# Set the fish's position to a random location.
#	fish.position = $Path2D/PathFollow2D.position
#	# Add some randomness to the direction.
##	direction += rand_range(-PI / 4, PI / 4)
#	fish.rotation = direction
#	# Set the velocity (speed & direction).
#	fish.linear_velocity = Vector2(rand_range(fish.min_speed, fish.max_speed), 0)
#	fish.linear_velocity = fish.linear_velocity.rotated(direction)
#	connect("game_start", fish, "_on_game_start")
#	$items/FishTimer.start()


func _on_game_end():
	$items/EndTimer.start()


func _on_EndTimer_timeout():
	get_tree().change_scene("res://Main.tscn")


func _on_Bat_dead(_position):
	$items/AudioStreamPlayer2.play()
	var prob = randi() % 5
	if prob > 2:
		var h = health.instance()
		h.position = _position
		add_child(h)


func _on_Player_get_hit():
	$Player/AudioStreamPlayer2D.play()


func _on_Player_hit(item,_position,_direction):
	var b = item.instance()
	add_child(b)
	b.start(_position, _direction)
	

func _on_BatBoss_shot(batgum,_position, _direction):
	var gum = batgum.instance()
	add_child(gum)
	gum.start(_position, _direction)

func _on_BatBoss_spawn(bossbat,_position):
	var bat = bossbat.instance()
	add_child(bat)



func _on_Bat_get_hit():
	$items/Hurt.play()


func _on_WallSpider_dead(_position):
	$items/AudioStreamPlayer2.play()
#	var prob = randi() % 5
#	if prob > 2:
#		var h = health.instance()
#		h.position = _position
#		add_child(h)


func _on_WallSpider_get_hit():
	$items/Hurt1.play()


func _on_Ant_dead(_position):
	$items/AudioStreamPlayer2.play()
	var prob = randi() % 5
	if prob > 2:
		var h = health.instance()
		h.position = _position
		add_child(h)


func _on_Ant_get_hit():
	$items/Hurt2.play()
