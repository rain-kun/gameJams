extends KinematicBody2D

func _ready():
	$AnimationPlayer.play("attack")


func _on_AttackZone_body_entered(body):
	if body.name == "Player":
		body.hit_box(1)

func hit_box():
	pass
