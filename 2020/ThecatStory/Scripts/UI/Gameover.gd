extends Control

onready var music = $"../MenuMusic"
export(String, FILE, "*.tscn") var next_scene

func _ready():
	music.play()
	$AnimatedSprite.hide()
#	$"../Player/PlayerHealth".hide()
	pass

func _on_Button_pressed():
	music.stop()
	$"../Player".hide()
	$AnimatedSprite.show()
	$AnimatedSprite.play("sleep")
	$Button/AudioStreamPlayer2D.play()
	$Button.hide()
	$name.hide()
	$AudioStreamPlayer2D.play()


func _on_AnimatedSprite_animation_finished():
	get_tree().change_scene(next_scene)


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		music.stop()
		$"../Player".hide()
		$AnimatedSprite.show()
		$AnimatedSprite.play("sleep")
		$Button/AudioStreamPlayer2D.play()
		$Button.hide()
		$AudioStreamPlayer2D.play()
		


func _on_Button2_pressed():
	get_tree().quit()
	


func _on_Exit_body_entered(body):
	if body.name == "Player":
		get_tree().quit()


func _on_Option_pressed():
	var option = true
	if option:
		option = false
		$Label.show()
	else:
		$Label.hide()
		option = true
	
