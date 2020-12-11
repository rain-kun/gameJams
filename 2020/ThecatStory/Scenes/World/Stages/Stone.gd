extends Node2D



func _ready():
	$AudioStreamPlayer2D3.play()
	
	$AnimationPlayer.play("show")
	$Player/Control.hide()
	
	


func _on_AnimationPlayer_animation_finished(anim_name):
	$AnimationPlayer.play("light")
